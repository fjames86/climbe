
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SwitchPortDynamicForwarding.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SWITCHPORTDYNAMICFORWARDING (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The SwitchPort.") :KEY)
                :INITFORM "CIM_SwitchPort")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "DynamicForwardingEntry of the forwarding database.")
                 :KEY)
                :INITFORM "CIM_DynamicForwardingEntry"))
              (:CIM-NAME "CIM_SwitchPortDynamicForwarding")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::SwitchingBridging")
               (:DESCRIPTION
                "This association links a DynamicForwardingEntry and the SwitchPort to which the entry applies.")))