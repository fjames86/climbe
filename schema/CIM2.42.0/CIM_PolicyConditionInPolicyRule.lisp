
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicyConditionInPolicyRule.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYCONDITIONINPOLICYRULE (CIM_POLICYCONDITIONSTRUCTURE)
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
                  "This property represents the PolicyRule that contains one or more PolicyConditions.")
                 :KEY)
                :INITFORM "CIM_PolicyRule")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "This property holds the name of a PolicyCondition contained by one or more PolicyRules.")
                 :KEY)
                :INITFORM "CIM_PolicyCondition"))
              (:CIM-NAME "CIM_PolicyConditionInPolicyRule")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "A PolicyRule aggregates zero or more instances of the PolicyCondition class, via the PolicyConditionInPolicyRule association. A Rule that aggregates zero Conditions is not valid; it may, however, be in the process of being defined. Note that a PolicyRule should have no effect until it is valid.")))