
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_InLogicalNetwork.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_INLOGICALNETWORK (CIM_COLLECTEDMSES)
              ((COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                ((:DEPRECATED ("CIM_MemberOfCollection.Collection")) :AGGREGATE
                 (:OVERRIDE "Collection")
                 (:DESCRIPTION
                  "The LogicalNetwork that groups the ProtocolEndpoint instances.")
                 :KEY)
                :INITFORM "CIM_LogicalNetwork")
               (MEMBER NIL :CIM-NAME "Member" :QUALIFIERS
                       ((:DEPRECATED ("CIM_MemberOfCollection.Member"))
                        (:OVERRIDE "Member")
                        (:DESCRIPTION
                         "The child ProtocolEndpoints that are components of the LogicalNetwork.")
                        :KEY)
                       :INITFORM "CIM_ProtocolEndpoint"))
              (:CIM-NAME "CIM_InLogicalNetwork")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_MemberOfCollection")) (NIL "true")
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::Collections")
               (:DESCRIPTION
                "This association defines a ProtocolEndpoint as a member of a specific LogicalNetwork. 

Since the LogicalNetwork class is deprecated in lieu of ConnectivityCollection, this association is no longer necessary. It is deprecated to the MemberOfCollection association, that is inherited by ConnectivityCollection from its superclass, Collection.")))