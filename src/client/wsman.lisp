

(in-package #:climbe.client)


;; this file contains the toplevel WinRM client calls

(defparameter *wsman-uri* "http://127.0.0.1:5985/wsman")
(defparameter *wsman-username* "")
(defparameter *wsman-password* "")


(defun call-wsman-identity (&key (uri *wsman-uri*) (username *wsman-username*) domain (password *wsman-password*))
  "Call a WS-Man server with an empty request. This validates the credentials."
  (call-wsman password 
	      (climbe.encoding::encode-wsman-identity)
	      :username username
	      :uri uri
	      :domain domain))

(defun call-wsman-get-class (class-name &key (namespace *cim-namespace*) (uri *wsman-uri*) (username *wsman-username*) domain (password *wsman-password*))
  "Get a specific CIM class from a WS-Man server."
  (first 
   (climbe.decoding::envelope-body 
    (call-wsman password
		(encode-wsman-get-class class-name namespace :uri uri)
		:username username
		:uri uri
		:domain domain))))
  
(defun call-wsman-enumerate-classes (&key enumeration-context (namespace *cim-namespace*) 
				       (uri *wsman-uri*) (username *wsman-username*) 
				       domain (password *wsman-password*))
  "Enumerate all classes in a specific namespace. 

If ENUMERATION-CONTEXT is supplied it will be used, otherwise a new context is created and used. The context
can be renewed for further enumerations using CALL-WSMAN-RENEW.

Returns (VALUES (classes*) context)."
  (flet ((get-context ()
	   (let ((env
		  (call-wsman password
			      (encode-wsman-enumerate-classes namespace :uri uri)
			      :username username
			      :uri uri
			      :domain domain)))
	     (let ((context (second (assoc :|EnumerationContext| 
					   (cim-instance-slots 
					    (first (climbe.decoding::envelope-body env)))))))
	       context))))
    (let ((context (or enumeration-context (get-context))))
      (values 
       (mapcar #'climbe.decoding::decode-cimxml-class
	       (first 
		(climbe.decoding::envelope-body
		 (call-wsman password
			     (climbe.encoding::encode-wsman-pull context :uri uri)
			     :username username
			     :uri uri
			     :domain domain))))
       context))))

(defun call-wsman-renew (enumeration-context &key (uri *wsman-uri*) (username *wsman-username*) domain (password *wsman-password*))
  "Renew an enumeration context so it can be used again."
  (call-wsman password 
	      (climbe.encoding::encode-wsman-renew enumeration-context :uri uri)
	      :username username
	      :uri uri
	      :domain domain))

(defun call-wsman-get-instance (class-name slots &key (namespace *cim-namespace*) (username *wsman-username*) domain (password *wsman-password*) (uri *wsman-uri*))
  "Get a specific instance from the WS-Man server.

SLOTS shojuld be a list of (slot-name slot-value) forms."
  (call-wsman password
	      (encode-wsman-get-instance class-name namespace slots :uri uri)
	      :username username
	      :uri uri
	      :domain domain))
	      
(defun call-wsman-enumerate-instances (class-name 
				       &key enumeration-context (namespace *cim-namespace*) 
					 (username *wsman-username*) domain (password *wsman-password*) (uri *wsman-uri*))
  "Enumerate ALL instances of a specific class.

The enumeration context can be provided, otherwise a new one is created.

Returns (VALUES (instance*) context)."
  (flet ((get-context ()
	   (let ((env (call-wsman password
				  (encode-wsman-enumerate-instances class-name namespace :uri uri)
				  :username username
				  :uri uri
				  :domain domain)))
	     (let ((context (second
			     (assoc :|EnumerationContext| 
				    (cim-instance-slots (first (climbe.decoding::envelope-body env)))))))
	       context))))
    (let ((context (or enumeration-context (get-context))))
      (values
       (mapcar (lambda (instance)
		 (destructuring-bind ((class-name . ns) attribs &rest slots) instance
		   (declare (ignore ns attribs))
		   (make-cim-instance :name class-name
				      :slots 
				      (mapcar (lambda (slot)
						(destructuring-bind ((slot-name . ns) attribs &optional value) slot
						  (declare (ignore ns attribs))
						  (list slot-name value)))
					      slots))))
	       (first 
		(climbe.decoding::envelope-body 
		 (call-wsman password
			     (climbe.encoding::encode-wsman-pull context :uri uri)
			     :username username
			     :uri uri
			     :domain domain))))
       context))))

