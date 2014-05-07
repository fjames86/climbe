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

;; --------------- CLOS classes ----------------


(defclass cim-class ()
  ((name :initarg :name :accessor cim-name)
   (properties :initarg :properties :initform nil :accessor cim-properties)
   (methods :initarg :methods :initform nil :accessor cim-methods)
   (superclass :initarg :superclass :initform nil :accessor cim-superclass)
   (qualifiers :initarg :qualifiers :initform nil :accessor cim-qualifiers)))

(defmethod print-object ((cim cim-class) stream)
  (format stream "#<CIM-CLASS ~A>" (cim-name cim)))

(defun cim-class-p (cim)
  (typep cim 'cim-class))

(defun make-cim-class (name properties methods &key superclass qualifiers)
  (make-instance 'cim-class
		 :name name
		 :properties properties
		 :methods methods
		 :superclass superclass
		 :qualifiers qualifiers))

(defclass cim-instance ()
  ((name :initarg :name :accessor cim-name)
   (slots :initarg :slots :initform nil :accessor cim-slots)))

(defmethod print-object ((cim cim-instance) stream)
  (print-unreadable-object (cim stream :type t :identity t)
	(format stream "~A" (cim-name cim))))

(defun cim-instance-p (cim)
  (typep cim 'cim-instance))

(defclass cim-reference ()
  ((name :initarg :name :initform nil :accessor cim-name) ;; class name
   (namespace :initarg :namespace :initform nil :accessor cim-namespace) ;; namespace 
   (host :initarg :host :initform nil :accessor cim-host) ;; the host it lives on
   (keys :initarg :keys :initform nil :accessor cim-keys)) ;; key properties (if instance)
  (:documentation "Represents a reference (classpath/instancepath) to a class or instance"))

(defmethod print-object ((cim cim-reference) stream)
  (print-unreadable-object (cim stream :type t)
	(format stream "~A:~A"
			(cim-namespace cim)
			(cim-name cim))
	(when (cim-keys cim)
	  (format stream " :KEYS ~S" (mapcar #'first (cim-keys cim))))))

(defun cim-reference-p (cim)
  (typep cim 'cim-reference))

;; ---------- namespaces ---------------

(defparameter *namespaces* (make-hash-table))
(defparameter *namespace* nil)

(defun %in-namespace (namespace)
  (let* ((kw (make-keyword namespace))
		 (str (string namespace))
		 (nspace (gethash kw *namespaces*)))
	(unless nspace
	  (setf (gethash kw *namespaces*)
			(list str)))
	(setf *namespace* kw)))

(defmacro in-namespace (namespace)
  `(eval-when (:load-toplevel :execute)
	 (%in-namespace ,namespace)))

(defun namespace-string (namespace)
  (let ((nspace (gethash (make-keyword namespace) *namespaces*)))
	(when nspace
	  (car nspace))))

(defun namespace-classes (namespace)
  (let ((nspace (gethash (make-keyword namespace) *namespaces*)))
	(when nspace
	  (cdr nspace))))

(defun (setf namespace-classes) (value namespace)
  (let ((nspace (gethash namespace *namespaces*)))
	(when nspace
	  (setf (cdr nspace) value))))

(defun %define-cim-class (namespace class)
  (let ((classes (namespace-classes namespace))
		(scl (cim-superclass class)))
	
	;; validate class object
	(when scl
	  (unless (cim-class-by-name scl namespace)
		(error "Superclass ~S not found" scl)))
	
	;; remove it if it is already there
	(when (find (cim-name class) classes :key #'cim-name)
	  (setf (namespace-classes namespace)
			(remove (cim-name class) classes :key #'cim-name)))

	;; append the inherited properties and methods
	(when scl
	  (let ((superclass (cim-class-by-name scl namespace)))
		(setf (cim-properties class)
			  (append (cim-properties superclass) (cim-properties class))
			  (cim-methods class)
			  (append (cim-methods superclass) (cim-methods class)))))
	
	;; define it
	(push class (cdr (gethash namespace *namespaces*)))))

(defmacro define-cim-class (name (&optional superclass) properties methods &rest options)
  (let ((gcl (gensym "CLASS")))
  `(progn
	 ;; defclass
	 (defclass ,name (,(if superclass superclass 'cim-class))
	   ()
	   ,@(mapcan (lambda (option)
				   (unless (eq (car option) :qualifiers)
					 (list option)))
				 options))
	 
	 
	 (let ((,gcl (make-instance ',name
								:name ',name
								:superclass ',superclass
								:qualifiers ,(let ((qual (find :qualifiers options :key #'car)))
												  (when qual
													`(kwlist-alist (list ,@(cdr qual)))))
								:properties (list ,@(mapcar (lambda (property)
															  (destructuring-bind (slot-name slot-type &rest qual-kwlist) property
																`(list
																  ',slot-name
																  ',slot-type
																  (kwlist-alist (list ,@qual-kwlist))
																  ',name ;; origin class
																  nil ;; default value
																  )))
															properties))
								:methods (list ,@(mapcar (lambda (method)
														   (destructuring-bind (meth-name return-type typed-parameters &rest qual-kwlist) method
															 (let ((fn (assoc-kwlist :function qual-kwlist)))
															   `(list ',meth-name
																	  ',return-type
																	  (list ,@(mapcar (lambda (parameter)
																						(destructuring-bind (param-name param-type &rest qual-kwlist) parameter
																						  `(list ',param-name
																								 ',param-type
																								 (kwlist-alist (list ,@qual-kwlist)))))
																					  typed-parameters))
																	  (mapcan-kwlist (lambda (n v)
																					   (unless (eq n :function)
																						 (list (cons n v))))
																					 (list ,@qual-kwlist))
																	  ,fn
																	  ',name ;; origin class
																	  ))))
														 methods)))))
	   ;; store meta-data
	   (%define-cim-class *namespace* ,gcl)
	   
	   ;; return cim-class for repl users
	   ,gcl))))

(defun cim-class-by-name (name &optional (namespace *namespace*))
  "Find a class from its name"
  (let ((classes (namespace-classes namespace)))
	(find name classes :key #'cim-name :test #'string-equal)))

(defun cim-property-by-name (prop-name class)
  "Find the property from its name. Searches superclasses if not found."
  (let ((props (cim-properties class)))
	(let ((prop (find prop-name props :key #'first :test #'string-equal)))
	  (if prop
		  prop
		  (let ((scl (cim-superclass class)))
			(when scl
			  (cim-property-by-name prop-name (cim-class-by-name scl))))))))

(defmacro destructuring-property ((name type qualifiers origin value) prop &body body)
  `(destructuring-bind (,name ,type ,qualifiers ,origin ,value) ,prop 
     (declare (ignorable ,name ,type ,qualifiers ,origin ,value))
     ,@body))

(defun cim-property-type (property) (second property))

(defun make-cim-property (name type &key qualifiers origin value)
  (list name type qualifiers origin value))

(defun cim-method-by-name (meth-name class)
  "Find method from its name. Searches superlcasses if not found."
  (let ((meths (cim-methods class)))
	(let ((meth (find meth-name meths :key #'first :test #'string-equal)))
	  (if meth
		  meth
		  (let ((scl (cim-superclass class)))
			(when scl
			  (cim-method-by-name meth-name (cim-class-by-name scl))))))))

(defmacro destructuring-method ((name return-type parameters qualifiers function origin) meth &body body)
  `(destructuring-bind (,name ,return-type ,parameters ,qualifiers ,function ,origin) ,meth 
     (declare (ignorable ,name ,return-type ,parameters ,qualifiers ,function ,origin))
     ,@body))

(defun make-cim-method (name return-type parameters &key qualifiers function origin)
  (list name return-type parameters qualifiers function origin))

(defmacro destructuring-parameter ((name type qualifiers) param &body body)
  `(destructuring-bind (,name ,type ,qualifiers) ,param 
     (declare (ignorable ,name ,type ,qualifiers))
     ,@body))

(defun make-cim-parameter (name type &key qualifiers)
  (list name type qualifiers))

(defun cim-parameter-type (parameter) (second parameter))

(defun %define-cim-method (method-name class-name function)
  ;; set the function n the method
  (let ((cl (cim-class-by-name class-name)))
	(unless cl
	  (error "Class ~S not found" class-name))
	(let ((meth (cim-method-by-name method-name cl)))
	  (if meth
		  (setf (fifth meth) function)
		  (error "Method ~S not found in class ~S" method-name class-name))))
  method-name)

;; create a lambda expression and call a worker function to define it
(defmacro define-cim-method (name class-name parameters &body body)
  `(%define-cim-method ',name ',class-name (lambda ,parameters ,@body)))

(defun cim-method-function (method) (fifth method))
(defun cim-method-parameters (method) (third method))
(defun cim-method-return-type (method) (second method))

;; -----------------------------------------------------------------------------------

;;################
(defgeneric enumerate-instances (class)
  (:documentation "Return a list of cim-instance objects for this class."))

(defmethod enumerate-instances ((class cim-class))
  (cim-error :cim-err-not-supported))

;;################
(defgeneric get-instance (class instance)
  (:documentation "Find an instance."))

(defmethod get-instance ((class cim-class) instance)
  (cim-error :cim-err-not-supported))

;;################
(defgeneric get-property (class instance prop-name)
  (:documentation "Find a property of an instance"))

(defmethod get-property ((class cim-class) instance prop-name)
  (cim-error :cim-err-not-supported))

;;###############
(defgeneric set-property (class instance prop-name value)
  (:documentation "set a property of an instance"))

(defmethod set-property ((class cim-class) instance prop-name value)
  (cim-error :cim-err-not-supported))

;;###############
(defgeneric modify-instance (class instance)
  (:documentation "modify an instance"))

(defmethod modify-instance ((class cim-class) instance)
  (cim-error :cim-err-not-supported))

;;###############
(defgeneric delete-instance (class instance)
  (:documentation "delete an instance"))

(defmethod delete-instance ((class cim-class) instance)
  (cim-error :cim-err-not-supported))

;;###############
(defgeneric create-instance (class instance)
  (:documentation "create a new instaCNE"))

(defmethod create-instance ((class cim-class) instance)
  (cim-error :cim-err-not-supported))

;;###############
(defgeneric invoke-method (class method arguments)
  (:documentation "Invoke a method of CIM class."))

;; ALL CIM method handlers should return (values <return-value> <list of outparams>)
;; the outparams should be an assoc list of (name . value) pairs. 
(defmethod invoke-method ((class cim-class) method-name arguments)
  (let ((meth (cim-method-by-name method-name class)))
	;; if method not found
	(unless meth (cim-error :cim-err-not-found method-name))

	;; apply the functio to the arguments
	(let ((fn (cim-method-function meth)))
	  (if fn
		  (apply fn arguments)
		  (cim-error :cim-err-not-found method-name)))))

;; --------------------- instances ----------------

(defun make-cim-instance (class-name &optional slots)
  (make-instance 'cim-instance
				 :name class-name
				 :slots slots))

(defun cim-slot (instance slot-name)
  (let ((slots (cim-slots instance)))
	(find slot-name slots :key #'first :test #'string-equal)))

(defun cim-slot-value (instance slot-name)
  (let ((slot (cim-slot instance slot-name)))
	(if slot
		(third slot))))

(defun cim-slot-type (instance slot-name)
  (let ((slot (cim-slot instance slot-name)))
	(second slot)))

(defmacro destructuring-slot ((name type value) slot &body body)
  `(destructuring-bind (,name ,type ,value) ,slot 
     (declare (ignorable ,name ,type ,value))
     ,@body))

(defun (setf cim-slot-value) (value instance slot-name)
  (let ((slots (cim-slots instance)))
	(let ((slot (find slot-name slots :key #'first :test #'string-equal)))
	  (if slot
		  (setf (third slot) value)
		  (push (list slot-name nil value) (cim-slots instance)))))
  value)

(defun (setf cim-slot-type) (value instance slot-name)
  (let ((slots (cim-slots instance)))
	(let ((slot (find slot-name slots :key #'first :test #'string-equal)))
	  (if slot
		  (setf (second slot) value)
		  (push (list slot-name value nil) (cim-slots instance)))))
  value)
  
(defun make-cim-slot (name type value) 
  (list name type value))

(defun cim-slot-property (slot)
  (destructuring-slot (name type val) slot
	(make-cim-property name type :value val)))

(defun cim-property-slot (property)
  (destructuring-property (name type qualifiers origin value) property
	(make-cim-slot name type value)))

;; ---------- references ----------

(defun make-cim-reference (name &key namespace host keys)
  "Create a reference object to a class or instance."
  (make-instance 'cim-reference
				 :name name
				 :namespace namespace
				 :host host
				 :keys keys))

(defun cim-instance-reference (class instance)
  (make-cim-reference (cim-name class)
					  :keys (mapcan (lambda (property)
									  (destructuring-property (name type qualifiers origin value) property
									    (when (assoc* :key qualifiers)
										  (list (make-cim-slot name type (cim-slot-value instance name))))))
									(cim-properties class))))

(defun cim-reference-instance (class reference)
  (make-cim-instance (cim-name class)
					 (cim-keys reference)))


											 
;; ------------- types ------------

(defparameter *cim-primitives*
  '(:uint8 :uint16 :uint32 :uint64
    :sint8 :sint16 :sint32 :sint64
    :string :datetime :boolean
    :real32 :real64))

(defun cim-primitive-p (type)
  (member type *cim-primitives*))

(defun cim-primitive-string (type)
  (string-downcase (symbol-name type)))

(defun cim-string-primitive (string)
  (let ((kw (make-keyword string)))
    (if (cim-primitive-p kw)
	kw
	(error "String ~S does not represent a primitive CIM type" string))))

(defun cim-array-p (type)
  (and (consp type) (eq (car type) :array)))

(defun cim-ref-p (type)
  (and (consp type) (eq (car type) :ref)))

(defun cim-refarray-p (type)
  (and (cim-array-p type) 
       (cim-ref-p (second type))))

(defun cim-array-type (type) (second type))
(defun cim-array-length (type) (third type))
(defun cim-ref-class (type) (second type))



;; ---------------------

(defgeneric cim-object-list (cim))

(defmethod cim-object-list ((cim t))
  cim)

(defmethod cim-object-list ((cim cim-class))
  (list :cim-class
	(cons :name (cim-name cim))
	(cons :properties (cim-properties cim))
	(cons :methods (cim-methods cim))
	(cons :superclass (cim-superclass cim))
	(cons :qualifiers (cim-qualifiers cim))))

(defmethod cim-object-list ((cim cim-instance))
  (list :cim-instance
	(cons :name (cim-name cim))
	(cons :slots 
	      (mapcar (lambda (slot)
			(destructuring-slot (name type val) slot
			  (list name type (cim-object-list val))))
		      (cim-slots cim)))))

(defmethod cim-object-list ((cim cim-reference))
  (list :cim-reference
	(cons :name (cim-name cim))
	(cons :namespace (cim-namespace cim))
	(cons :keys 
	      (mapcar (lambda (slot)
			(destructuring-slot (name type val) slot
			  (list name type (cim-object-list val))))
		      (cim-keys cim)))))


	
