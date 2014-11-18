
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_TrapSourceForSNMPService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_TRAPSOURCEFORSNMPSERVICE (CIM_SERVICESAPDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The endpoint that acts as the trap source.")
                 :KEY)
                :INITFORM "CIM_ProtocolEndpoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The SNMP service that sends the notifications.")
                 :KEY)
                :INITFORM "CIM_SNMPService"))
              (:CIM-NAME "CIM_TrapSourceForSNMPService")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::SNMP")
               (:DESCRIPTION
                "TrapSourceForSNMPService specifies the protocol endpoint/interface (and hence its IP address) from which traps originate.")))