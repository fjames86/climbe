
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FilterOfPacketCondition.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FILTEROFPACKETCONDITION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "A FilterList describes the traffic selected by the PacketFilterCondition. A PacketFilterCondition is associated with one and only one FilterList, but that filter list may aggregate many filter entries.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|FilterOfSACondition.Antecedent"))
                 :KEY)
                :INITFORM "CIM_FilterList")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The PacketFilterCondition that uses the FilterList as part of a PolicyRule.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|FilterOfSACondition.Dependent"))
                 :KEY)
                :INITFORM "CIM_PacketFilterCondition"))
              (:CIM-NAME "CIM_FilterOfPacketCondition")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "FilterOfPacketCondition associates a network traffic specification (i.e., a FilterList) with a PolicyRule's PacketFilterCondition.")
               (:MAPPING-STRINGS
                ("IPSP Policy Model.IETF|FilterOfSACondition"))))