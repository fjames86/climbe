

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
  (if (cim-request-intrinsic-p request)
	  (let ((method-name (cim-request-method-name request)))
		(cond
		  ((string-equal method-name "GetClass")
		   (handle-get-class request))
		  ((string-equal method-name "GetInstance")
		   (handle-get-instance request))
		  ((string-equal method-name "DeleteInstance")
		   (handle-get-instance request))
		  ((string-equal method-name "CreateInstance")
		   (handle-get-instance request))
		  ((string-equal method-name "ModifyInstance")
		   (handle-get-instance request))
		  ((string-equal method-name "EnumerateClasses")
		   (handle-get-instance request))
		  ((string-equal method-name "EnumerateClassNames")
		   (handle-get-instance request))
		  ((string-equal method-name "EnumerateInstances")
		   (handle-get-instance request))
		  ((string-equal method-name "EnumerateInstanceNames")
		   (handle-get-instance request))
		  ((string-equal method-name "Associators")
		   (handle-get-instance request))
		  ((string-equal method-name "AssociatorNames")
		   (handle-get-instance request))
		  ((string-equal method-name "References")
		   (handle-get-instance request))
		  ((string-equal method-name "ReferenceNames")
		   (handle-get-instance request))
		  (t (cim-error :not-supported method-name))))
	  (cim-error :not-supported "extrinsic methods not supported")))
	

	  
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
(defun handle-get-class (request)
  "Find the class in the namespace specified and return it."
  (destructuring-request (request namespace)
	  (classname localonly includequalifiers includeclassorigin propertylist)
	(declare (ignore localonly includequalifiers includeclassorigin propertylist))
	(let ((cl (find-cim-class classname namespace)))
	  (if cl 
		  cl
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
	(get-instance (convert-cim-instance instancename namespace))))
   
;;void  DeleteClass ( 
;;        [IN] <className> ClassName 
;; )

;;void  DeleteInstance ( 
;;         [IN] <instanceName> InstanceName 
;; )
(defun handle-delete-instance (request)
  (destructuring-request (request namespace) (instancename)
	(delete-instance (convert-cim-instance instancename namespace))))

;;void CreateClass ( 
;;        [IN] <class> NewClass 
;; )

;;CreateInstance
;; <instanceName>CreateInstance ( 
;;        [IN] <instance> NewInstance 
;; )
(defun handle-create-instance (request)
  (destructuring-request (request namespace) (newinstance)
	(create-instance (convert-cim-instance newinstance namespace))))

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
	(modify-instance (convert-cim-instance modifiedinstance namespace))))

;; <class>*EnumerateClasses ( 
;;         [IN,OPTIONAL,NULL] <className> ClassName=NULL, 
;;         [IN,OPTIONAL] boolean DeepInheritance = false,
;;         [IN,OPTIONAL] boolean LocalOnly = true, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = true, 
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false 
;; )
(defun handle-enumerate-classes (request)
  (destructuring-request (request namespace) ()
	(cim-namespace-classes namespace)))
  
;;<className>*EnumerateClassNames ( 
;;         [IN,OPTIONAL,NULL] <className> ClassName = NULL, 
;;         [IN,OPTIONAL] boolean DeepInheritance = false 
;; )
(defun handle-enumerate-class-names (request)
  (destructuring-request (request namespace) ()
	(mapcar #'cim-name (cim-namespace-classes namespace))))

      
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
		  (enumerate-instances (class-name cl))
		  (cim-error :invalid-class classname)))))

;;<instanceName>*EnumerateInstanceNames ( 
;;         [IN] <className> ClassName 
;; )
(defun handle-enumerate-instance-names (request)  
  (let ((instances (handle-enumerate-instances request)))
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
(defun handle-associators (request)
  (destructuring-request (request namespace) (objectname assocclass resultclass role resultrole propertylist)
	(if (cim-class-declaration-p objectname)
		;; is a class. find its associated classes
		nil
		;; is an instance. call the provider method 
		(association-instances objectname
							   (when assocclass
								 (find-cim-class assocclass namespace))
							   :result-class resultclass
							   :role role
							   :result-role resultrole
							   :property-list propertylist))))

;; <objectPath>*AssociatorNames ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> AssocClass = NULL, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL, 
;;         [IN,OPTIONAL,NULL] string Role = NULL, 
;;         [IN,OPTIONAL,NULL] string ResultRole = NULL 
;; )
(defun handle-associator-names (request)
  (let ((insts (handle-associators request)))
	(mapcar (lambda (obj)
			  (if (typep obj 'cim-class)
				  obj
				  (instance-to-cim-instance obj)))
			insts)))

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
		  nil)
		(reference-instances objectname
							 :result-class resultclass
							 :role role
							 :property-list propertylist))))

;;<objectPath>*ReferenceNames ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL, 
;;         [IN,OPTIONAL,NULL] string Role = NULL 
;; )
(defun handle-reference-names (request)
  (let ((insts (handle-references request)))
	(mapcar (lambda (obj)
			  (if (typep obj 'cim-class)
				  obj
				  (instance-to-cim-instance obj)))
			insts)))

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

















(defvar *cim-acceptors* nil)


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



(defparameter *default-port* 5988)
(defparameter *default-ssl-port* 5989)


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
	(setf port *default-ssl-port*)
	(setf port *default-port*)))
  
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
