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

;; http://www.dmtf.org/sites/default/files/standards/documents/DSP200.html#2.3.2.1

(in-package :climbe)

(defparameter *cim-default-port* 5988)
(defparameter *cim-default-ssl-port* 5989)

;; make a message and encode it using (encode-cimxml <message> <id>)

(defun cim-http-request (host message
			 &key (cim-operation "MethodCall") cim-method cim-object
			   port ssl authorization (encoding :cimxml))
  "Encode the message and send it as an HTTP request."

  ;; first ensure we have a port number to use 
  (unless port
    (if ssl
	(setf port *cim-default-ssl-port*)
	(setf port *cim-default-port*)))

  (unless encoding (setf encoding :cimxml))
  
  ;; ok now get the content
  (let ((content (cim-encode message :encoding encoding)))
    (multiple-value-bind (result return-code headers uri
				 stream must-close reason-phrase)
	(drakma:http-request (if ssl
				 (format nil "https://~A:~A/cimom" host port)
				 (format nil "http://~A:~A/cimom" host port))
			     :method :post
			     :additional-headers
			     `(("CIMOperation" . ,cim-operation)
			       ("CIMMethod" . ,cim-method)
			       ("CIMObject" . ,cim-object))
			     :content content 
			     :content-type "application/xml; charset=utf-8"
			     :basic-authorization authorization)
      (declare (ignore uri stream must-close reason-phrase headers))

      ;; we've got the return let's do something with it
      (cond
	((null result)
	 (error "No content returned"))
	((= return-code 200)
	 ;; all went well
	 (let ((result-string
		(cond
		  ((stringp result) result)
		  (t (map 'string #'code-char result)))))
	   (with-input-from-string (s result-string)
	     (cim-message-contents (cim-decode s :encoding encoding)))))
	(t
	 ;; an http error
	 (error "HTTP error ~S" return-code))))))

;; ------------------------------------------------

;; need to make the message objects

;; <class>GetClass ( 
;;         [IN] <className> ClassName, 
;;         [IN,OPTIONAL] boolean LocalOnly = true,
;;         [IN,OPTIONAL] boolean IncludeQualifiers = true, 
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun cim-get-class (host classname namespace 
		      &key port ssl authorization encoding)
  (let ((message
	 (make-cim-message 
			   (make-cim-request (make-cim-reference nil :namespace namespace)
					     "GetClass"
					     `(("ClassName" :classname ,classname))
					     t))))
    (let ((response (cim-http-request host message
				      :port port
				      :ssl ssl
				      :authorization authorization
				      :encoding encoding
				      :cim-method "GetClass"
				      :cim-object namespace)))
      (car (cim-response-return-value response)))))

;; <instance>GetInstance ( 
;;         [IN] <instanceName> InstanceName, 
;;         [IN,OPTIONAL] boolean LocalOnly = true,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun cim-get-instance (host classname namespace keyvalues &key
							  port ssl authorization encoding)
  (let* ((reference (make-cim-reference classname :namespace namespace :keys keyvalues))
	 (message (make-cim-message 
				    (make-cim-request reference
						      "GetInstance"
						      `(("InstanceName" :instancename ,reference))
						      t))))
    (let ((response (cim-http-request host message
				      :cim-method "GetInstance"
				      :cim-object namespace
				      :port port
				      :ssl ssl
				      :authorization authorization
				      :encoding encoding)))
      (cim-response-return-value response))))

;;void  DeleteClass ( 
;;        [IN] <className> ClassName 
;; )

;;void  DeleteInstance ( 
;;         [IN] <instanceName> InstanceName 
;; )
(defun cim-delete-instance (host classname namespace keyvalues &key
							     port ssl authorization encoding)
  (let* ((instancepath (make-cim-reference classname :namespace namespace :keys keyvalues))
	 (message (make-cim-message 
				    (make-cim-request instancepath
						      "DeleteInstance"
						      `(("InstanceName" :instancename ,instancepath))
						      t))))
    (let ((response (cim-http-request host
				      message
				      :cim-method "DeleteInstance"
				      :cim-object namespace
				      :port port
				      :ssl ssl
				      :authorization authorization
				      :encoding encoding)))
      (cim-response-return-value response))))

;;void CreateClass ( 
;;        [IN] <class> NewClass 
;; )

