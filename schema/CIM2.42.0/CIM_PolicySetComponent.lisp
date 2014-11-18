
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicySetComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYSETCOMPONENT (CIM_POLICYCOMPONENT)
              ((PRIORITY UINT16 :CIM-NAME "Priority" :QUALIFIERS
                ((:DESCRIPTION
                  "A non-negative integer for prioritizing this PolicySet component relative to other elements of the same PolicySet. A larger value indicates a higher priority. The Priority property MUST have a unique value when compared with others defined for the same aggregating PolicySet."))
                :INITFORM NIL)
               (GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "A PolicySet that aggregates other PolicySet instances.")
                 :KEY)
                :INITFORM "CIM_PolicySet")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "A PolicySet aggregated into a PolicySet.")
                 :KEY)
                :INITFORM "CIM_PolicySet"))
              (:CIM-NAME "CIM_PolicySetComponent")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "PolicySetComponent is a concrete aggregation that collects instances of the subclasses of PolicySet (i.e., PolicyGroups and PolicyRules). Instances are collected in sets that use the same decision strategy. They are prioritized relative to each other, within the set, using the Priority property of this aggregation. 

Together, the PolicySet.PolicyDecisionStrategy and PolicySet Component.Priority properties determine the processing for the groups and rules contained in a PolicySet. A larger priority value represents a higher priority. Note that the Priority property MUST have a unique value when compared with others defined for the same aggregating PolicySet. Thus, the evaluation of rules within a set is deterministically specified.")))