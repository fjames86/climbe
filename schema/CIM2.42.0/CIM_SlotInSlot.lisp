
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SlotInSlot.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SLOTINSLOT (CIM_CONNECTEDTO)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The Antecedent represents the existing Slot(s) of the HostingBoard, or Frame that are being adapted to accommodate a Card that would otherwise not be physically and/or electrically compatible with it.")
                 :KEY)
                :INITFORM "CIM_Slot")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "The new Slot provided by the adapter board.")
                 :KEY)
                :INITFORM "CIM_Slot"))
              (:CIM-NAME "CIM_SlotInSlot")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Connector")
               (:DESCRIPTION
                "Slots are special types of Connectors into which adapter Cards are typically inserted. The SlotInSlot relationship represents the ability of a special adapter to extend the existing Slot structure to enable otherwise incompatible Cards to be plugged into a Frame or Hosting Board. The adapter effectively creates a new Slot and can be thought of (conceptually) as a Slot in a Slot. This enables Cards that would otherwise be physically and/or electrically incompatible with the existing Slots to be supported, by interfacing to the Slot provided by the adapter. This has many practical uses. For example, networking boards are very expensive. As new hardware becomes available, Chassis and even Card configurations change. To protect the investment of their customers, networking vendors will manufacture special adapters that enable old Cards to fit into new Chassis or Hosting Boards and/or new Cards to fit into old. This is done using a special adapter that fits over one or more existing Slots and presents a new Slot into which the Card can plug.")))