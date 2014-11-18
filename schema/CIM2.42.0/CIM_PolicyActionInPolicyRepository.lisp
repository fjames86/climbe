
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicyActionInPolicyRepository.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYACTIONINPOLICYREPOSITORY (CIM_POLICYINSYSTEM)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ReusablePolicy.Antecedent"))
                 (:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "This property represents a PolicyRepository hosting one or more PolicyActions. A reusable PolicyAction is always related to exactly one PolicyRepository via the PolicyActionInPolicyRepository association. The [0..1] cardinality for this property covers the two types of PolicyActions: 0 for a rule-specific PolicyAction, 1 for a reusable one.")
                 :KEY)
                :INITFORM "CIM_PolicyRepository")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ReusablePolicy.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "This property holds the name of a PolicyAction hosted in the PolicyRepository.")
                 :KEY)
                :INITFORM "CIM_PolicyAction"))
              (:CIM-NAME "CIM_PolicyActionInPolicyRepository")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_ReusablePolicy"))
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "The ReusablePolicy association is a more general relationship that incorporates both Conditions and Actions as well as any other policy subclass. 

This class represents the hosting of reusable PolicyActions by a PolicyRepository. A reusable Policy Action is always related to a single PolicyRepository, via this association. 

Note, that an instance of PolicyAction can be either reusable or rule-specific. When the Action is rule- specific, it shall not be related to any PolicyRepository via the PolicyActionInPolicyRepository association.")))