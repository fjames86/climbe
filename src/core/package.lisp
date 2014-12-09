

(in-package #:cl-user)

(defpackage #:climbe.core
  (:use #:cl #:climbe.utils)
  (:export #:cim-error
           #:make-cim-error
           #:ignore-cim-errors
		   #:cim-error-code
		   #:cim-error-description
		   
           #:cim-name
           #:cim-qualifiers
           #:cim-type

           #:cim-namespace
           #:make-cim-namespace
           #:cim-namespace-name
           #:cim-namespace-parent
           #:cim-namespace-children
           #:cim-namespace-classes
           #:cim-namespace-qualifiers
           #:parse-namespace
           #:find-namespace
           #:ensure-namespace
           #:namespace-tree
           #:namespace-list 
           #:*namespace*
           #:in-namespace
           #:with-namespace           
           #:namespace-path
           #:make-namespace-path
           #:namespace-path-host
           #:namespace-path-namespace-list
           #:namespace-path-string
           
           #:uint8
           #:sint8
           #:uint16
           #:sint16
           #:uint32
           #:sint32
           #:uint64
           #:sint64
           #:real32
           #:real64
           #:char16

           #:cim-datetime
           #:make-cim-datetime
           #:cim-datetime-year
           #:cim-datetime-month
           #:cim-datetime-day
           #:cim-datetime-hour
           #:cim-datetime-minute
           #:cim-datetime-second
           #:cim-datetime-milli
           #:cim-datetime-utc

           #:cim-datetime-string
           #:string-cim-datetime

           #:cim-interval
           #:make-cim-interval
           #:cim-interval-days
           #:cim-interval-hours
           #:cim-interval-minutes
           #:cim-interval-seconds
           #:cim-interval-micro
           #:cim-interval-p
           
           #:cim-interval-string
           #:string-cim-interval

           #:datetime
           #:string-datetime
           #:datetime-string

           #:cim-primitive

           #:cim-flavour
           #:cim-scope
           
           #:cim-qualifier
           #:make-cim-qualifier
           #:cim-qualifer-name
           #:cim-qualifier-type
           #:cim-qualifier-scope
           #:cim-qualifier-flavour
           #:cim-qualifier-default 
           #:cim-qualifier-qualifiers
           #:cim-qualifier-name
		   
           #:find-qualifier
           #:cim-qualifier-symbol
           #:make-qualifiers-list
		   #:qualifiers-list-helper
           #:defqualifier
           #:qualifier-p

           #:cim-parameter
           #:make-cim-parameter
           #:cim-parameter-name
           #:cim-parameter-type
           #:cim-parameter-qualifiers
           #:cim-parameter-p

           #:cim-method
           #:make-cim-method
           #:cim-method-name
           #:cim-method-return-type
           #:cim-method-in-params
           #:cim-method-out-params
           #:cim-method-qualifiers
           #:cim-method-function
           #:cim-method-symbol
           #:cim-method-p
           #:cim-method-parameters
           
           #:cim-message
           #:make-cim-message
           #:cim-message-request
           #:cim-message-response
           #:cim-message-id
           #:cim-message-exp-request
           #:cim-message-exp-response
           #:cim-message-p

           #:cim-declaration
           #:make-cim-declaration
           #:cim-declaration-namespace
           #:cim-declaration-qualifiers
           #:cim-declaration-classes
           #:cim-declaration-p

           #:cim-request
           #:make-cim-request
           #:cim-request-method-name
           #:cim-request-intrinsic-p
           #:cim-request-namespace-path
           #:cim-request-arguments
           #:cim-request-reference
           #:cim-request-p

           #:cim-response
           #:make-cim-response
           #:cim-response-method-name
           #:cim-response-intrinsic-p
           #:cim-response-return-value
           #:cim-response-return-type
           #:cim-response-out-parameters
           #:cim-response-error
           #:cim-response-p

           #:cim-instance
           #:make-cim-instance
           #:cim-instance-namespace
           #:cim-instance-name
           #:cim-instance-slots
           #:cim-instance-p
	   #:cim-slot-value

           #:cim-class
           #:make-cim-class
           #:cim-class-name
           #:cim-class-slots
           #:cim-class-qualifiers
           #:cim-class-methods
           #:cim-class-superclass
           #:cim-class-p
	   #:cim-class-method-names
	   #:cim-class-slot-names

           #:cim-slot
           #:make-cim-slot
           #:cim-slot-name
           #:cim-slot-type
           #:cim-slot-default
           #:cim-slot-qualifiers
           #:cim-slot-p


           ))


           

           
         
           