;;CreateInstance
;; <instanceName>CreateInstance ( 
;;        [IN] <instance> NewInstance 
;; )
(defun cim-create-instance (host classname namespace properties &key port ssl authorization encoding)
  (let* ((inst (make-cim-instance classname properties))
	 (message (make-cim-message 
				    (make-cim-request (make-cim-reference classname :namespace namespace)
						      "CreateInstance"
						      `(("NewInstance" :instance ,inst))
						      t))))
    (let ((response (cim-http-request host message
				      :cim-method "CreateInstance"
				      :cim-object namespace
				      :port port
				      :ssl ssl
				      :authorization authorization
				      :encoding encoding)))
      (cim-response-return-value response))))

;;void ModifyClass ( 
;;        [IN] <class> ModifiedClass 
;; )

;;void ModifyInstance ( 
;;        [IN] <namedInstance> ModifiedInstance, 
;;        [IN, OPTIONAL] boolean IncludeQualifiers = true,  (DEPRECATED)
;;        [IN, OPTIONAL, NULL] string propertyList[] = NULL 
;; )
(defun cim-modify-instance (host classname namespace properties &key port ssl authorization encoding)
  (let* ((inst (make-cim-instance classname properties))
	 (message (make-cim-message 
				    (make-cim-request (make-cim-reference classname :namespace namespace)
						      "ModifyInstance"
						      `(("ModifiedInstance" :instance ,inst))
						      t))))
    (let ((response (cim-http-request host message
				      :cim-method "ModifyInstance"
				      :cim-object namespace
				      :port port
				      :ssl ssl
				      :authorization authorization
				      :encoding encoding)))
      (cim-response-return-value response))))


;; <class>*EnumerateClasses ( 
;;         [IN,OPTIONAL,NULL] <className> ClassName=NULL, 
;;         [IN,OPTIONAL] boolean DeepInheritance = false,
;;         [IN,OPTIONAL] boolean LocalOnly = true, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = true, 
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false 
;; )
(defun cim-enumerate-classes (host namespace &key port ssl authorization encoding)
  (let ((message (make-cim-message 
				   (make-cim-request (make-cim-reference nil :namespace namespace)
						     "EnumerateClasses"
						     nil
						     t))))
    (let ((response (cim-http-request host message
				      :cim-method "EnumerateClasses"
				      :cim-object namespace
				      :port port
				      :ssl ssl
				      :authorization authorization
				      :encoding encoding)))
      (cim-response-return-value response))))

;;<className>*EnumerateClassNames ( 
;;         [IN,OPTIONAL,NULL] <className> ClassName = NULL, 
;;         [IN,OPTIONAL] boolean DeepInheritance = false 
;; )
(defun cim-enumerate-class-names (host namespace &key port ssl authorization encoding)
  (let ((message (make-cim-message 
				   (make-cim-request (make-cim-reference nil :namespace namespace)
						     "EnumerateClassNames"
						     nil
						     t))))
    (let ((response (cim-http-request host message
				      :cim-method "EnumerateClassNames"
				      :cim-object namespace
				      :port port
				      :ssl ssl
				      :authorization authorization
				      :encoding encoding)))
      (cim-response-return-value response))))

;;<namedInstance>*EnumerateInstances ( 
;;         [IN] <className> ClassName, 
;;         [IN,OPTIONAL] boolean LocalOnly = true,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean DeepInheritance = true, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun cim-enumerate-instances (host classname namespace &key port ssl authorization encoding)
  (let ((message (make-cim-message 
				   (make-cim-request (make-cim-reference classname :namespace namespace)
						     "EnumerateInstances"
						     `(("ClassName" :classname ,classname))
						     t))))
    (let ((response (cim-http-request host message
				      :cim-method "EnumerateInstances"
				      :cim-object namespace
				      :port port
				      :ssl ssl
				      :authorization authorization
				      :encoding encoding)))
      (cim-response-return-value response))))


;;<instanceName>*EnumerateInstanceNames ( 
;;         [IN] <className> ClassName 
;; )
(defun cim-enumerate-instance-names (host classname namespace &key port ssl authorization encoding)
  (let ((message (make-cim-message 
				   (make-cim-request (make-cim-reference classname :namespace namespace)
						     "EnumerateInstanceNames"
						     `(("ClassName" :classname ,classname))
						     t))))
    (let ((response (cim-http-request host message
				      :cim-method "EnumerateInstanceNames"
				      :cim-object namespace
				      :port port
				      :ssl ssl
				      :authorization authorization
				      :encoding encoding)))
      (cim-response-return-value response))))


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
(defun cim-associators (host classname namespace &key keyvalues port ssl authorization encoding)
  (let* ((path (make-cim-reference classname :namespace namespace :keys keyvalues))
	 (message (make-cim-message 
				    (make-cim-request path
						      "Associators"
						      `(("ObjectName" ,(if keyvalues :instancename :classname)
								      ,(if keyvalues path classname)))
						      t))))
    (let ((resp (cim-http-request host message
				  :cim-method "Associators"
				  :cim-object namespace
				  :port port
				  :ssl ssl
				  :authorization authorization
				  :encoding encoding)))
      (cim-response-return-value resp))))


;; <objectPath>*AssociatorNames ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> AssocClass = NULL, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL, 
;;         [IN,OPTIONAL,NULL] string Role = NULL, 
;;         [IN,OPTIONAL,NULL] string ResultRole = NULL 
;; )
(defun cim-associator-names (host classname namespace &key keyvalues port ssl authorization encoding)
  (let* ((path (make-cim-reference classname :namespace namespace :keys keyvalues))
	 (message (make-cim-message 
				    (make-cim-request path
						      "AssociatorNames"
						      `(("ObjectName" ,(if keyvalues :instancename :classname)
								      ,(if keyvalues path classname)))
						      t))))
    (let ((resp (cim-http-request host message
				  :cim-method "AssociatorNames"
				  :cim-object namespace
				  :port port
				  :ssl ssl
				  :authorization authorization
				  :encoding encoding)))
      (cim-response-return-value resp))))

