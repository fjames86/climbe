
(in-package #:climbe.core)

;; methods/parameters: parameters are rather similar to qualfieirs??? except they don't have 
;; values? 
(defstruct cim-parameter 
  name type qualifiers)

(defmethod cim-name ((parameter cim-parameter))
  (cim-parameter-name parameter))

(defmethod cim-qualifiers ((parameter cim-parameter))
  (cim-parameter-qualifiers parameter))

(defmethod cim-type ((param cim-parameter))
  (cim-parameter-type param))


;; representation of a CIM method 
(defstruct cim-method
  name return-type in-params out-params qualifiers function symbol origin)

(defun cim-method-parameters (method)
  (append (cim-method-in-params method)
	  (cim-method-out-params method)))

(defmethod cim-name ((method cim-method))
  (cim-method-name method))

(defmethod cim-qualifiers ((method cim-method))
  (cim-method-qualifiers method))


;; ###################################################################

;; structure for holding CIM messages in
(defstruct cim-message 
  request response id exp-request exp-response)

(defmethod print-object ((cim cim-message) stream)
  (format stream "#S(CIM-MESSAGE ")
  (cond
    ((cim-message-request cim)
     (format stream ":REQUEST ~S" (cim-message-request cim)))
    ((cim-message-response cim)
     (format stream ":RESPONSE ~S" (cim-message-response cim))))
  (format stream " :ID ~A" (cim-message-id cim))
  (format stream ")"))
    
;; declarations can contain qualifier declarations and class definitiosn 
(defstruct cim-declaration 
  namespace qualifiers classes)

(defstruct cim-request 
  method-name intrinsic-p namespace-path arguments reference)

(defstruct cim-response
  method-name intrinsic-p return-value return-type out-parameters error)


;; a CIM-INSTANCE is used as a client-side object to represent an instance of a class. 
;; On the server-side we can directly use CLOS instances.
(defstruct cim-instance
  namespace name slots)

(defmethod cim-name ((cim cim-instance))
    (cim-instance-name cim))

(defmacro cim-instance (class-name &rest slots)
  "Macro to facilitate making an instance."
  `(make-cim-instance :name ,(string class-name)
		      :slots (list ,@(mapcar (lambda (slot)
					       (destructuring-bind (slot-name slot-value slot-type) slot
						 `(list ,(string slot-name) ,slot-value ',slot-type)))
					     slots))))

(defun cim-slot-value (instance slot-name)
  "Get the value of a CIM-INSTANCE slot."
  (declare (type cim-instance instance))
  (let ((slot (find slot-name (cim-instance-slots instance) 
		    :key #'first 
		    :test #'string-equal)))
    (if slot 
	(second slot)
	(error "No slot ~S" slot-name))))

(defun (setf cim-slot-value) (value instance slot-name)
  (declare (type cim-instance instance))
  (let ((slot (find slot-name (cim-instance-slots instance)
		    :key #'first 
		    :test #'string-equal)))
    (if slot 
	(setf (second slot) value)
	(push (list slot-name value nil) (cim-instance-slots instance))))
  value)

;; CIM-CLASS is a client-side representation of a CIM class definition. 
;; It should be used everywhere outside the cimom module (where we use real CLOS meta-class instances).
(defstruct cim-class
  name slots qualifiers methods superclass)

(defmethod cim-name ((cim cim-class))
  (cim-class-name cim))

(defmethod cim-qualifiers ((cim cim-class))
  (cim-class-qualifiers cim))

(defun cim-class-method-names (class)
  (declare (type cim-class class))
  (mapcar #'cim-name (cim-class-methods class)))

(defun cim-class-slot-names (class)
  (declare (type cim-class class))
  (mapcar #'cim-name (cim-class-slots class)))


(defmethod print-object ((cim cim-class) stream)
  (format stream "#S(CIM-CLASS ~A" (cim-name cim))

  (format stream " :SLOTS (")
  (let ((first t))
    (dolist (slot-name (cim-class-slot-names cim))
      (unless first (format stream " "))
      (format stream "~A" slot-name)
      (setf first nil)))

  (format stream ") :METHODS (")
  (let ((first t))
    (dolist (method-name (cim-class-method-names cim))
      (unless first (format stream " "))
      (format stream "~A" method-name)
      (setf first nil)))
  (format stream "))"))

;; slots
(defstruct cim-slot 
  name type default qualifiers origin)

(defmethod cim-name ((cim cim-slot))
  (cim-slot-name cim))

(defmethod cim-qualifiers ((cim cim-slot))
  (cim-slot-qualifiers cim))

(defmethod cim-type ((cim cim-slot))
  (cim-slot-type cim))

