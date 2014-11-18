
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CardOnCard.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CARDONCARD (CIM_CONTAINER)
              ((MOUNTORSLOTDESCRIPTION STRING :CIM-NAME
                "MountOrSlotDescription" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing and identifying how the Card is mounted on or plugged into the 'other' Card. Slot information could be included in this field and may be sufficient for certain management purposes. If so, this avoids creating instantiations of Connector/Slot objects just to model the relationship of Cards to HostingBoards or other adapters. On the other hand, if Slot and Connector information is available, this field could be used to provide more detailed mounting or slot insertion data."))
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
                 (:DESCRIPTION "The Card that hosts another Card.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Entity-MIB.entPhysicalContainedIn"))
                 :KEY)
                :INITFORM "CIM_Card")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The Card that is plugged into or otherwise mounted on another Card.")
                 :KEY)
                :INITFORM "CIM_Card"))
              (:CIM-NAME "CIM_CardOnCard")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Package")
               (:DESCRIPTION
                "Cards may be plugged into Motherboards/baseboards, are daughtercards of an adapter, or support special Card-like modules. These relationships are described by the CardOnCard association.")))