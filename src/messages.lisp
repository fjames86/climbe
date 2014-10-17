
(in-package :climbe)

(defstruct cim-message 
  method-name)

(defstruct (cim-request (:include cim-message))
  intrinsic-p arguments)

(defstruct (cim-response (:include cim-message))
  intrinsic-p arguments out-params)
			 

  
