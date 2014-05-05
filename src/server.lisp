;;;; -*- mode: lisp -*-
;;;;
;;;; This is a Common Lisp implementation of a Common Information Model (CIM)
;;;; client and server. It contains a CIM-XML encoding/decoding support and
;;;; transport over WBEM. It uses the Common Lisp libraries Drakma and Hunchentoot
;;;; for HTTP/HTTPS transport.
;;;; See documentation under /notes for implementation details and /examples for
;;;; sample code.
;;;; 
;;;; Copyright (C) 2013, Frank James <frank.a.james@gmail.com>
;;;;
;;;; You are granted the rights to distribute and use this software
;;;; as governed by the terms of the Lisp Lesser General Public License
;;;; (http://opensource.franz.com/preamble.html), also known as the LLGPL.


(in-package :climbe)

;; ------------------------------------

;; the server recieves the xml content
;; decoded the xml into Lisp using (decode-cim <xml>)
;; converts the decoded xml into a cim-message object using (decode-dispatch <decoded>)
;; dispatch to a server handler based on the message call

;; -----------------------------

(defun process-request (request)
  "Takes and processes a request object and returns a response object"
  (if (not (cim-request-intrinsic-p request))
      ;; extrinsic method invocation
      (let* ((name (cim-request-method request))
			 (path (cim-request-classpath request))
			 (namespace (cim-namespace request))			  
			 (cl (cim-class-by-name (cim-name path) namespace))
			 (meth (cim-method-by-name name cl)))
		(if meth
			(handler-case 
				(multiple-value-bind (return-value outparams)
					(invoke-method cl meth
								   (let ((args (cim-request-params request)))
									 ;; need to extract the arguments in the correct order
									 (mapcan (lambda (param)
											   (destructuring-parameter (param-name param-type qualifiers) param
											     (when (assoc* :in qualifiers)
												   (let ((arg (assoc* param-name args)))
													 ;; don't need to test if the arg is present, it could be an optional parameter
													 (list (third arg))))))
											 (cim-method-parameters meth))))
				  (make-cim-response name
									 return-value
									 (cim-method-return-type meth)
									 :outparams
									 (mapcan (lambda (param)
											   (destructuring-parameter (param-name param-type param-quals) param
											     (when (assoc :out param-quals)
												   (awhen (assoc* param-name outparams)
													 (list (make-cim-slot param-name param-type (cdr it)))))))
											   (cim-method-parameters meth))
									 :namespace (cim-namespace request)))
			  (cim-error-t (err)
				(make-cim-response name nil nil :errorinstance err))
			  (error ()
				(destructuring-bind (desc code) (cim-error-by-name :cim-err-failed)
				  (make-cim-response name nil nil
									 :errorinstance (make-condition 'cim-error-t :description desc :code code)))))
			;; no such method on this class
			(destructuring-bind (desc code) (cim-error-by-name :cim-err-not-found)
			  (make-cim-response name nil nil
								 :errorinstance (make-condition 'cim-error-t :description desc :code code)))))
	  
      ;; intrinsic method dispatcher
      (handler-case 
		  (let* ((name (make-keyword (cim-request-method request)))
				 (namespace (cim-namespace request))
				 (args (cim-request-params request))
				 (return-type nil)
				 (return-value
				  (case name
					(:getclass
					 (setf return-type :class)
					 (list (get-class-handler (third (assoc* :classname args)) namespace)))
					(:getinstance
					 (setf return-type :instance)
					 (let ((instancename (assoc* :instancename args)))
					   (if instancename 
						   (list (get-instance-handler (third instancename) namespace))
						   (cim-error :cim-err-invalid-parameter))))
					(:deleteinstance
					 (let ((instancename (assoc* :instancename args)))
					   (if instancename 
						   (delete-instance-handler (third instancename) namespace)
						   (cim-error :cim-err-invalid-parameter))))
					(:createinstance
					 (let ((newinstance (assoc* :newinstance args)))
					   (if newinstance
						   (create-instance-handler (third newinstance) namespace)
						   (cim-error :cim-err-invalid-parameter))))
					(:modifyinstance
					 (let ((modifiedinstance (assoc* :modifiedinstance args)))
					   (if modifiedinstance 
						   (modify-instance-handler (third modifiedinstance) namespace)
						   (cim-error :cim-err-invalid-parameter))))
					(:enumerateclasses
					 (setf return-type :class)
					 (enumerate-classes-handler namespace))
					(:enumerateclassnames
					 (setf return-type :classname)
					 (enumerate-class-names-handler namespace))
					(:enumerateinstances
					 (setf return-type :namedinstance)
					 (enumerate-instances-handler (third (assoc* :classname args)) namespace))
					(:enumerateinstancenames
					 (setf return-type :instancename)
					 (enumerate-instance-names-handler (third (assoc* :classname args)) namespace))
					#|			
					(:associators
					(setf return-type :value.objectwithpath)
					(let ((objectname (assoc :objectname args)))
					(associators-handler (third objectname)
					namespace
					:assocclass (third (assoc :assocclass args))
					:resultclass (third (assoc :resultclass args)))))
					(:associatornames
					(setf return-type :objectpath)
					(let ((objectname (assoc :objectname args)))					   
					(associator-names-handler (third objectname)
					namespace
					:assocclass (third (assoc :assocclass args))
					:resultclass (third (assoc :resultclass args)))))
					(:references
					(setf return-type :value.objectwithpath)
					(let ((objectname (assoc :objectname args)))
					(references-handler (third objectname)
					namespace
					:resultclass (third (assoc :resultclass args)))))
					(:referencenames
					(setf return-type :objectpath)
					(let ((objectname (assoc :objectname args)))
					(reference-names-handler (third objectname)
					namespace
					:resultclass (third (assoc :resultclass args)))))
					|#
					(otherwise (cim-error :cim-err-not-supported)))))
			(make-cim-response name return-value return-type :intrinsicp t :namespace namespace))
		(cim-error-t (err)
		  (make-cim-response (cim-request-method request) nil nil :intrinsicp t :errorinstance err)))))


;; handle a CIM message
(defun handle-cim-call (message &key (encoding :cimxml))
  "Take a message object, process it, generate a return message object"
  (let* ((request (cim-message-contents message))
		 (response (process-request request))
		 (rmsg (make-cim-message response (cim-message-id message))))
    ;; set headers to signal an error 
    (awhen (cim-response-error response)
      (setf (hunchentoot:header-out :cimstatuscode) (cim-error-code it)
			(hunchentoot:header-out :cimstatuscodedescription) (cim-error-description it)))
    ;; finally encode the return message
    (cim-encode rmsg :encoding encoding)))

(defun decode-content (content &key (encoding :cimxml))
  "Safely decodes the content string into a Lisp message object"
  (handler-case
	  (with-input-from-string (s content)
		(cim-decode s :encoding encoding))
    (error ()
      (setf (hunchentoot:header-out :cimstatuscode) 1
			(hunchentoot:header-out :cimstatuscodedescription) "Decoding content failed")
      nil)))

;; ---------------------

;; store a list acceptors. might need more if e.g. listening on a 2nd port
(defvar *cim-acceptors* nil)

(defclass cim-acceptor (hunchentoot:acceptor)
  ((auth-handler :initarg :auth-handler :initform nil)
   (encoding :initarg :encoding :initform :cimxml)))

(defclass cim-ssl-acceptor (hunchentoot:ssl-acceptor)
  ((auth-handler :initarg :auth-handler :initform nil)
   (encoding :initarg :encoding :initform :cimxml)))

(defun acceptor-handler (acceptor request)
  (let* ((encoded (let ((data (hunchentoot:raw-post-data)))
					(cond
					  ((stringp data) data)
					  ((vectorp data) (map 'string #'code-char data))
					  (t (error "Don't understand ~S" data)))))
		 (headers (hunchentoot:headers-in*))
		 (message (decode-content encoded :encoding (slot-value acceptor 'encoding))))
    (declare (ignorable headers))

    (setf (hunchentoot:content-type*) "text/xml"
		  (hunchentoot:header-out :cimoperation) "MethodResponse")
    
    ;; check authorization
    (let ((ahandler (slot-value acceptor 'auth-handler)))
      (multiple-value-bind (username password) (hunchentoot:authorization request)
		(cond
		  ((null message)
		   ;; an error occured during xml decoding or decoding into a message
		   (destructuring-bind (message code) (cim-error-by-name :cim-err-failed)
			 (setf (hunchentoot:header-out :cimstatuscode) code
				   (hunchentoot:header-out :cimstatuscodedescription) message))
		   (cim-encode
			(make-cim-message
			 (make-cim-response
			  (let ((methname (cdr (assoc :cimmethod headers))))
				(if methname methname "Error"))
			  nil nil
			  :errorinstance
			  (make-condition 'cim-error-t
							  :description "Error parsing content"
							  :code 1)))))
		  ((or (null ahandler) (and username password (funcall ahandler username password)))
		   (let ((return-result (handle-cim-call message :encoding (slot-value acceptor 'encoding))))
			 return-result))
		  (t
		   (setf (hunchentoot:return-code*) hunchentoot:+http-forbidden+)
		   ""))))))

(defmethod hunchentoot:acceptor-dispatch-request
    ((acceptor cim-acceptor) request)
  (acceptor-handler acceptor request))

(defmethod hunchentoot:acceptor-dispatch-request
    ((acceptor cim-ssl-acceptor) request)
  (acceptor-handler acceptor request))

;; start the server
(defun start-cim-server (&key port (encoding :cimxml)
			   ssl-certificate-file ssl-privatekey-file
			   ssl-privatekey-password
			   auth-handler)
  "Start the CIM server on PORT. It will serve any url, not just /CIMOM etc.

If both SSL-CERTIFICATE-FILE and SSL-PRIVATEKEY-FILE are provided, starts
an ssl server. See the hunchentoot documentation for the meaning of these parameters.

If basic authentication is required, AUTH-HANDLER must be set to a function
accepting 2 parameters, the username and password provided by the request. It
should return non-nil on successful authentication.

Encoding must be either :CIMXML or :WSMAN. WS-Man encoding is not currently supported.
"

  (unless port
    (if (and ssl-certificate-file ssl-privatekey-file)
	(setf port *cim-default-ssl-port*)
	(setf port *cim-default-port*)))
  
  (if (assoc port *cim-acceptors*)
      ;; already have a server on this port, error
      (error "Server already running. Stop it first"))

  (ecase encoding
    (:cimxml nil)
    (:wsman (error "WS-Man encoding is not currently supported")))
  
  ;; start the server 
  (let ((acceptor
		 (if (and ssl-certificate-file ssl-privatekey-file)
			 ;; ssl
			 (make-instance
			  'cim-ssl-acceptor
			  :encoding encoding
			  :port port
			  :ssl-certificate-file ssl-certificate-file
			  :ssl-privatekey-file ssl-privatekey-file
			  :ssl-privatekey-password ssl-privatekey-password
			  :auth-handler auth-handler)
			 
			 (make-instance
			  'cim-acceptor
			  :encoding encoding
			  :port port
			  :auth-handler auth-handler))))

    (hunchentoot:start acceptor)
    (push (cons port acceptor) *cim-acceptors*)
    acceptor))

;; stop the server 

(defun stop-cim-server (&optional port)
  "Stop the CIM server"
  (cond
    ((null *cim-acceptors*) (error "No server running"))
    ((null port) (hunchentoot:stop (cdr (pop *cim-acceptors*))))
    (t (let ((acc (assoc port *cim-acceptors*)))
		 (if acc
			 (hunchentoot:stop (cdr acc))
			 (error "No acceptor on that port"))
		 (setf *cim-acceptors*
			   (remove port *cim-acceptors* :key #'car))
		 port))))

;; ----------------- intrinsic method handlers ------------------

;; <class>GetClass ( 
;;         [IN] <className> ClassName, 
;;         [IN,OPTIONAL] boolean LocalOnly = true,
;;         [IN,OPTIONAL] boolean IncludeQualifiers = true, 
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun get-class-handler (classname namespace &key localonly includequalifiers includeclassorigin propertylist)
  (declare (ignore localonly includequalifiers includeclassorigin propertylist))
  (format *standard-output* "classname: ~S namespace: ~S~%" classname namespace)
  (aif (cim-class-by-name classname namespace)
       it
       (cim-error :cim-err-not-found classname)))

;; <instance>GetInstance ( 
;;         [IN] <instanceName> InstanceName, 
;;         [IN,OPTIONAL] boolean LocalOnly = true,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun get-instance-handler (instancepath namespace &key includeclassorigin propertylist)
  (declare (ignore includeclassorigin propertylist))
  (let* ((cl (cim-class-by-name (cim-name instancepath) namespace))
		 (instance (make-cim-instance (cim-name instancepath)
									  (cim-keys instancepath))))
    (if cl
		(get-instance cl instance)
		(cim-error :cim-err-not-found))))

;; void  DeleteClass ( 
;;        [IN] <className> ClassName 
;; )

;; void  DeleteInstance ( 
;;         [IN] <instanceName> InstanceName 
;; )
(defun delete-instance-handler (instancepath namespace)
  (let* ((cl (cim-class-by-name (cim-name instancepath) namespace))
		 (instance (make-cim-instance (cim-name instancepath)
									  (cim-keys instancepath))))
    (if cl
		(delete-instance (cim-name instancepath) instance)
		(cim-error :cim-err-not-found))
    nil))

;; void CreateClass ( 
;;        [IN] <class> NewClass 
;; )

;; ################## got here ###########################
;; <instanceName>CreateInstance ( 
;;        [IN] <instance> NewInstance 
;; )
(defun create-instance-handler (instance namespace)
  (let ((cl (cim-class-by-name (cim-name instance) namespace)))
    (if cl
		(create-instance cl instance)
		(cim-error :cim-err-not-found))
    nil))

;;void ModifyClass ( 
;;        [IN] <class> ModifiedClass 
;; )

;; void ModifyInstance ( 
;;        [IN] <namedInstance> ModifiedInstance, 
;;        [IN, OPTIONAL] boolean IncludeQualifiers = true,  (DEPRECATED)
;;        [IN, OPTIONAL, NULL] string propertyList[] = NULL 
;; )
(defun modify-instance-handler (modifiedinstance namespace &key propertylist)
  (declare (ignore propertylist))
  (let ((cl (cim-class-by-name (cim-name modifiedinstance) namespace)))
    (if cl
		(modify-instance cl modifiedinstance)
		(cim-error :cim-err-not-found))
    nil))

;;<class>*EnumerateClasses ( 
;;         [IN,OPTIONAL,NULL] <className> ClassName=NULL, 
;;         [IN,OPTIONAL] boolean DeepInheritance = false,
;;         [IN,OPTIONAL] boolean LocalOnly = true, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = true, 
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false 
;; )
(defun enumerate-classes-handler (namespace &key classname deepinheritance localonly includequalifiers includeclassorigin)
  (declare (ignore classname deepinheritance localonly includequalifiers includeclassorigin))
  (namespace-classes namespace))

;;<className>*EnumerateClassNames ( 
;;         [IN,OPTIONAL,NULL] <className> ClassName = NULL, 
;;         [IN,OPTIONAL] boolean DeepInheritance = false 
;; )
(defun enumerate-class-names-handler (namespace &key classname deepinheritance)
  (declare (ignore classname deepinheritance))
  (let ((classes (namespace-classes namespace)))
    (mapcar (lambda (cl)
			  (string (cim-name cl)))
			classes)))

;;<namedInstance>*EnumerateInstances ( 
;;         [IN] <className> ClassName, 
;;         [IN,OPTIONAL] boolean LocalOnly = true,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean DeepInheritance = true, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun enumerate-instances-handler (classname namespace &key deepinheritance includeclassorigin propertylist)
  (declare (ignore deepinheritance includeclassorigin propertylist))
  (let ((cl (cim-class-by-name classname namespace)))
    (if cl
		(let ((insts (enumerate-instances cl)))
		  (mapcar (lambda (inst)
					(list inst (cim-instance-reference cl inst)))
				  insts))
		(cim-error :cim-err-not-found classname))))

;;<instanceName>*EnumerateInstanceNames ( 
;;         [IN] <className> ClassName 
;; )
(defun enumerate-instance-names-handler (classname namespace)
  (let ((cl (cim-class-by-name classname namespace)))
    (if cl
		(mapcar (lambda (instance)
				  (let ((ref (cim-instance-reference cl instance)))
					(setf (cim-namespace ref) namespace)
					ref))
				(enumerate-instances cl))
		(cim-error :cim-err-not-found classname))))

;; <object>*ExecQuery ( 
;;         [IN] string QueryLanguage, 
;;         [IN] string Query 
;; )

;;<objectWithPath>*Associators ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> AssocClass = NULL,
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL, 
;;         [IN,OPTIONAL,NULL] string Role = NULL, 
;;         [IN,OPTIONAL,NULL] string ResultRole = NULL, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false, (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )

;; <objectPath>*AssociatorNames ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> AssocClass = NULL, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL, 
;;         [IN,OPTIONAL,NULL] string Role = NULL, 
;;         [IN,OPTIONAL,NULL] string ResultRole = NULL 
;; )

;; <objectWithPath>*References ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL,
;;         [IN,OPTIONAL,NULL] string Role = NULL, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )

;;<objectPath>*ReferenceNames ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL, 
;;         [IN,OPTIONAL,NULL] string Role = NULL 
;; )

;; <propertyValue>GetProperty ( 
;;         [IN] <instanceName> InstanceName, 
;;         [IN] string PropertyName 
;; )
(defun get-property-handler (instancename propertyname namespace)
  "Get the value of a particular instance property"
  ;; get the instance and pull out the property named
  (let ((class (cim-class-by-name (cim-name instancename) namespace))
		(inst (get-instance-handler instancename namespace)))
    (if inst
		(cim-slot-value inst propertyname)
		(let ((prop (get-property class inst propertyname)))
		  (if prop
			  (cim-slot-value inst propertyname)
			  (cim-error :cim-err-not-found propertyname))))))

;;void SetProperty ( 
;;         [IN] <instanceName> InstanceName, 
;;         [IN] string PropertyName, 
;;         [IN,OPTIONAL,NULL] <propertyValue> NewValue = NULL 
;; )
(defun set-property-handler (instancename propertyname newvalue namespace)
  (let ((class (cim-class-by-name (cim-name instancename) namespace))
		(inst (get-instance-handler instancename namespace)))
    (if inst
		(set-property class inst propertyname newvalue)
		(cim-error :cim-err-not-found))))

;;<qualifierDecl>GetQualifier ( 
;;         [IN] string QualifierName 
;; )

;;void SetQualifier ( 
;;         [IN] <qualifierDecl> QualifierDeclaration 
;;

;;void DeleteQualifier ( 
;;         [IN] string QualifierName 
;; )

;; <qualifierDecl>*EnumerateQualifiers ( 
;; )

