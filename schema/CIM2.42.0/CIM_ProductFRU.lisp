
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProductFRU.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRODUCTFRU NIL
              ((PRODUCT NIL :CIM-NAME "Product" :QUALIFIERS
                (:KEY (:MAX "1")
                 (:DESCRIPTION "The Product to which the FRU is applied."))
                :INITFORM "CIM_Product")
               (FRU NIL :CIM-NAME "FRU" :QUALIFIERS
                (:KEY (:DESCRIPTION "The FRU.")) :INITFORM "CIM_FRU"))
              (:CIM-NAME "CIM_ProductFRU")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Core::ProductFRU")
               (:DESCRIPTION
                "CIM_ProductFRU is an association between Product and FRU that provides information regarding what Product components have been or are being replaced. The association is one to many, conveying that a Product can have many FRUs, and that a particular instance of a FRU is only applied to one (instance of a) Product.")))