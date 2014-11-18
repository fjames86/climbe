
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicySetValidityPeriod.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYSETVALIDITYPERIOD (CIM_POLICYCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "This property contains the name of a PolicySet that contains one or more PolicyTimePeriodConditions.")
                 :KEY)
                :INITFORM "CIM_PolicySet")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "This property contains the name of a PolicyTimePeriodCondition defining the valid time periods for one or more PolicySets.")
                 :KEY)
                :INITFORM "CIM_PolicyTimePeriodCondition"))
              (:CIM-NAME "CIM_PolicySetValidityPeriod")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "The PolicySetValidityPeriod aggregation represents scheduled activation and deactivation of a PolicySet. A PolicySet is considered \"active\" if it is both \"Enabled\" and in a valid time period. 

If a PolicySet is associated with multiple policy time periods via this association, then the Set is in a valid time period if at least one of the time periods evaluates to TRUE. If a PolicySet is contained in another PolicySet via the PolicySetComponent aggregation (e.g., a PolicyRule in a PolicyGroup), then the contained PolicySet (e.g., PolicyRule) is in a valid period if at least one of the aggregate's PolicyTimePeriodCondition instances evaluates to TRUE and at least one of its own PolicyTimePeriodCondition instances also evalutes to TRUE. (In other words, the PolicyTimePeriodConditions are ORed to determine whether the PolicySet is in a valid time period and then ANDed with the ORed PolicyTimePeriodConditions of each of PolicySet instances in the PolicySetComponent hierarchy to determine if the PolicySet is in a valid time period and, if also \"Enabled\", therefore, active, i.e., the hierachy ANDs the ORed PolicyTimePeriodConditions of the elements of the hierarchy. 

A Time Period may be aggregated by multiple PolicySets. A Set that does not point to a PolicyTimePeriodCondition via this association, from the point of view of scheduling, is always in a valid time period.")))