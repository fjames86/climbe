
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ASBGPEndpoints.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASBGPENDPOINTS (CIM_SYSTEMCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION
                  "The AutonomousSystem that aggregates the router interfaces that are running BGP.")
                 :KEY)
                :INITFORM "CIM_AutonomousSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The router interfaces that are contained in the AS.")
                 :KEY)
                :INITFORM "CIM_BGPProtocolEndpoint"))
              (:CIM-NAME "CIM_ASBGPEndpoints")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::ProtocolEndpoints")
               (:DESCRIPTION
                "This aggregation defines the different router interfaces that are running BGP in the AutonomousSystem.")))