
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProductProductDependency.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRODUCTPRODUCTDEPENDENCY NIL
              ((TYPEOFDEPENDENCY UINT16 :CIM-NAME "TypeOfDependency"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The nature of the Product dependency. This property describes that the associated Product must be installed (value=2) or must be absent (value=3) in order for the Product to function.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES
                  ("Unknown" "Other" "Product Must Be Installed"
                   "Product Must Not Be Installed")))
                :INITFORM NIL)
               (REQUIREDPRODUCT NIL :CIM-NAME "RequiredProduct" :QUALIFIERS
                (:KEY (:DESCRIPTION "The required Product.")) :INITFORM
                "CIM_Product")
               (DEPENDENTPRODUCT NIL :CIM-NAME "DependentProduct" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The Product that is dependent on another Product."))
                :INITFORM "CIM_Product"))
              (:CIM-NAME "CIM_ProductProductDependency")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Core::ProductFRU")
               (:DESCRIPTION
                "CIM_ProductProductDependency is an association between two Products, indicating that one must be installed, or must be absent, for the other to function. This is conceptually equivalent to the ServiceServiceDependency association.")))