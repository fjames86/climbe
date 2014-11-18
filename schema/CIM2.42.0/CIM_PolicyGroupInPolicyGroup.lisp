
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicyGroupInPolicyGroup.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYGROUPINPOLICYGROUP (CIM_POLICYCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_PolicySetComponent.GroupComponent"))
                 :AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION "A PolicyGroup that aggregates other Groups.")
                 :KEY)
                :INITFORM "CIM_PolicyGroup")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_PolicySetComponent.PartComponent"))
                 (:OVERRIDE "PartComponent")
                 (:DESCRIPTION "A PolicyGroup aggregated by another Group.")
                 :KEY)
                :INITFORM "CIM_PolicyGroup"))
              (:CIM-NAME "CIM_PolicyGroupInPolicyGroup")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_PolicySetComponent")) (NIL "true")
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "PolicySetComponent provides a more general mechanism for aggregating both PolicyGroups and PolicyRules and doing so with the priority value applying only to the aggregated set rather than policy wide. 

A relationship that aggregates one or more lower-level PolicyGroups into a higher-level Group. A Policy Group may aggregate PolicyRules and/or other Policy Groups.")))