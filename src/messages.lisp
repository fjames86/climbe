
(in-package :climbe)

;; structure for holding CIM messages in
(defstruct cim-message 
  request response id)

(defstruct cim-request 
  method-name intrinsic-p namespace-path arguments)

(defstruct cim-response
  method-name intrinsic-p return-value out-parameters)


