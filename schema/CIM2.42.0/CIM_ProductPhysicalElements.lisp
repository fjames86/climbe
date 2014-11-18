
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProductPhysicalElements.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRODUCTPHYSICALELEMENTS NIL
              ((PRODUCT NIL :CIM-NAME "Product" :QUALIFIERS
                ((:DEPRECATED ("CIM_ProductPhysicalComponent.GroupComponent"))
                 :KEY :AGGREGATE (:MAX "1") (:DESCRIPTION "The Product."))
                :INITFORM "CIM_Product")
               (COMPONENT NIL :CIM-NAME "Component" :QUALIFIERS
                ((:DEPRECATED ("CIM_ProductPhysicalComponent.PartComponent"))
                 :KEY
                 (:DESCRIPTION
                  "The PhysicalElement which is a part of the Product."))
                :INITFORM "CIM_PhysicalElement"))
              (:CIM-NAME "CIM_ProductPhysicalElements")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ProductPhysicalComponent")) (NIL "true")
               :COMPOSITION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Core::ProductFRU")
               (:DESCRIPTION
                "Indicates the PhysicalElement(s) that make up a Product. This association is deprecated in order to correctly place it in the inheritance hierarchy and align the definition with other new classes that are being added to the model, such as CIM_ProductServiceComponent. ProductPhysicalElements was defined in the original CIM V2.0 release, when a Managed Element and a Component relationship between ManagedElements did not exist.")))