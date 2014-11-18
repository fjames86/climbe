
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IngressConditioningServiceOnEndpoint.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_INGRESSCONDITIONINGSERVICEONENDPOINT
              (CIM_SERVICESAPDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The ProtocolEndpoint through which traffic arrives at a network device.")
                 :KEY)
                :INITFORM "CIM_ProtocolEndpoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION
                  "The ConditioningService which begins the traffic conditioning processing within a network device.")
                 :KEY)
                :INITFORM "CIM_ConditioningService"))
              (:CIM-NAME "CIM_IngressConditioningServiceOnEndpoint")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "This association represents the binding, in the ingress direction, between a ProtocolEndpoint and the first ConditioningService that processes packets received via that Endpoint. Since there can only be one 'first' ConditioningService for a ProtocolEndpoint, the cardinality for the Dependent object reference is narrowed from 0..n to 0..1. On the other hand, a single ConditioningService can be the first to process packets received via multiple ProtocolEndpoints. So, the cardinality of the Antecedent object reference remains 0..n.")))