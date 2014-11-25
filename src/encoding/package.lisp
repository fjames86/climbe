
(in-package #:cl-user)

(defpackage #:climbe.encoding
  (:use #:cl 
        #:climbe.utils 
        #:climbe.core)
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

           #:encode-cimxml-response


	   #:encode-wsman-get-cim-class
           ))






