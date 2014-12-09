

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
	      

;; FIXME: this function is an absolute mess. Needs tidying up.
;; probably lots of the destructuring code should be moved to the decoding package
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
				      (mapcan (lambda (slot)
						(destructuring-bind ((slot-name . ns) attribs &rest values) slot
						  (declare (ignore ns attribs))
						  (case (length values)
						    ((0 1)
						     (when (first values)
						       (list 
							(multiple-value-bind (v tpe) (climbe.decoding::decode-heuristically (first values))
							(list (intern slot-name :keyword) 
							      v
							      tpe)))))
						    (2 
						     ;; a reference-type value
						     (list 
						      (list (intern slot-name :keyword)
							    (make-cim-instance :name slot-name
									       :slots (mapcar (lambda (selector)
												(destructuring-bind ((s . ns) attribs val) selector
												  (declare (ignore s ns))
												  (list (intern (cadr (assoc "Name" attribs :test #'string-equal))
														:keyword)
													val
													nil)))											     
											      (cddr 
											       (assoc "SelectorSet"
												      (assoc "ReferenceParameters" 
													     values
													     :key #'car :test #'string-equal)
												      :key (lambda (x)
													     (if (consp x)
														 (car x)
														 x))
												      :test #'string-equal))))))))))
					      slots))))
	       (first 
		(climbe.decoding::envelope-body 
		 (call-wsman password
			     (climbe.encoding::encode-wsman-pull context :uri uri)
			     :username username
			     :uri uri
			     :domain domain))))
       context))))


(defun call-wsman-enumerate-associations (class-name 
				       &key enumeration-context (namespace *cim-namespace*) 
					 (username *wsman-username*) domain (password *wsman-password*) (uri *wsman-uri*)
					 (assoc-class "") (result-class ""))
  "Enumerate ALL instances of a specific class.

The enumeration context can be provided, otherwise a new one is created.

Returns (VALUES (instance*) context)."
  (flet ((get-context ()
	   (let ((env (call-wsman password
				  (encode-wsman-enumerate-associations class-name namespace 
								       :uri uri
								       :assoc-class assoc-class
								       :result-class result-class)
				  :username username
				  :uri uri
				  :domain domain)))
	     (let ((context (second
			     (assoc :|EnumerationContext| 
				    (cim-instance-slots (first (climbe.decoding::envelope-body env)))))))
	       context))))
    (let ((context (or enumeration-context (get-context))))
      (call-wsman password
		  (climbe.encoding::encode-wsman-pull context :uri uri)
		  :username username
		  :uri uri
		  :domain domain))))


