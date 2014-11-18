
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProductSupport.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRODUCTSUPPORT NIL
              ((PRODUCT NIL :CIM-NAME "Product" :QUALIFIERS
                (:KEY (:DESCRIPTION "The Product.")) :INITFORM "CIM_Product")
               (SUPPORT NIL :CIM-NAME "Support" :QUALIFIERS
                (:KEY (:DESCRIPTION "Support for the Product.")) :INITFORM
                "CIM_SupportAccess"))
              (:CIM-NAME "CIM_ProductSupport")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Core::ProductFRU")
               (:DESCRIPTION
                "CIM_ProductSupport is an association between Product and SupportAccess that conveys how support is obtained for the Product. This is a many-to-many relationship, implying that various types of Support are available for a Product, and that the same Support object can provide assistance for multiple Products.")))