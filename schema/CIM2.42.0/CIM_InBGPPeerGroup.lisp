
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_InBGPPeerGroup.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_INBGPPEERGROUP (CIM_COLLECTEDMSES)
              ((COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Collection") (:MAX "1")
                 (:DESCRIPTION "The PeerGroup that aggregates the routers.")
                 :KEY)
                :INITFORM "CIM_BGPPeerGroup")
               (MEMBER NIL :CIM-NAME "Member" :QUALIFIERS
                       ((:OVERRIDE "Member") (:MIN "2")
                        (:DESCRIPTION
                         "The routers that comprise the PeerGroup.")
                        :KEY)
                       :INITFORM "CIM_ComputerSystem"))
              (:CIM-NAME "CIM_InBGPPeerGroup")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "This aggregation defines the specific routers (i.e., ComputerSystems) that participate in a PeerGroup.")))