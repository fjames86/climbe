
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_InSegment.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_INSEGMENT (CIM_INLOGICALNETWORK)
              ((COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                ((:DEPRECATED ("CIM_MemberOfCollection.Collection")) :AGGREGATE
                 (:OVERRIDE "Collection") (:MAX "1")
                 (:DESCRIPTION
                  "The LANSegment that groups the LANEndpoint instances.")
                 :KEY)
                :INITFORM "CIM_LANSegment")
               (MEMBER NIL :CIM-NAME "Member" :QUALIFIERS
                       ((:DEPRECATED ("CIM_MemberOfCollection.Member"))
                        (:OVERRIDE "Member")
                        (:DESCRIPTION
                         "A child LANEndpoint that is a component of the LANSegment.")
                        :KEY)
                       :INITFORM "CIM_LANEndpoint"))
              (:CIM-NAME "CIM_InSegment")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_MemberOfCollection")) (NIL "true")
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::ProtocolEndpoints")
               (:DESCRIPTION
                "Defines a LANEndpoint as a member of a specific LANSegment. Note that one of this association's references (LANSegment) is deprecated, as well as its superclass (InLogicalNetwork). Following the same logic as its parent, this association is deprecated to the MemberOfCollection association.")))