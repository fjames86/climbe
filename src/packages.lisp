
(defpackage :climbe
  (:use :cl)
  (:export
   ;; utils
   :defconstant*

   ;; errors
   :cim-error
   :ignore-cim-errors
   :cim-error-code
   :cim-error-description

   ;; namespaces
   :cim-namespace
   :in-namespace
   :find-namespace
   :namespace-tree
   :with-namespace
   :namespace-list
   :namespace-path
   :cim-namespace-path
   :cim-namespace-path-host
   :cim-namespace-path-namespace-list 
   :namespace-path-host 
   :namespace-path-namespace-list 
   :parse-namespace
   
   ;; types
   :sint8
   :sint16
   :sint32
   :sint64
   :uint8
   :uint16
   :uint32
   :uint64
   :real32
   :real64
   :char16
   :cim-datetime
   :cim-interval
   :datetime
   :cim-primitive
   
   ;; qualifiers
   :cim-qualifier
   :find-qualifier
   :defqualifier
   :cim-qualifier-type
   :cim-qualifier-scope
   :cim-qualifier-flavour
   :cim-qualifier-default 
   
   ;; the metaclasses
   :cim-class
   :cim-association
   :cim-indication
   :cim-class-slots
   :cim-slot-type
   :cim-class-superclasses
   :cim-class-subclasses
   :find-cim-class
   :add-class-to-namespace
   :cim-key-slots
   :cim-class-methods
   :cim-name
   :cim-qualifiers
   :def-cim-class
   :def-cim-method
   :find-cim-method
   :invoke-method
   :cim-method
   :cim-method-parameters
   :defcim
   :cim-parameter  
   :cim-parameter-type
   
   ;; cimom
   :provider-enumerate-instances
   :enumerate-instances
   :provider-get-instance
   :get-instance
   :provider-create-instance
   :create-instance
   :provider-modify-instance
   :modify-instance
   :provider-delete-instance
   :delete-instance
   :provider-association-instances
   :association-instances
   :provider-reference-instances
   :reference-instances

   ;; messages
   :cim-message
   :cim-message-request
   :cim-message-response
   :cim-message-id
   :cim-request
   :cim-request-method-name
   :cim-request-intrinsic-p
   :cim-request-namespace-path
   :cim-request-arguments
   :cim-response
   :cim-response-method-name
   :cim-response-intrinsic-p
   :cim-response-return-value
   :cim-response-out-parameters
   :cim-reference
   :cim-reference-p
   :cim-reference-namespace
   :cim-reference-classname
   :cim-reference-keyslots
   
   ))


   

