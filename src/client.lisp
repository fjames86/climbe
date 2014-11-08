

(in-package :climbe)

;; client calls go here.
;;

(defun cim-object-string (namespace &optional class-name slots)
  (with-output-to-string (s)
    (format s "~A" namespace)
    (when class-name
      (format s ":~A" class-name)
      (when slots
	(let ((first t))
	  (dolist (slot slots)
	    (destructuring-bind (slot-name slot-value slot-type) slot
	      (declare (ignore slot-type))
	      (format s "~C~A=~S" 
		      (if first #\. #\,)
		      slot-name 
		      ;; FIXME: is the value is a reference then we need to reapply this function but
		      ;; escape any #\" characters
		      slot-value))
	    (setf first nil)))))))


(defvar *cim-uri* "http://localhost:5988/cimom")
(defvar *cim-namespace* "root/cimv2")

(defun call-cim-server (encoded cim-method cim-object &rest drakma-args)
  "Calls the server and returns the decoded result. Returns a CIM-MESSAGE structure.

ENCODED is a string of the encoded message. Create it by calling one of the 
various ENCODE-* functions, such as ENCODE-GET-INSTANCE etc.

URI is the name of the server to call.

DRAKMA-ARGS contains other arguments to Drakma's HTTP-REQUEST function."
  (multiple-value-bind (response return-code headers puri stream must-close reason)
      (apply #'drakma:http-request *cim-uri*
             :method :post
             :content encoded
	     :additional-headers 	     
	     `(("CIMOperation" . "MethodCall")
	       ("CIMMethod" . ,cim-method)
	       ("CIMObject" . ,cim-object))
             drakma-args)
    (declare (ignore headers puri stream must-close))
    (case return-code
      (200
       ;; all went well
;;	   (format t "ENCODED: ~A~%" response)
	   (let ((message (decode-cim
                        (etypecase response
                          (string response)
                          (vector (babel:octets-to-string response))))))
         (if (cim-response-p (cim-message-response message))
			 message
             (error (cim-message-response message)))))
      (otherwise 
       (error "Return ~D Reason: ~A" return-code reason)))))

;; need to make the message objects

;; <class>GetClass ( 
;;         [IN] <className> ClassName, 
;;         [IN,OPTIONAL] boolean LocalOnly = true,
;;         [IN,OPTIONAL] boolean IncludeQualifiers = true, 
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun call-get-class (drakma-args class-name 
                       &key (namespace *cim-namespace*) 
                         (local-only t)
                         (include-qualifiers t)
                         include-class-origin
                         property-list)
  (let ((response 
         (cim-message-response
          (apply #'call-cim-server 
                 (encode-get-class class-name 
                                   :namespace namespace
                                   :local-only local-only
                                   :include-qualifiers include-qualifiers
                                   :include-class-origin include-class-origin
                                   :property-list property-list)
		 "GetClass"
		 (cim-object-string namespace class-name)
                 drakma-args))))
    (destructuring-bind (decls class) (cim-response-return-value response)
      (assert (eq class :class))
      (first decls))))

;; <instance>GetInstance ( 
;;         [IN] <instanceName> InstanceName, 
;;         [IN,OPTIONAL] boolean LocalOnly = true,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun call-get-instance (drakma-args instance-name &key (namespace *cim-namespace*)
                                                      include-class-origin property-list)
  (let ((response 
         (cim-message-response
          (apply #'call-cim-server 
                 (encode-get-instance instance-name 
                                      :namespace namespace
                                      :include-class-origin include-class-origin
                                      :property-list property-list)
		 "GetInstance"
		 (cim-object-string namespace 
				    (cim-reference-classname instance-name)
				    (cim-reference-keyslots instance-name))
                 drakma-args))))
    (destructuring-bind (instances type) (cim-response-return-value response)
      (declare (ignore type)) ;; e.g. :value.namedinstance 
      instances)))


;;void  DeleteClass ( 
;;        [IN] <className> ClassName 
;; )

;;void  DeleteInstance ( 
;;         [IN] <instanceName> InstanceName 
;; )
(defun call-delete-instance (drakma-args instance-name &key (namespace *cim-namespace*))
  (apply #'call-cim-server
         (encode-delete-instance instance-name :namespace namespace)
	 "DeleteInstance"
	 (cim-object-string namespace 
			    (cim-reference-classname instance-name)
			    (cim-reference-keyslots instance-name))
         drakma-args))

;;void CreateClass ( 
;;        [IN] <class> NewClass 
;; )

;;CreateInstance
;; <instanceName>CreateInstance ( 
;;        [IN] <instance> NewInstance 
;; )
(defun call-create-instance (drakma-args instance &key (namespace *cim-namespace*))
  (let ((response 
         (cim-message-response
          (apply #'call-cim-server 
                 (encode-create-instance instance :namespace namespace)
		 "CreateInstance"
		 (cim-object-string namespace 
				    (cim-instance-classname instance)
				    ;; FIXME: these are ALL the slots but we want just the key slots
				    (cim-instance-slots instance))
                 drakma-args))))
    (destructuring-bind (instance-name type) (cim-response-return-value response)
      (declare (ignore type))
      instance-name)))

;;void ModifyClass ( 
;;        [IN] <class> ModifiedClass 
;; )

;;void ModifyInstance ( 
;;        [IN] <namedInstance> ModifiedInstance, 
;;        [IN, OPTIONAL] boolean IncludeQualifiers = true,  (DEPRECATED)
;;        [IN, OPTIONAL, NULL] string propertyList[] = NULL 
;; )
(defun call-modify-instance (drakma-args named-instance &key (namespace *cim-namespace*) property-list)
  (apply #'call-cim-server 
         (encode-modify-instance named-instance
                                 :namespace namespace
                                 :property-list property-list)
	 "ModifyInstance"
	 (cim-object-string namespace 
			    (cim-instance-classname named-instance)
			    (cim-instance-slots named-instance))
         drakma-args))

;; <class>*EnumerateClasses ( 
;;         [IN,OPTIONAL,NULL] <className> ClassName=NULL, 
;;         [IN,OPTIONAL] boolean DeepInheritance = false,
;;         [IN,OPTIONAL] boolean LocalOnly = true, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = true, 
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false 
;; )
(defun call-enumerate-classes (drakma-args &key (namespace *cim-namespace*) class-name
                                             deep-inheritance (local-only t) (include-qualifiers t) include-class-origin)
  (let ((response 
         (cim-message-response
          (apply #'call-cim-server 
                 (encode-enumerate-classes :namespace namespace
                                           :class-name class-name
                                           :deep-inheritance deep-inheritance
                                           :local-only local-only
                                           :include-qualifiers include-qualifiers
                                           :include-class-origin include-class-origin)
		 "EnumerateClasses"
		 (cim-object-string namespace)
                 drakma-args))))
    (destructuring-bind (classes type) (cim-response-return-value response)
      (declare (ignore type))
      classes)))


;;<className>*EnumerateClassNames ( 
;;         [IN,OPTIONAL,NULL] <className> ClassName = NULL, 
;;         [IN,OPTIONAL] boolean DeepInheritance = false 
;; )
(defun call-enumerate-class-names (drakma-args &key (namespace *cim-namespace*) class-name deep-inheritance)
  (let ((response 
         (cim-message-response
          (apply #'call-cim-server 
                 (encode-enumerate-class-names 
                  :namespace namespace
                  :class-name class-name
                  :deep-inheritance deep-inheritance)
		 "EnumerateClassNames"
		 (cim-object-string namespace)
                 drakma-args))))
    (destructuring-bind (class-names type) (cim-response-return-value response)
      (declare (ignore type)) ;; :classname
      class-names)))
      
;;<namedInstance>*EnumerateInstances ( 
;;         [IN] <className> ClassName, 
;;         [IN,OPTIONAL] boolean LocalOnly = true,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean DeepInheritance = true, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun call-enumerate-instances (drakma-args class-name &key (namespace *cim-namespace*)
                                               (deep-inheritance t)
                                               include-class-origin
                                               property-list)
  (let ((response 
         (cim-message-response
          (apply #'call-cim-server 
                 (encode-enumerate-instances class-name
                                             :namespace namespace
                                             :deep-inheritance deep-inheritance
                                             :include-class-origin include-class-origin
                                             :property-list property-list)
		 "EnumerateInstances"
		 (cim-object-string namespace class-name)
                 drakma-args))))
    (destructuring-bind (instances type) (cim-response-return-value response)
      (declare (ignore type))
      instances)))


;;<instanceName>*EnumerateInstanceNames ( 
;;         [IN] <className> ClassName 
;; )
(defun call-enumerate-instance-names (drakma-args class-name &key (namespace *cim-namespace*))
  (let ((response 
         (cim-message-response
          (apply #'call-cim-server 
                 (encode-enumerate-instance-names class-name 
                                                  :namespace namespace)
		 "EnumerateInstanceNames"
		 (cim-object-string namespace class-name)
                 drakma-args))))
    (destructuring-bind (instance-names type) (cim-response-return-value response)
      (declare (ignore type)) ;; namedinstance
      instance-names)))
                                                 
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
(defun call-associators (drakma-args object-name &key (namespace *cim-namespace*)
                                                   assoc-class result-class role result-role
                                                   include-class-origin property-list)
  (let ((response 
         (cim-message-response
          (apply #'call-cim-server 
                 (encode-associators object-name
                                     :namespace namespace
                                     :assoc-class assoc-class
                                     :result-class result-class
                                     :role role
                                     :result-role result-role
                                     :include-class-origin include-class-origin
                                     :property-list property-list)
		 "Associators"
		 (cim-object-string namespace 
				    (if (cim-class-declaration-p object-name)
					(cim-class-declaration-name object-name)
					(cim-instance-classname object-name))
				    (when (cim-instance-p object-name)
				      (cim-instance-slots object-name)))
                 drakma-args))))
    (destructuring-bind (ass type) (cim-response-return-value response)
      (declare (ignore type))
      ass)))
                
;; <objectPath>*AssociatorNames ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> AssocClass = NULL, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL, 
;;         [IN,OPTIONAL,NULL] string Role = NULL, 
;;         [IN,OPTIONAL,NULL] string ResultRole = NULL 
;; )
(defun call-associator-names (drakma-args object-name 
                              &key 
                                (namespace *cim-namespace*) assoc-class result-class role result-role)
  (let ((response 
         (cim-message-response
          (apply #'call-cim-server 
                 (encode-associator-names object-name
                                          :namespace namespace 
                                          :assoc-class assoc-class
                                          :result-class result-class
                                          :role role
                                          :result-role result-role)
		 "AssociatorNames"
		 (cim-object-string namespace 
				    (if (cim-class-declaration-p object-name)
					(cim-class-declaration-name object-name)
					(cim-instance-classname object-name))
				    (when (cim-instance-p object-name)
				      (cim-instance-slots object-name)))
                 drakma-args))))
    (destructuring-bind (names type) (cim-response-return-value response)
      (declare (ignore type))
      names)))

;; <objectWithPath>*References ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL,
;;         [IN,OPTIONAL,NULL] string Role = NULL, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun call-references (drakma-args object-name 
                        &key (namespace *cim-namespace*) result-class role include-class-origin property-list)
  (let ((response 
         (cim-message-response
          (apply #'call-cim-server 
                 (encode-references object-name
                                    :namespace namespace
                                    :result-class result-class
                                    :role role
                                    :include-class-origin include-class-origin
                                    :property-list property-list)
		 "References"
		 (cim-object-string namespace 
				    (if (cim-class-declaration-p object-name)
					(cim-class-declaration-name object-name)
					(cim-instance-classname object-name))
				    (when (cim-instance-p object-name)
				      (cim-instance-slots object-name)))
                 drakma-args))))
    (destructuring-bind (refs type) (cim-response-return-value response)
      (declare (ignore type))
      refs)))

;;<objectPath>*ReferenceNames ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL, 
;;         [IN,OPTIONAL,NULL] string Role = NULL 
;; )
(defun call-reference-names (drakma-args object-name 
                             &key (namespace *cim-namespace*) result-class role)
  (let ((response 
         (cim-message-response
          (apply #'call-cim-server 
                 (encode-reference-names object-name
                                         :namespace namespace
                                         :result-class result-class
                                         :role role)
		 "ReferenceNames"
		 (cim-object-string namespace 
				    (if (cim-class-declaration-p object-name)
					(cim-class-declaration-name object-name)
					(cim-instance-classname object-name))
				    (when (cim-instance-p object-name)
				      (cim-instance-slots object-name)))
                 drakma-args))))
    (destructuring-bind (names type) (cim-response-return-value response)
      (declare (ignore type))
      names)))


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
(defun call-enumerate-qualifiers (drakma-args &key (namespace *cim-namespace*))
  (let ((response 
         (cim-message-response
          (apply #'call-cim-server 
                 (encode-enumerate-qualifiers :namespace namespace)
		 "EnumerateQualifiers"
		 (cim-object-string namespace)
                 drakma-args))))
    (destructuring-bind (quals type) (cim-response-return-value response)
      (declare (ignore type))
      quals)))

