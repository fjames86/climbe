
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PackageInChassis.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PACKAGEINCHASSIS (CIM_CONTAINER)
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
                  "The Chassis that contains other PhysicalPackages.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Entity-MIB.entPhysicalContainedIn"))
                 :KEY)
                :INITFORM "CIM_Chassis")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The PhysicalPackage which is contained in the Chassis.")
                 :KEY)
                :INITFORM "CIM_PhysicalPackage"))
              (:CIM-NAME "CIM_PackageInChassis")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Package")
               (:DESCRIPTION
                "A Chassis can contain other Packages, such as other Chassis and Cards. The PackageInChassis association makes explicit this relationship.")))