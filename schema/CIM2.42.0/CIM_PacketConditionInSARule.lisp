
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PacketConditionInSARule.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PACKETCONDITIONINSARULE (CIM_POLICYCONDITIONINPOLICYRULE)
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
                 (:DESCRIPTION "An SARule subclass of PolicyRule.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|SAConditionInRule.GroupComponent"))
                 :KEY)
                :INITFORM "CIM_SARule")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent") (:MIN "1")
                 (:DESCRIPTION
                  "An SACondition that is required for the SARule.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|SAConditionInRule.PartComponent"))
                 :KEY)
                :INITFORM "CIM_PacketFilterCondition"))
              (:CIM-NAME "CIM_PacketConditionInSARule")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::IPsecPolicy")
               (:DESCRIPTION
                "PacketConditionInSARule aggregates an SARule with at least one instance of PacketFilterCondition. This is a specialization of the PolicyConditionInPolicyRule association.")
               (:MAPPING-STRINGS ("IPSP Policy Model.IETF|SAConditionInRule"))))