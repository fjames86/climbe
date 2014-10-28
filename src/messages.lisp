
(in-package :climbe)

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

(defun convert-cim-instance (cim-instance)
  "Takes a CIM-INSTANCE structure and instantiates a CLOS instance that represents it by searching 
through the local namespace repository."
  (declare (type cim-instance cim-instance))
  (let ((cl (find-cim-class (cim-instance-classname cim-instance)
			    (find-namespace (cim-instance-namespace cim-instance)))))
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


;; need a client-side representation of cim-classes i.e. something more abstract than the CLOS cim-class 
;; metaclass.
;; we use this when decoding because we don't whether what we're decoding is junk or not. often it 
;; doesn't make sense to decode directly into the CLOS objects.
(defstruct cim-class-declaration 
  name slots qualifiers methods superclass)

(defmethod cim-name ((cim cim-class-declaration))
  (cim-class-declaration-name cim))

(defmethod cim-qualifiers ((cim cim-class-declaration))
  (cim-class-declaration-qualifiers cim))

(defmethod print-object ((cim cim-class-declaration) stream)
  (format stream "#S(CIM-CLASS-DECLARATION ~A)" (cim-name cim)))

