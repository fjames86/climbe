
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SwitchPortStaticForwarding.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SWITCHPORTSTATICFORWARDING (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The SwitchPort.") :KEY)
                :INITFORM "CIM_SwitchPort")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "StaticForwardingEntry of static database.")
                 :KEY)
                :INITFORM "CIM_StaticForwardingEntry"))
              (:CIM-NAME "CIM_SwitchPortStaticForwarding")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::SwitchingBridging")
               (:DESCRIPTION
                "This association links a static database entry and the SwitchPort to which the entry applies.")))