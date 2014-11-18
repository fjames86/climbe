
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PackagedComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PACKAGEDCOMPONENT (CIM_CONTAINER)
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
                  "The PhysicalPackage that contains Component(s).")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Entity-MIB.entPhysicalContainedIn"))
                 :KEY)
                :INITFORM "CIM_PhysicalPackage")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The PhysicalComponent which is contained in the Package.")
                 :KEY)
                :INITFORM "CIM_PhysicalComponent"))
              (:CIM-NAME "CIM_PackagedComponent")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Component")
               (:DESCRIPTION
                "A Component is typically contained by a PhysicalPackage, such as a Chassis or Card. The PackagedComponent association makes this relationship explicit. In the first sentence, the word, 'typically', is used. This is because a Component may be removed from, or not yet inserted into, its containing Package (ie, the Removable boolean is TRUE). Therefore, a Component may not always be associated with a container.")))