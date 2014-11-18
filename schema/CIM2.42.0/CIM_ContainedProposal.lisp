
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ContainedProposal.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CONTAINEDPROPOSAL (CIM_COMPONENT)
              ((SEQUENCENUMBER UINT16 :CIM-NAME "SequenceNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "SequenceNumber indicates the ordering to be used when chosing from among the proposals. Lower-valued proposals are preferred over proposals with higher values. For ContainedProposals that reference the same SANegotiationAction, SequenceNumber values MUST be unique.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|ContainedProposal.SequenceNumber")))
                :INITFORM NIL)
               (GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "The SANegotiationAction containing a list of SAProposals.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|ContainedProposal.GroupComponent"))
                 :KEY)
                :INITFORM "CIM_SANegotiationAction")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The SAProposal in this negotiation action.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|ContainedProposal.PartComponent"))
                 :KEY)
                :INITFORM "CIM_SAProposal"))
              (:CIM-NAME "CIM_ContainedProposal")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::IPsecPolicy")
               (:DESCRIPTION
                "ContainedProposal holds an ordered list of SAProposals that make up an SANegotiationAction. If the referenced NegotiationAction is an IKEAction, then the SAProposal objects MUST be IKEProposals. If the referenced NegotiationAction object is an IPsecTransport/TunnelAction, then the referenced SAProposal objects MUST be IPsecProposals.")
               (:MAPPING-STRINGS ("IPSP Policy Model.IETF|ContainedProposal"))))