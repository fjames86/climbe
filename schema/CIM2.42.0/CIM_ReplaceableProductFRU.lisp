
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ReplaceableProductFRU.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_REPLACEABLEPRODUCTFRU NIL
              ((PRODUCT NIL :CIM-NAME "Product" :QUALIFIERS
                (:KEY (:MAX "1")
                 (:DESCRIPTION "The Product to which the FRU is applied."))
                :INITFORM "CIM_Product")
               (FRU NIL :CIM-NAME "FRU" :QUALIFIERS
                (:KEY (:DESCRIPTION "The FRU.")) :INITFORM "CIM_FRU"))
              (:CIM-NAME "CIM_ReplaceableProductFRU")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Core::ProductFRU")
               (:DESCRIPTION
                "ReplaceableProductFRU is an association between Product and FRU that shows what Product components may be replaced. The association is one to many, conveying that a Product can have many FRUs, and that a particular instance of a FRU is only applied to one (instance of a) Product.")))