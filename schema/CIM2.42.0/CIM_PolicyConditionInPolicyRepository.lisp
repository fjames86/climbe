
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicyConditionInPolicyRepository.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYCONDITIONINPOLICYREPOSITORY (CIM_POLICYINSYSTEM)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ReusablePolicy.Antecedent"))
                 (:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "This property identifies a PolicyRepository hosting one or more PolicyConditions. A reusable PolicyCondition is always related to exactly one PolicyRepository via the PolicyConditionInPolicyRepository association. The [0..1] cardinality for this property covers the two types of PolicyConditions: 0 for a rule-specific PolicyCondition, 1 for a reusable one.")
                 :KEY)
                :INITFORM "CIM_PolicyRepository")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ReusablePolicy.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "This property holds the name of a PolicyCondition hosted in the PolicyRepository.")
                 :KEY)
                :INITFORM "CIM_PolicyCondition"))
              (:CIM-NAME "CIM_PolicyConditionInPolicyRepository")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_ReusablePolicy"))
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "The ReusablePolicy association is a more general relationship that incorporates both Conditions and Actions as well as any other policy subclass. 

This class represents the hosting of reusable PolicyConditions by a PolicyRepository. A reusable Policy Condition is always related to a single PolicyRepository, via this association. 

Note, that an instance of PolicyCondition can be either reusable or rule-specific. When the Condition is rule- specific, it shall not be related to any PolicyRepository via the PolicyConditionInPolicyRepository association.")))