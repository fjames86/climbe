
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IPsecPolicyForEndpoint.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_IPSECPOLICYFORENDPOINT (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The IPProtocolEndpoint that identifies an interface to which the PolicyGroup applies.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IPsecPolicyForEndpoint.Antecedent"))
                 :KEY)
                :INITFORM "CIM_IPProtocolEndpoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "0") (:MAX "1")
                 (:DESCRIPTION
                  "The PolicyGroup that defines the IPsec negotiation policy for the Endpoint.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IPsecPolicyForEndpoint.Dependent"))
                 :KEY)
                :INITFORM "CIM_PolicyGroup"))
              (:CIM-NAME "CIM_IPsecPolicyForEndpoint")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::IPsecPolicy")
               (:DESCRIPTION
                "IPsecPolicyForEndpoint associates a PolicyGroup with a specific IP endpoint. This association's policies take priority over any PolicyGroup defined generically for the hosting system. The latter is defined using the IPsecPolicyForSystem association.")
               (:MAPPING-STRINGS
                ("IPSP Policy Model.IETF|IPsecPolicyForEndpoint"))))