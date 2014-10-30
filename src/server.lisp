

(in-package :climbe)



(defun process-request (request)
  "Takes a CIM-REQUEST object and returns a CIM-RESPONSE object."
  (declare (type cim-request request))
  (let ((method (cim-request-method-name request)))
    (cond
      ((string-equal method-name "GetInstance")
       (handle-get-instance 

(defun handle-request (acceptor request)
  "Takes Hunchentoot acceptor and request objects, decodes the post data from the request, passes the corresponding CIM-REQUEST object to PROCESS-REQUEST then encodes a CIM response to return."
  nil)









;; need to make the message objects

;; <class>GetClass ( 
;;         [IN] <className> ClassName, 
;;         [IN,OPTIONAL] boolean LocalOnly = true,
;;         [IN,OPTIONAL] boolean IncludeQualifiers = true, 
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun handle-get-class (namespace class-name)
  "Find the class in the namespace specified and return it."
  (let ((ns (find-namespace namespace)))
    (if ns 
        (let ((cl (find-cim-class class-name ns)))
          (if cl 
              cl
              (cim-error :not-found (format nil "Class ~S not found" class-name))))
        (cim-error :invalid-namespace namespace))))

;; <instance>GetInstance ( 
;;         [IN] <instanceName> InstanceName, 
;;         [IN,OPTIONAL] boolean LocalOnly = true,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun handle-get-instance (instance-name)
  "Convert a CIM-INSTANCE object into an instance of the real CLOS class, then pass it to GET-INSTANCE."
  (get-instance (convert-cim-instance instance-name)))
   
;;void  DeleteClass ( 
;;        [IN] <className> ClassName 
;; )

;;void  DeleteInstance ( 
;;         [IN] <instanceName> InstanceName 
;; )
(defun handle-delete-instance (instance-name)
  (delete-instance (convert-cim-instance instance-name)))

;;void CreateClass ( 
;;        [IN] <class> NewClass 
;; )

;;CreateInstance
;; <instanceName>CreateInstance ( 
;;        [IN] <instance> NewInstance 
;; )
(defun handle-create-instance (new-instance)
  (create-instance (convert-cim-instance new-instance)))

;;void ModifyClass ( 
;;        [IN] <class> ModifiedClass 
;; )

;;void ModifyInstance ( 
;;        [IN] <namedInstance> ModifiedInstance, 
;;        [IN, OPTIONAL] boolean IncludeQualifiers = true,  (DEPRECATED)
;;        [IN, OPTIONAL, NULL] string propertyList[] = NULL 
;; )
(defun handle-modify-instance (modified-instance)
  (modify-instance (convert-cim-instance modified-instance)))

;; <class>*EnumerateClasses ( 
;;         [IN,OPTIONAL,NULL] <className> ClassName=NULL, 
;;         [IN,OPTIONAL] boolean DeepInheritance = false,
;;         [IN,OPTIONAL] boolean LocalOnly = true, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = true, 
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false 
;; )
(defun handle-enumerate-classes (namespace)
  (let ((ns (find-namespace namespace)))
    (if ns
        (cim-namespace-classes ns)
        (cim-error :invalid-namespace namespace))))

;;<className>*EnumerateClassNames ( 
;;         [IN,OPTIONAL,NULL] <className> ClassName = NULL, 
;;         [IN,OPTIONAL] boolean DeepInheritance = false 
;; )
(defun handle-enumerate-class-names (namespace)
  (let ((ns (find-namespace namespace)))
    (if ns
        (mapcar #'cim-name (cim-namespace-classes ns))
        (cim-error :invalid-namespace namespace))))

      
;;<namedInstance>*EnumerateInstances ( 
;;         [IN] <className> ClassName, 
;;         [IN,OPTIONAL] boolean LocalOnly = true,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean DeepInheritance = true, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun handle-enumerate-instances (class-name namespace)
  (let ((ns (find-namespace namespace)))
    (if ns
        (let ((cl (find-cim-class class-name ns)))
          (if cl
              (enumerate-instances (class-name cl))
              (cim-error :invalid-class class-name)))
        (cim-error :invalid-namespace namespace))))

;;<instanceName>*EnumerateInstanceNames ( 
;;         [IN] <className> ClassName 
;; )
(defun handle-enumerate-instance-names (class-name namespace)
  (let ((instances (handle-enumerate-instances class-name namespace)))
    (mapcar #'instance-to-cim-instance instances)))


;; <object>*ExecQuery ( 
;;         [IN] string QueryLanguage, 
;;         [IN] string Query 
;; )

;; <objectWithPath>*Associators ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> AssocClass = NULL,
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL, 
;;         [IN,OPTIONAL,NULL] string Role = NULL, 
;;         [IN,OPTIONAL,NULL] string ResultRole = NULL, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false, (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )

;; FIXME!!!!
(defun handle-associators (object)
  (if (cim-class-declaration-p object)
      ;; is a class. find its associated classes
      nil
      ;; is an instance. call the provider method 
      (association-instances object nil)))

;; <objectPath>*AssociatorNames ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> AssocClass = NULL, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL, 
;;         [IN,OPTIONAL,NULL] string Role = NULL, 
;;         [IN,OPTIONAL,NULL] string ResultRole = NULL 
;; )
(defun handle-associator-names (object)
  nil)

;; <objectWithPath>*References ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL,
;;         [IN,OPTIONAL,NULL] string Role = NULL, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun handle-references (object)
  nil)

;;<objectPath>*ReferenceNames ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL, 
;;         [IN,OPTIONAL,NULL] string Role = NULL 
;; )
(defun handle-reference-names (object)
  nil)

;; <propertyValue>GetProperty ( 
;;         [IN] <instanceName> InstanceName, 
;;         [IN] string PropertyName 
;; )

;; void SetProperty ( 
;;         [IN] <instanceName> InstanceName, 
;;         [IN] string PropertyName, 
;;         [IN,OPTIONAL,NULL] <propertyValue> NewValue = NULL 
;; )

;; <qualifierDecl>GetQualifier ( 
;;         [IN] string QualifierName 
;; )

;; void SetQualifier ( 
;;         [IN] <qualifierDecl> QualifierDeclaration 
;; )

;; void DeleteQualifier ( 
;;         [IN] string QualifierName 
;; )

;; <qualifierDecl>*EnumerateQualifiers ( 
;; )


(defun handle-invoke (method-name class-name namespace)
  (let ((meth (find-cim-method method-name (find-cim-class class-name (find-namespace namespace)))))
    (apply (cim-method-function meth)
           (cim-method-in-params meth))))


















(defvar *cim-acceptor* nil)


;; subclass the hunchentoot acceptor
(defclass cim-acceptor (hunchentoot:acceptor)
  ())

(defclass cim-ssl-acceptor (hunchentoot:ssl-acceptor)
  ())


;; specialize the dispatch methods 
(defmethod hunchentoot:acceptor-dispatch-request ((acceptor cim-acceptor) request)
  (handle-cim-request acceptor request))

(defmethod hunchentoot:acceptor-dispatch-request ((acceptor cim-ssl-acceptor) request)
  (handle-cim-request acceptor request))


(defun handle-cim-request (acceptor request)
  "Do the actions specified in the request and send output back to the acceptor."
  (declare (type cim-request request))
  



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
