
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicySetAppliesToElement.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYSETAPPLIESTOELEMENT NIL
              ((POLICYSET NIL :CIM-NAME "PolicySet" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The PolicyRules and/or groups of rules that are currently applied to an Element."))
                :INITFORM "CIM_PolicySet")
               (MANAGEDELEMENT NIL :CIM-NAME "ManagedElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The ManagedElement to which the PolicySet applies."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_PolicySetAppliesToElement")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "PolicySetAppliesToElement makes explicit which PolicySets (i.e., policy rules and groups of rules) ARE CURRENTLY applied to a particular Element. This association indicates that the PolicySets that are appropriate for a ManagedElement (specified using the PolicyRoleCollection aggregation) have actually been deployed in the policy management infrastructure. Note that if the named Element refers to a Collection, then the PolicySet is assumed to be applied to all the members of the Collection.")))