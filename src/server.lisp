

(in-package :climbe)

(defmacro destructuring-request ((request namespace-var) arg-list &body body)
  (let ((gargs (gensym "ARGS"))
		(grequest (gensym "REQUEST")))
	`(let* ((,grequest ,request)
			(,namespace-var
			 (let ((ns (find-namespace (namespace-path-string (cim-request-namespace-path ,grequest)))))
			   (if ns ns (cim-error :invalid-namespace)))))
	   (destructuring-bind ,arg-list
		   (let ((,gargs (cim-request-arguments ,grequest)))
			 (labels ((find-arg (name)
						(find name ,gargs :key #'car :test #'string-equal)))
			   (list ,@(mapcar (lambda (var)
								 `(find-arg ,(symbol-name var)))
							   arg-list))))
	   ,@body))))


							 
(defun process-request (request)
  "Takes a CIM-REQUEST object and returns a CIM-RESPONSE object."
  (declare (type cim-request request))
  (let ((method-name (cim-request-method-name request)))
    (handler-case 
	(if (cim-request-intrinsic-p request)
	    (multiple-value-bind (return-value return-type) (process-intrinsic-request request)
	      (make-cim-response :method-name method-name
				 :intrinsic-p t
				 :return-value return-value 
				 :return-type return-type))
	    (multiple-value-bind (return-value out-params) (process-extrinsic-request request)
	      (make-cim-response :method-name method-name
				 :return-value return-value
				 :out-parameters out-params)))
      (cim-error (err) 
	(make-cim-response :method-name method-name 
			   :intrinsic-p t
			   :error err))
      (error (err) 
	(make-cim-response :method-name method-name
			   :intrinsic-p t
			   :error (make-cim-error :failed (format nil "~A" err)))))))
	
(defun process-intrinsic-request (request)
  "Returns (VALUES return-value return-type). RETURN-TYPE should be a keyword indicating
the encoding element type, as listed in ENCODE-CIMXML-IRETURNVALUE."
  ;; FIXME: intern to a keyword? shouldn't really be doing all these strcmps
  (let ((method-name (cim-request-method-name request)))
    (case method-name 
      ((string-equal method-name "GetClass")
       (handle-get-class request))
      ((string-equal method-name "GetInstance")
       (handle-get-instance request))
      ((string-equal method-name "DeleteInstance")
       (handle-delete-instance request))
      ((string-equal method-name "CreateInstance")
       (handle-create-instance request))
      ((string-equal method-name "ModifyInstance")
       (handle-modify-instance request))
      ((string-equal method-name "EnumerateClasses")
       (handle-enumerate-classes request))
      ((string-equal method-name "EnumerateClassNames")
       (handle-enumerate-class-names request))
      ((string-equal method-name "EnumerateInstances")
       (handle-enumerate-instances request))
      ((string-equal method-name "EnumerateInstanceNames")
       (handle-enumerate-instance-names request))
      ((string-equal method-name "Associators")
       (handle-associators request))
      ((string-equal method-name "AssociatorNames")
       (handle-associator-names request))
      ((string-equal method-name "References")
       (handle-references request))
      ((string-equal method-name "ReferenceNames")
       (handle-reference-names request))
      (t (cim-error :not-supported method-name)))))
  
(defun process-extrinsic-request (request)
  "Returns (VALUES return-value out-params). OUT-PARAMS should be a list of (param-name value type)."
  (declare (ignore request))
  (cim-error :not-supported "Extrinsic methods not supported"))
	  
