
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssociatedNextHop.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSOCIATEDNEXTHOP (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The next hop for the route.") :KEY)
                :INITFORM "CIM_RemoteServiceAccessPoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The route sending traffic to the next hop.")
                 :KEY)
                :INITFORM "CIM_NextHopRoute"))
              (:CIM-NAME "CIM_AssociatedNextHop")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::Routes")
               (:DESCRIPTION
                "AssociatedNextHop depicts the relationship between a route and the specification of its next hop. The next hop is external to a System, and hence is defined as a kind of RemoteServiceAccessPoint. Note that this relationship is independent of RouteUsesEndpoint (the local Endpoint used to transmit the traffic), and both may be defined for a route.")))