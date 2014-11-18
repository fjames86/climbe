
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RoutingProtocolDomainInAS.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ROUTINGPROTOCOLDOMAININAS (CIM_CONTAINEDDOMAIN)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION "The autonomous system.") :KEY)
                :INITFORM "CIM_AutonomousSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The routing domain.") :KEY)
                :INITFORM "CIM_RoutingProtocolDomain"))
              (:CIM-NAME "CIM_RoutingProtocolDomainInAS")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::RoutingForwarding")
               (:DESCRIPTION
                "This assocation connects an AutonomousSystem to the routing domains that it contains.")))