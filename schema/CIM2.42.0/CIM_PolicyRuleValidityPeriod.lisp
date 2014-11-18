
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicyRuleValidityPeriod.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYRULEVALIDITYPERIOD (CIM_POLICYCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_PolicySetValidityPeriod.GroupComponent"))
                 :AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "This property contains the name of a PolicyRule that contains one or more PolicyTimePeriodConditions.")
                 :KEY)
                :INITFORM "CIM_PolicyRule")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_PolicySetValidityPeriod.PartComponent"))
                 (:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "This property contains the name of a PolicyTimePeriodCondition defining the valid time periods for one or more PolicyRules.")
                 :KEY)
                :INITFORM "CIM_PolicyTimePeriodCondition"))
              (:CIM-NAME "CIM_PolicyRuleValidityPeriod")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_PolicySetValidityPeriod")) (NIL "true")
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "The PolicyRuleValidityPeriod aggregation represents scheduled activation and deactivation of a PolicyRule. If a PolicyRule is associated with multiple policy time periods via this association, then the Rule is active if at least one of the time periods indicates that it is active. (In other words, the PolicyTimePeriodConditions are ORed to determine whether the Rule is active.) A Time Period may be aggregated by multiple PolicyRules. A Rule that does not point to a PolicyTimePeriodCondition via this association is, from the point of view of scheduling, always active. It may, however, be inactive for other reasons. For example, the Rule's Enabled property may be set to \"disabled\" (value=2).")))