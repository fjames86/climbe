
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Container.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CONTAINER (CIM_COMPONENT)
              ((LOCATIONWITHINCONTAINER STRING :CIM-NAME
                "LocationWithinContainer" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string representing the positioning of the PhysicalElement within the PhysicalPackage. Information relative to stationary elements in the Container (for example, 'second drive bay from the top'), angles, altitudes and other data may be recorded in this property. This string could supplement or be used in place of instantiating the CIM_Location object.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Entity-MIB.entPhysicalParentRelPos")))
                :INITFORM NIL)
               (GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION
                  "The PhysicalPackage that contains other PhysicalElements, including other Packages.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Entity-MIB.entPhysicalContainedIn"))
                 :KEY)
                :INITFORM "CIM_PhysicalPackage")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The PhysicalElement which is contained in the Package.")
                 :KEY)
                :INITFORM "CIM_PhysicalElement"))
              (:CIM-NAME "CIM_Container")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Package")
               (:DESCRIPTION
                "The Container association represents the relationship between a contained and a containing PhysicalElement. A containing object must be a PhysicalPackage.")))