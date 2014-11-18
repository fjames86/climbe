
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProductElementComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRODUCTELEMENTCOMPONENT (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:KEY :AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION "The Product."))
                :INITFORM "CIM_Product")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                (:KEY (:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The ManagedElement which is a part of the Product."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_ProductElementComponent")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.29.0") (:UML-PACKAGE-PATH "CIM::Core::ProductFRU")
               (:DESCRIPTION
                "Indicates that the referenced ManagedElement is part of a Product.")))