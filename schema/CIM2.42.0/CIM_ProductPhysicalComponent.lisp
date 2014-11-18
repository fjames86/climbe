
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProductPhysicalComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRODUCTPHYSICALCOMPONENT (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                ((:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION "The Product.") :KEY :AGGREGATE)
                :INITFORM "CIM_Product")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The PhysicalElement which is a part of the Product.")
                 :KEY)
                :INITFORM "CIM_PhysicalElement"))
              (:CIM-NAME "CIM_ProductPhysicalComponent")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Core::ProductFRU")
               (:DESCRIPTION
                "Indicates that the referenced PhysicalElement is acquired as part of a Product.")))