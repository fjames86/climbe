
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicyContainerInPolicyContainer.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYCONTAINERINPOLICYCONTAINER (CIM_SYSTEMCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "A ReusablePolicyContainer that aggregates other ReusablePolicyContainers.")
                 :KEY)
                :INITFORM "CIM_ReusablePolicyContainer")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "A ReusablePolicyContainer aggregated by another ReusablePolicyContainer.")
                 :KEY)
                :INITFORM "CIM_ReusablePolicyContainer"))
              (:CIM-NAME "CIM_PolicyContainerInPolicyContainer")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "A relationship that aggregates one or more lower-level ReusablePolicyContainer instances into a higher-level ReusablePolicyContainer.")))