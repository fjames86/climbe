
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_LogicalNetworkService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LOGICALNETWORKSERVICE NIL
              ((CONTAINMENTTYPE UINT16 :CIM-NAME "ContainmentType" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "An enumeration that explicitly defines this network service as originating, terminating, or residing in this LogicalNetwork.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES
                  ("Unknown" "Originates In" "Terminates In" "Resides In")))
                :INITFORM NIL)
               (NETWORK NIL :CIM-NAME "Network" :QUALIFIERS
                ((:DEPRECATED ("No value")) :KEY
                 (:DESCRIPTION
                  "The LogicalNetwork that contains the network service."))
                :INITFORM "CIM_LogicalNetwork")
               (NETWORKSERVICE NIL :CIM-NAME "NetworkService" :QUALIFIERS
                ((:DEPRECATED ("No value")) :KEY
                 (:DESCRIPTION
                  "The NetworkService that is running in the LogicalNetwork."))
                :INITFORM "CIM_NetworkService"))
              (:CIM-NAME "CIM_LogicalNetworkService")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value"))
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::RoutingForwarding")
               (:DESCRIPTION
                "A LogicalNetworkService represents network services that either originate and/or terminate in a LogicalNetwork. This association is deprecated since LogicalNetworks aggregate ProtocolEndpoints, not their backing Services.")))