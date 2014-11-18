
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ConditioningServiceOnEndpoint.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CONDITIONINGSERVICEONENDPOINT (CIM_DEPENDENCY)
              ((SERVICETYPE UINT16 :CIM-NAME "ServiceType" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_IngressConditioningServiceOnEndpoint"
                   "CIM_EgressConditioningServiceOnEndpoint"))
                 (:DESCRIPTION
                  "Indicates whether a packet is incoming (value = 1, \"Ingress\") or out-going (value = 2, \"Egress\") at the ProtocolEndpoint, relative to the ConditioningService.")
                 (:VALUE-MAP ("0" "1" "2"))
                 (:VALUES ("Unknown" "Ingress" "Egress")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_IngressConditioningServiceOnEndpoint.Antecedent"
                   "CIM_EgressConditioningServiceOnEndpoint.Antecedent"))
                 (:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "The ProtocolEndpoint through which traffic arrives at or leaves from a network device.")
                 :KEY)
                :INITFORM "CIM_ProtocolEndpoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_IngressConditioningServiceOnEndpoint.Dependent"
                   "CIM_EgressConditioningServiceOnEndpoint.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The ConditioningService which begins or ends the traffic conditioning processing within a network device.")
                 :KEY)
                :INITFORM "CIM_ConditioningService"))
              (:CIM-NAME "CIM_ConditioningServiceOnEndpoint")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED
                ("CIM_IngressConditioningServiceOnEndpoint"
                 "CIM_EgressConditioningServiceOnEndpoint"))
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "The QoS Model describes the traffic conditioning functions in place for a network device. In order to 'be conditioned', a packet is received at a ProtocolEndpoint. After 'conditioning', a packet is dropped or leaves the device via a ProtocolEndpoint. This dependency on ProtocolEndpoints is defined by the ConditioningServiceOn Endpoint association. A property of the association, ServiceType, indicates whether the ConditioningService handles incoming (\"Ingress\") or out-going (\"Egress\") packets. This association is deprecated since different cardinalities are needed on the ingress and egress classes. This cannot be done using a single association.")))