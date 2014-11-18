
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CardInSlot.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CARDINSLOT (CIM_PACKAGEINSLOT)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The Slot into which the Card is inserted.")
                 :KEY)
                :INITFORM "CIM_Slot")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "The Card in the Slot.") :KEY)
                :INITFORM "CIM_Card"))
              (:CIM-NAME "CIM_CardInSlot")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Connector")
               (:DESCRIPTION
                "Slots are special types of Connectors into which adapter Cards are inserted. This relationship of a Card in a Slot is made explicit using the CardInSlot association.")
               (:MAPPING-STRINGS ("MIF.DMTF|System Slot|005.4"))))