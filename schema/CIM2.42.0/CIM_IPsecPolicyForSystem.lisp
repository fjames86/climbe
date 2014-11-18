
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IPsecPolicyForSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_IPSECPOLICYFORSYSTEM (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "A System to which the PolicyGroup applies.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IPsecPolicyForSystem.Antecedent"))
                 :KEY)
                :INITFORM "CIM_System")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "0") (:MAX "1")
                 (:DESCRIPTION
                  "The PolicyGroup that defines the 'default' IPsec negotiation policy for the System.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IPsecPolicyForSystem.Dependent"))
                 :KEY)
                :INITFORM "CIM_PolicyGroup"))
              (:CIM-NAME "CIM_IPsecPolicyForSystem")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::IPsecPolicy")
               (:DESCRIPTION
                "IPsecPolicyForSystem associates a PolicyGroup with a specific system (e.g., a host or a network device) - indicating that this is the 'default' IPsec policy for that system. The referenced PolicyGroup would be used for any IPProtocolEndpoint's IPsec negotiations, UNLESS the IPsecPolicyForEndpoint association is defined. IPsecPolicyForEndpoint indicates a more specific PolicyGroup for IPsec negotiations for the endpoint.")
               (:MAPPING-STRINGS
                ("IPSP Policy Model.IETF|IPsecPolicyForSystem"))))