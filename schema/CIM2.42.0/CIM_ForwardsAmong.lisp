
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ForwardsAmong.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FORWARDSAMONG (CIM_SERVICESAPDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The ProtocolEndpoints that are used to forward the data.")
                 :KEY)
                :INITFORM "CIM_ProtocolEndpoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The service that is forwarding the data.")
                 :KEY)
                :INITFORM "CIM_ForwardingService"))
              (:CIM-NAME "CIM_ForwardsAmong")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::RoutingForwarding")
               (:DESCRIPTION
                "This association represents the dependency that exists between the ProtocolEndpoints that are used to forward data and the ForwardingService that is performing the forwarding of data.")))