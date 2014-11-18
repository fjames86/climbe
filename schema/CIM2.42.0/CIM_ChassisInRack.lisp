
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ChassisInRack.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CHASSISINRACK (CIM_CONTAINER)
              ((BOTTOMU UINT16 :CIM-NAME "BottomU" :QUALIFIERS
                ((:DESCRIPTION
                  "An integer indicating the lowest or 'bottom' U in which the Chassis is mounted. A 'U' is a standard unit of measure for the height of a Rack or rack-mountable component. It is equal to 1.75 inches or 4.445 cm.")
                 (NIL "Us") (:P-UNIT "rack unit"))
                :INITFORM NIL)
               (LOCATIONWITHINCONTAINER STRING :CIM-NAME
                "LocationWithinContainer" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string representing the positioning of the PhysicalElement within the PhysicalPackage. Information relative to stationary elements in the Container (for example, 'second drive bay from the top'), angles, altitudes and other data may be recorded in this property. This string could supplement or be used in place of instantiating the CIM_Location object.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Entity-MIB.entPhysicalParentRelPos")))
                :INITFORM NIL)
               (GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION "The Rack that contains the Chassis.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Entity-MIB.entPhysicalContainedIn"))
                 :KEY)
                :INITFORM "CIM_Rack")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The Chassis which is mounted in the Rack.")
                 :KEY)
                :INITFORM "CIM_Chassis"))
              (:CIM-NAME "CIM_ChassisInRack")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.21.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Package")
               (:DESCRIPTION
                "Racks, as simple enclosures, contain Chassis that provide the physical componentry realizing processing nodes, storage devices, UPSs, etc. The ChassisInRack association makes explicit the 'containing' relationship between the Rack and the Chassis.")))