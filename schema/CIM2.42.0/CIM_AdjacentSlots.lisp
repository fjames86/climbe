
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AdjacentSlots.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ADJACENTSLOTS NIL
              ((DISTANCEBETWEENSLOTS REAL32 :CIM-NAME "DistanceBetweenSlots"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The distance, in inches, between adjacent Slots.")
                 (NIL "Inches") (:P-UNIT "inch"))
                :INITFORM NIL)
               (SHAREDSLOTS BOOLEAN :CIM-NAME "SharedSlots" :QUALIFIERS
                ((:DESCRIPTION
                  "Slots can be located in close proximity on Hosting Boards or other Cards, such that if one of these Slots is populated by an adapter Card, the other Slot must be left empty. This relationship is indicated by the SharedSlots boolean set to TRUE."))
                :INITFORM NIL)
               (SLOTA NIL :CIM-NAME "SlotA" :QUALIFIERS
                (:KEY (:DESCRIPTION "One of the adjacent Slots.")) :INITFORM
                "CIM_Slot")
               (SLOTB NIL :CIM-NAME "SlotB" :QUALIFIERS
                (:KEY (:DESCRIPTION "The 'other' adjacent Slot.")) :INITFORM
                "CIM_Slot"))
              (:CIM-NAME "CIM_AdjacentSlots")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Connector")
               (:DESCRIPTION
                "AdjacentSlots describes the layout of Slots on a HostingBoard or adapter Card. Information like the distance between the Slots and whether they are 'shared' (if one is populated, then the other Slot can not be used), is conveyed as properties of the association.")))