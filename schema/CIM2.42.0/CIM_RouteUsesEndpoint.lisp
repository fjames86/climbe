
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RouteUsesEndpoint.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ROUTEUSESENDPOINT (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "The endpoint used to reach the route's destination.")
                 :KEY)
                :INITFORM "CIM_ProtocolEndpoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The route using the endpoint.") :KEY)
                :INITFORM "CIM_NextHopRoute"))
              (:CIM-NAME "CIM_RouteUsesEndpoint")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::Routes")
               (:DESCRIPTION
                "RouteUsesEndpoint depicts the relationship between a next hop route and the local Endpoint that is used to transmit the traffic to the 'next hop'.")))