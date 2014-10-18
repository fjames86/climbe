
(in-package :climbe)

;; structure for holding CIM messages in
(defstruct cim-message 
  request response id)

(defstruct cim-request 
  method-name intrinsic-p namespace-path arguments reference)

(defstruct cim-response
  method-name intrinsic-p return-value out-parameters)


(defstruct cim-reference
  namespace classname keyslots)

(defstruct cim-instance
  namespace classname slots)




