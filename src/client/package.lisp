
(in-package #:cl-user)

(defpackage #:climbe.client
  (:use #:cl
        #:climbe.utils
        #:climbe.core
        #:climbe.encoding
        #:climbe.decoding)
  (:export #:call-cim-server
           #:*cim-uri*
           #:*cim-namespace*
           #:call-get-class
           #:call-get-instance
           #:call-create-instance
           #:call-delete-instance
           #:call-modify-instance
           #:call-enumerate-classes
           #:call-enumerate-class-names
           #:call-enumerate-instances
           #:call-enumerate-instance-names
           #:call-associators
           #:call-associator-names
           #:call-references
           #:call-reference-names
           #:call-enumerate-qualifiers

	   #:*wsman-username*
	   #:*wsman-password*
	   #:*wsman-uri*
           #:call-wsman
	   #:call-wsman-identity
	   #:call-wsman-get-class
	   #:call-wsman-enumerate-classes
	   #:call-wsman-get-instance
	   #:call-wsman-enumerate-instances
	   #:call-wsman-renew 

           ))



