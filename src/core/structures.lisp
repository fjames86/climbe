
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

;; CIM-CLASS is a client-side representation of a CIM class definition. 
;; It should be used everywhere outside the cimom module (where we use real CLOS meta-class instances).
(defstruct cim-class
  name slots qualifiers methods superclass)

(defmethod cim-name ((cim cim-class))
  (cim-class-name cim))

(defmethod cim-qualifiers ((cim cim-class))
  (cim-class-qualifiers cim))

(defmethod print-object ((cim cim-class) stream)
  (format stream "#S(CIM-CLASS ~A :SLOTS ~A :METHODS ~A)" 
	  (cim-name cim)
	  (mapcar #'cim-name (cim-class-slots cim))
	  (mapcar #'cim-name (cim-class-methods cim))))


;; slots
(defstruct cim-slot 
  name type default qualifiers origin)

(defmethod cim-name ((cim cim-slot))
  (cim-slot-name cim))

(defmethod cim-qualifiers ((cim cim-slot))
  (cim-slot-qualifiers cim))

(defmethod cim-type ((cim cim-slot))
  (cim-slot-type cim))

