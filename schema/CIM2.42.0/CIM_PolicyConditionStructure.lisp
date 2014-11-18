
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicyConditionStructure.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYCONDITIONSTRUCTURE (CIM_POLICYCOMPONENT)
              ((GROUPNUMBER UINT16 :CIM-NAME "GroupNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "Unsigned integer indicating the group to which the contained PolicyCondition belongs. This integer segments the Conditions into the ANDed sets (when the ConditionListType is \"DNF\") or, similarly, into the ORed sets (when the ConditionListType is \"CNF\")."))
                :INITFORM NIL)
               (CONDITIONNEGATED BOOLEAN :CIM-NAME "ConditionNegated"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Indication of whether the contained PolicyCondition is negated. TRUE indicates that the PolicyCondition IS negated, FALSE indicates that it IS NOT negated."))
                :INITFORM NIL)
               (GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "This property represents the Policy that contains one or more PolicyConditions.")
                 :KEY)
                :INITFORM "CIM_Policy")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "This property holds the name of a PolicyCondition contained by one or more PolicyRule or CompoundPolicyCondition instances.")
                 :KEY)
                :INITFORM "CIM_PolicyCondition"))
              (:CIM-NAME "CIM_PolicyConditionStructure")
              (:QUALIFIERS :ASSOCIATION :ABSTRACT (NIL "true")
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "PolicyConditions may be aggregated into rules and into compound conditions. PolicyConditionStructure is the abstract aggregation class for the structuring of policy conditions. 

The Conditions aggregated by a PolicyRule or CompoundPolicyCondition are grouped into two levels of lists: either an ORed set of ANDed sets of conditions (DNF, the default) or an ANDed set of ORed sets of conditions (CNF). Individual PolicyConditions in these lists may be negated. The property ConditionListType specifies which of these two grouping schemes applies to a particular PolicyRule or CompoundPolicyCondition instance. 

One or more PolicyTimePeriodConditions may be among the conditions associated with a PolicyRule or CompoundPolicyCondition via the PolicyConditionStructure subclass association. In this case, the time periods are simply additional Conditions to be evaluated along with any others that are specified.")))