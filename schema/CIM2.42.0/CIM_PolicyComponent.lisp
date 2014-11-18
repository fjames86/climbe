
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicyComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYCOMPONENT (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION "The parent Policy in the association.") :KEY)
                :INITFORM "CIM_Policy")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The child/part Policy in the association.")
                 :KEY)
                :INITFORM "CIM_Policy"))
              (:CIM-NAME "CIM_PolicyComponent")
              (:QUALIFIERS :ASSOCIATION :ABSTRACT (NIL "true")
               (:VERSION "2.6.0") (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "CIM_PolicyComponent is a generic association used to establish 'part of' relationships between the subclasses of CIM_Policy. For example, the PolicyConditionInPolicyRule association defines that PolicyConditions are part of a PolicyRule.")))