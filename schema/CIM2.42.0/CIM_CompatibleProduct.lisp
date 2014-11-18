
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CompatibleProduct.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COMPATIBLEPRODUCT NIL
              ((COMPATIBILITYDESCRIPTION STRING :CIM-NAME
                "CompatibilityDescription" :QUALIFIERS
                ((:DESCRIPTION
                  "CompatibilityDescription is a free-form string defining how the two referenced Products interoperate or are compatible, any limitations to compatibility, etc."))
                :INITFORM NIL)
               (PRODUCT NIL :CIM-NAME "Product" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The Product for which compatible offerings are defined."))
                :INITFORM "CIM_Product")
               (COMPATIBLEPRODUCT NIL :CIM-NAME "CompatibleProduct" :QUALIFIERS
                (:KEY (:DESCRIPTION "The compatible Product.")) :INITFORM
                "CIM_Product"))
              (:CIM-NAME "CIM_CompatibleProduct")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Core::ProductFRU")
               (:DESCRIPTION
                "CIM_CompatibleProduct is an association between Products that can indicate a wide variety of information. For example, it can indicate that the two referenced Products interoperate, that they can be installed together, that one can be the physical container for the other, etc. The string property, CompatibilityDescription, defines how the Products interoperate or are compatible, any limitations regarding interoperability or installation, ...")))