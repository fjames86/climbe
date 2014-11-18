
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ContainedTransform.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CONTAINEDTRANSFORM (CIM_COMPONENT)
              ((SEQUENCENUMBER UINT16 :CIM-NAME "SequenceNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "SequenceNumber indicates the order of preference for SATransforms of the same type. Lower-valued transforms are preferred over transforms of the same type with higher values. For ContainedTransforms (of the same type) that reference the same IPsecProposal, SequenceNumber values MUST be unique.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|ContainedTransform.SequenceNumber")))
                :INITFORM NIL)
               (GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION "The Proposal containing the transforms.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|ContainedTransform.GroupComponent"))
                 :KEY)
                :INITFORM "CIM_IPsecProposal")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent") (:MIN "1")
                 (:DESCRIPTION "Transforms in the proposal.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|ContainedTransform.PartComponent"))
                 :KEY)
                :INITFORM "CIM_SATransform"))
              (:CIM-NAME "CIM_ContainedTransform")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::IPsecPolicy")
               (:DESCRIPTION
                "ContainedTransform associates a proposal with a list of transforms. If multiple transforms of a given type are included in a proposal, these transforms are interpreted as alternatives -- i.e., logically ORed with each other. The order of preference is dictated by the SequenceNumber property. Sets of transforms of different types are logically ANDed. For example, a proposal based on two AH transforms and three ESP transforms means one of the AH AND one of the ESP transforms MUST be chosen. Note that at least 1 transform MUST be aggregated into the proposal.")
               (:MAPPING-STRINGS
                ("IPSP Policy Model.IETF|ContainedTransform"))))