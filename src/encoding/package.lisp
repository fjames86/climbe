
(in-package #:cl-user)

(defpackage #:climbe.encoding
  (:use #:cl 
        #:climbe.utils 
        #:climbe.core
	#:climbe.cimom)
  (:export #:encode-cimxml-cim
           #:encode-get-class
           #:encode-get-instance
           #:encode-delete-instance
           #:encode-create-instance
           #:encode-modify-instance
           #:encode-enumerate-classes
           #:encode-enumerate-class-names
           #:encode-enumerate-instances
           #:encode-enumerate-instance-names
           #:encode-associators
           #:encode-associator-names
           #:encode-references
           #:encode-reference-names
           #:encode-enumerate-qualifiers
	   #:encode-invoke-method

           #:encode-cimxml-response

	   #:encode-wsman-identity
	   #:encode-wsman-get-class
	   #:encode-wsman-enumerate-classes
	   #:encode-wsman-enumerate-instances
	   #:encode-wsman-pull

	   #:encode-wsman-get-instance
	   #:encode-wsman-enumerate-associations

           ))