(defun handle-request (acceptor request)
  "Takes Hunchentoot acceptor and request objects, decodes the post data from the request, passes the 
corresponding CIM-REQUEST object to PROCESS-REQUEST then encodes a CIM response to return."
  (declare (ignore acceptor request))
  (let ((content (hunchentoot:raw-post-data :force-binary t)))
    (handler-case 
	(let ((message (decode-cimxml-cim (decode-xml-octets content))))
	  (setf (hunchentoot:content-type*) "text/xml"
		(hunchentoot:header-out :cimoperation) "MethodResponse")
	  (let ((request (cim-message-request message)))
	    (encode-cimxml-response 
	     (if (consp request)
		 (mapcar #'process-request request)
		 (let ((response (process-request request)))
		   ;; set the CIM headers
		   (when (cim-response-error response)
		     (setf (hunchentoot:header-out :cimstatuscode) 
			   (cim-error-code (cim-response-error response))))
		   response))
	     :id (cim-message-id message))))
      (error (err)
	(hunchentoot:log-message* :error "~A" err)
	(setf (hunchentoot:content-type*) "text/xml"
	      (hunchentoot:header-out :cimerror) "request-not-valid"
	      (hunchentoot:header-out :cimoperation) "MethodResponse"
	      (hunchentoot:return-code*) hunchentoot:+http-bad-request+)
	""))))



;; ---------- hunchentoot server ------------------

(defvar *cim-acceptors* nil
  "List of hunchentoot acceptors for the CIM server.")


;; subclass the hunchentoot acceptor
(defclass cim-acceptor (hunchentoot:acceptor)
  ())

(defclass cim-ssl-acceptor (hunchentoot:ssl-acceptor)
  ())


;; specialize the dispatch methods 
(defmethod hunchentoot:acceptor-dispatch-request ((acceptor cim-acceptor) request)
  (handle-request acceptor request))

(defmethod hunchentoot:acceptor-dispatch-request ((acceptor cim-ssl-acceptor) request)
  (handle-request acceptor request))


;; default ports
(defparameter *default-port* 5988
  "Default HTTP port for CIM server.")
(defparameter *default-ssl-port* 5989
  "Default HTTPS port for CIM server.")


;; start the server
(defun start-cim-server (&key port
			   ssl-certificate-file ssl-privatekey-file
			   ssl-privatekey-password)
  "Start the CIM server on PORT. It will serve any url, not just /CIMOM etc.

If both SSL-CERTIFICATE-FILE and SSL-PRIVATEKEY-FILE are provided, starts
an ssl server. See the hunchentoot documentation for the meaning of these parameters.
"

  ;; set the port if not specified
  (unless port
    (if (and ssl-certificate-file ssl-privatekey-file)
	(setf port *default-ssl-port*)
	(setf port *default-port*)))
  
  ;; start the server 
  (let ((acceptor
	 (if (and ssl-certificate-file ssl-privatekey-file)
	     ;; ssl
	     (make-instance
	      'cim-ssl-acceptor
	      :port port
	      :ssl-certificate-file ssl-certificate-file
	      :ssl-privatekey-file ssl-privatekey-file
	      :ssl-privatekey-password ssl-privatekey-password)
	     
	     (make-instance
	      'cim-acceptor
	      :port port))))

    (start-cim-server* acceptor)))

(defun start-cim-server* (acceptor)
  (when (assoc (hunchentoot:acceptor-port acceptor) *cim-acceptors*)
	;; already have a server on this port, error
	(error "Server already running. Stop it first"))
  (hunchentoot:start acceptor)
  (push (cons (hunchentoot:acceptor-port acceptor) acceptor)
		*cim-acceptors*)
  acceptor)

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


;; -------------------- various intrinsic method handlers follow -----------------

;; need to make the message objects

;; <class>GetClass ( 
;;         [IN] <className> ClassName, 
;;         [IN,OPTIONAL] boolean LocalOnly = true,
;;         [IN,OPTIONAL] boolean IncludeQualifiers = true, 
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun handle-get-class (request)
  "Find the class in the namespace specified and return it."
  (destructuring-request (request namespace)
      (classname localonly includequalifiers includeclassorigin propertylist)
    (declare (ignore localonly includequalifiers includeclassorigin propertylist))
    (let ((cl (find-cim-class classname namespace)))
      (if cl 
	  (values cl :class)
	  (cim-error :not-found
		     (format nil "Class ~S not found" classname))))))

;; <instance>GetInstance ( 
;;         [IN] <instanceName> InstanceName, 
;;         [IN,OPTIONAL] boolean LocalOnly = true,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun handle-get-instance (request)
  "Convert a CIM-INSTANCE object into an instance of the real CLOS class, then pass it to GET-INSTANCE."
  (destructuring-request (request namespace)
      (instancename includeclassorigin propertylist)
    (declare (ignore includeclassorigin propertylist))
    (values (get-instance (convert-cim-instance instancename namespace))
	    :instance)))
   
;;void  DeleteClass ( 
;;        [IN] <className> ClassName 
;; )

;;void  DeleteInstance ( 
;;         [IN] <instanceName> InstanceName 
;; )
(defun handle-delete-instance (request)
  (destructuring-request (request namespace) (instancename)
    (delete-instance (convert-cim-instance instancename namespace)))
  nil)

;;void CreateClass ( 
;;        [IN] <class> NewClass 
;; )

;;CreateInstance
;; <instanceName>CreateInstance ( 
;;        [IN] <instance> NewInstance 
;; )
(defun handle-create-instance (request)
  (destructuring-request (request namespace) (newinstance)
    (values (create-instance (convert-cim-instance newinstance namespace))
	    :instancename)))

;;void ModifyClass ( 
;;        [IN] <class> ModifiedClass 
;; )

;;void ModifyInstance ( 
;;        [IN] <namedInstance> ModifiedInstance, 
;;        [IN, OPTIONAL] boolean IncludeQualifiers = true,  (DEPRECATED)
;;        [IN, OPTIONAL, NULL] string propertyList[] = NULL 
;; )
(defun handle-modify-instance (request)
  (destructuring-request (request namespace) (modifiedinstance propertylist)
    (declare (ignore propertylist))
    (modify-instance (convert-cim-instance modifiedinstance namespace)))
  nil)

;; <class>*EnumerateClasses ( 
;;         [IN,OPTIONAL,NULL] <className> ClassName=NULL, 
;;         [IN,OPTIONAL] boolean DeepInheritance = false,
;;         [IN,OPTIONAL] boolean LocalOnly = true, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = true, 
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false 
;; )
(defun handle-enumerate-classes (request)
  (destructuring-request (request namespace) ()
    (values (mapcar #'class-to-declaration (cim-namespace-classes namespace))
	    :class)))
  
;;<className>*EnumerateClassNames ( 
;;         [IN,OPTIONAL,NULL] <className> ClassName = NULL, 
;;         [IN,OPTIONAL] boolean DeepInheritance = false 
;; )
(defun handle-enumerate-class-names (request)
  (destructuring-request (request namespace) ()
    (values (mapcar #'cim-name (cim-namespace-classes namespace))
	    :classname)))

      
;;<namedInstance>*EnumerateInstances ( 
;;         [IN] <className> ClassName, 
;;         [IN,OPTIONAL] boolean LocalOnly = true,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean DeepInheritance = true, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun handle-enumerate-instances (request)
  (destructuring-request (request namespace) (classname)
    (let ((cl (find-cim-class classname namespace)))
      (if cl
	  (values (enumerate-instances (class-name cl))
		  :value.namedinstance)
	  (cim-error :invalid-class classname)))))

;;<instanceName>*EnumerateInstanceNames ( 
;;         [IN] <className> ClassName 
;; )
(defun handle-enumerate-instance-names (request)  
  (let ((instances (handle-enumerate-instances request)))
    (values (mapcar #'instance-to-cim-instance instances)
	    :instancename)))

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
(defun handle-associators (request)
  (destructuring-request (request namespace) (objectname assocclass resultclass role resultrole propertylist)
    (if (cim-class-declaration-p objectname)
	;; is a class. find its associated classes
	nil
	;; is an instance. call the provider method 
	(values 
	 (let ((path (namespace-path namespace)))
	   (mapcar (lambda (inst)
		     (list inst path))
		   (association-instances objectname
					  (when assocclass
					    (find-cim-class assocclass namespace))
					  :result-class resultclass
					  :role role
					  :result-role resultrole
					  :property-list propertylist)))
	 :value.objectwithpath))))

;; <objectPath>*AssociatorNames ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> AssocClass = NULL, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL, 
;;         [IN,OPTIONAL,NULL] string Role = NULL, 
;;         [IN,OPTIONAL,NULL] string ResultRole = NULL 
;; )
(defun handle-associator-names (request)
  (let ((insts (car (handle-associators request))))
    (values 
     (mapcar (lambda (obj-path)
	       (destructuring-bind (obj path) obj-path
		 (if (typep obj 'cim-class)
		     (list obj path)
		     (list (instance-to-cim-instance obj) path))))
	     insts)
     :value.objectwithpath)))

;; <objectWithPath>*References ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL,
;;         [IN,OPTIONAL,NULL] string Role = NULL, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun handle-references (request)
  (destructuring-request (request namespace) (objectname resultclass role propertylist)
    (if (cim-class-declaration-p objectname)
	;; find all the referenced classes of this class
	(let ((cl (find-class (cim-class-declaration-name namespace))))
	  (declare (ignore cl))
	  nil)
	(let ((insts 
	       (reference-instances objectname
				    :result-class resultclass
				    :role role
				    :property-list propertylist)))
	  (values (let ((path (namespace-path namespace)))
		    (mapcar (lambda (inst)
			      (list inst path))
			      insts))
		  :value.objectwithpath)))))

;;<objectPath>*ReferenceNames ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL, 
;;         [IN,OPTIONAL,NULL] string Role = NULL 
;; )
(defun handle-reference-names (request)
  (let ((insts (car (handle-references request))))
    (values 
     (mapcar (lambda (obj-path)
	       (destructuring-bind (obj path) obj-path
		 (if (typep obj 'cim-class)
		     (list obj path)
		     (list (instance-to-cim-instance obj)
			   path))))
	     insts)
     :value.objectwithpath)))

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
















