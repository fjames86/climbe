
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MemoryOnCard.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MEMORYONCARD (CIM_PACKAGEDCOMPONENT)
              ((LOCATIONWITHINCONTAINER STRING :CIM-NAME
                "LocationWithinContainer" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string representing the positioning of the PhysicalElement within the PhysicalPackage. Information relative to stationary elements in the Container (for example, 'second drive bay from the top'), angles, altitudes and other data may be recorded in this property. This string could supplement or be used in place of instantiating the CIM_Location object.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Entity-MIB.entPhysicalParentRelPos")))
                :INITFORM NIL)
               (GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION "The Card that includes or 'contains' Memory.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Entity-MIB.entPhysicalContainedIn"))
                 :KEY)
                :INITFORM "CIM_Card")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The PhysicalMemory which is located on the Card.")
                 :KEY)
                :INITFORM "CIM_PhysicalMemory"))
              (:CIM-NAME "CIM_MemoryOnCard")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Component")
               (:DESCRIPTION
                "PhysicalMemory can be located on HostingBoards, adapter Cards, etc. This association explicitly defines this relationship of Memory to Cards.")))