;; <objectWithPath>*References ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL,
;;         [IN,OPTIONAL,NULL] string Role = NULL, 
;;         [IN,OPTIONAL] boolean IncludeQualifiers = false,  (DEPRECATED)
;;         [IN,OPTIONAL] boolean IncludeClassOrigin = false, 
;;         [IN,OPTIONAL,NULL] string PropertyList [] = NULL 
;; )
(defun cim-references (host classname namespace &key keyvalues port ssl authorization encoding)
  (let* ((path (make-cim-reference classname :namespace namespace :keys keyvalues))
	 (message (make-cim-message 
				    (make-cim-request path
						      "References"
						      `(("ObjectName" ,(if keyvalues :instancename :classname)
								      ,(if keyvalues path classname)))
						      t))))
    (let ((resp (cim-http-request host message
				  :cim-method "References"
				  :cim-object namespace
				  :port port
				  :ssl ssl
				  :authorization authorization
				  :encoding encoding)))
      (cim-response-return-value resp))))

;;<objectPath>*ReferenceNames ( 
;;         [IN] <objectName> ObjectName, 
;;         [IN,OPTIONAL,NULL] <className> ResultClass = NULL, 
;;         [IN,OPTIONAL,NULL] string Role = NULL 
;; )
(defun cim-reference-names (host classname namespace &key keyvalues port ssl authorization encoding)
  (let* ((path (make-cim-reference classname :namespace namespace :keys keyvalues))
	 (message (make-cim-message 
				    (make-cim-request path
						      "ReferenceNames"
						      `(("ObjectName" ,(if keyvalues :instancename :classname)
								      ,(if keyvalues path classname)))
						      t))))
    (let ((resp (cim-http-request host message
				  :cim-method "ReferenceNames"
				  :cim-object namespace
				  :port port
				  :ssl ssl
				  :authorization authorization
				  :encoding encoding)))
      (cim-response-return-value resp))))


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



;; ----------------------------------------

;; invoking extrinsic methods
(defun cim-invoke-method (host methodname classname namespace arguments &key keyvalues port ssl authorization encoding)
  (let* ((path (make-cim-reference classname :namespace namespace :keys keyvalues))
	 (message (make-cim-message 
				    (make-cim-request path methodname arguments)))
	 (object (if keyvalues
		     (with-output-to-string (s)
		       (format s "~A:~A" namespace classname)
		       (dolist (keyvalue keyvalues)
			 (destructuring-bind (name type value) keyvalue
			   (if (eq type :boolean)
			       (format s ".~A=~S" name (if value "true" "false"))
			       (format s ".~A=~S" name value)))))
		     (format nil "~A:~A" namespace classname))))
    (cim-http-request host message
		      :cim-method methodname
		      :cim-object object
		      :port port
		      :ssl ssl
		      :authorization authorization
		      :encoding encoding)))


(defun cim-enumerate-namespaces (host &key port ssl authorization encoding)
  "Attempt to enumerate CIM_Namespace objects"
  (loop for nspace in '("root" "interop" "root/interop" "root/PG_interop")
     do (handler-case
	    (let ((insts (cim-enumerate-instances host "CIM_Namespace" nspace
						  :port port
						  :ssl ssl
						  :authorization authorization
						  :encoding encoding)))
	      (return-from cim-enumerate-namespaces
		(mapcar (lambda (inst)
			  (cim-slot-value inst :name))
			insts)))
	  (cim-error-t (err)
	    (warn "Failed to find CIM_Namespace in ~S: ~S"
		  nspace (cim-error-description err)))))
  (error "Unable to enumerate CIM_Namespace instances"))

