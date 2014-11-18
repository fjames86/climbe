
(in-package #:climbe.core)

;; methods/parameters
(defstruct cim-parameter 
  name type qualifiers)

(defstruct cim-method
  name return-type in-params out-params qualifiers function symbol)

(defun cim-method-parameters (method)
  (append (cim-method-in-params method)
	  (cim-method-out-params method)))

(defmethod cim-name ((method cim-method))
  (cim-method-name method))

(defmethod cim-name ((parameter cim-parameter))
  (cim-parameter-name parameter))

(defmethod cim-qualifiers ((parameter cim-parameter))
  (cim-parameter-qualifiers parameter))



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





;; a reference is an object that is used to specify an instance of a class by 
;; naming its KEY slots only. This is enough to uniquely specify the instance.
(defstruct cim-reference
  namespace classname keyslots)




;; a CIM-INSTANCE is used as a client-side object to represent an instance of a class. 
;; On the server-side we can directly use CLOS instances.
(defstruct cim-instance
  namespace classname slots)


;; FIXME: move these to the cimom module 
(defun convert-cim-instance (cim-instance &optional namespace)
  "Takes a CIM-INSTANCE structure and instantiates a CLOS instance that represents it by searching 
through the local namespace repository."
  (declare (type cim-instance cim-instance))
  (let ((cl (find-cim-class (cim-instance-classname cim-instance)
			    (if namespace
					namespace
					(find-namespace (cim-instance-namespace cim-instance))))))
    (unless cl 
      (error "Class ~S not found." (cim-instance-classname cim-instance)))
    (let ((inst (make-instance cl)))
      (dolist (slot (cim-instance-slots cim-instance))
	(destructuring-bind (slot-name slot-value slot-type) slot
	  (declare (ignore slot-type))
	  (let ((slot-definition (find-cim-slot slot-name cl)))
	    (if slot-definition
		(setf (slot-value inst (closer-mop:slot-definition-name slot-definition))
		      slot-value)
		(error "Slot ~S not found." slot-name)))))
      inst)))

(defun instance-to-cim-instance (instance)
  "Convert a CLOS instance to a CIM-INSTANCE."
  (let ((cl (class-of instance)))
    (make-cim-instance :classname (cim-name cl)
                       :slots 
                       (mapcar (lambda (slot)
                                 (list (cim-name slot)
                                       (slot-value instance (closer-mop:slot-definition-name slot))
                                       (cim-slot-type slot)))
                               (cim-class-slots cl)))))

(defun class-to-declaration (class)
  "Converts a CIM-CLASS Object into a CIM-CLASS-DECLARATION"
  (make-cim-class-declaration
   :name (cim-name class)
   :slots (mapcar (lambda (slot)
					(list (cim-name slot)
						  nil ;; value???
						  (cim-slot-type slot)))
				  (cim-class-slots class))
   :qualifiers (cim-qualifiers class)
   :methods (cim-class-methods class)
   :superclass nil ;;; superclass??
   ))
							 


;; need a client-side representation of cim-classes i.e. something more abstract than the CLOS cim-class 
;; metaclass.
;; we use this when decoding because we don't whether what we're decoding is junk or not. often it 
;; doesn't make sense to decode directly into the CLOS objects.
(defstruct cim-class
  name slots qualifiers methods superclass)

(defmethod cim-name ((cim cim-class))
  (cim-class-name cim))

(defmethod cim-qualifiers ((cim cim-class))
  (cim-class-qualifiers cim))

(defmethod print-object ((cim cim-class) stream)
  (format stream "#S(CIM-CLASS ~A)" (cim-name cim)))


;; slots
(defstruct cim-slot 
  name type default qualifiers)

(defmethod cim-name ((cim cim-slot))
  (cim-slot-name cim))

(defmethod cim-qualifiers ((cim cim-slot))
  (cim-slot-qualifiers cim))


