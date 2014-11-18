
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_TransparentBridgingDynamicForwarding.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_TRANSPARENTBRIDGINGDYNAMICFORWARDING (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The transparent bridging service.") :KEY)
                :INITFORM "CIM_TransparentBridgingService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION
                  "Dynamic Forwarding Entry of forwarding database.")
                 :KEY)
                :INITFORM "CIM_DynamicForwardingEntry"))
              (:CIM-NAME "CIM_TransparentBridgingDynamicForwarding")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::SwitchingBridging")
               (:DESCRIPTION
                "This association links an instance of the Transparent BridgingService to the entries of its forwarding database. The forwarding database is weak to the Service.")))