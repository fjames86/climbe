
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_EgressConditioningServiceOnEndpoint.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_EGRESSCONDITIONINGSERVICEONENDPOINT
              (CIM_SERVICESAPDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "The ProtocolEndpoint through which traffic leaves a network device.")
                 :KEY)
                :INITFORM "CIM_ProtocolEndpoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The ConditioningService which ends the traffic conditioning processing within a network device.")
                 :KEY)
                :INITFORM "CIM_ConditioningService"))
              (:CIM-NAME "CIM_EgressConditioningServiceOnEndpoint")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "This association represents the binding, in the egress direction, between a ProtocolEndpoint and the last ConditioningService that processes packets before they leave a network device (via that ProtocolEndpoint). This 'last' ConditioningService is ordinarily a scheduler, but it does not have to be. There can be multiple 'last' ConditioningServices for an Endpoint (for example, in the case of a fallback scheduler). Therefore, the cardinality for the Dependent object reference remains 0..n. On the other hand, a single ConditioningService cannot be the last one to process packets for multiple Endpoints. So, the cardinality of the Antecedent object reference is narrowed from 0..n to 0..1.")))