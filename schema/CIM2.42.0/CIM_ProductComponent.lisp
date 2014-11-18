
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProductComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRODUCTCOMPONENT (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "The Product which contains another Product as a component. The cardinality of this reference takes the default values (no minimum or maximum) since an instance of Product can describe either a general product type, or a specific item that is acquired. In the case of a specific item, a cardinality of Max(1) is indicated. However, when dealing with the general description/templating of a Product, then it may be a component of several others and a cardinality of Max(1) would be invalid.")
                 (:MODEL-CORRESPONDENCE ("PRS_ProductComponent.Antecedent"))
                 :KEY)
                :INITFORM "CIM_Product")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The contained Product.")
                 (:MODEL-CORRESPONDENCE ("PRS_ProductComponent.Dependent"))
                 :KEY)
                :INITFORM "CIM_Product"))
              (:CIM-NAME "CIM_ProductComponent")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_ConcreteComponent"))
               (NIL "true") :COMPOSITION (:VERSION "2.15.0")
               (:UML-PACKAGE-PATH "CIM::Core::ProductFRU")
               (:DESCRIPTION
                "The CIM_ProductComponent association defines a containment and component relationship among Products. For example, a Product may come bundled with other Products. 
Note that this association duplicates ProductParentChild. The latter association is maintained for legacy reasons. This association, ProductComponent, is added for ease of query and modeling consistency. Using ProductComponent, an application can query for all Component relationships for a Product, versus querying the various Component relationships AND ProductParentChild.")))