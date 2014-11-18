
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BGPRouteMapsInRoutingPolicy.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BGPROUTEMAPSINROUTINGPOLICY (CIM_COMPONENT)
              ((MAPSEQUENCE UINT16 :CIM-NAME "MapSequence" :QUALIFIERS
                ((:DESCRIPTION
                  "This defines the position of this RouteMap instance relative to all other instances of the same RouteMap."))
                :INITFORM NIL)
               (GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "The RoutingPolicy that aggregates the RouteMaps.")
                 :KEY)
                :INITFORM "CIM_RoutingPolicy")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The RouteMaps that are used by the RoutingPolicy.")
                 :KEY)
                :INITFORM "CIM_BGPRouteMap"))
              (:CIM-NAME "CIM_BGPRouteMapsInRoutingPolicy")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "This aggregation defines the BGPRouteMaps that are used by a particular RoutingPolicy object. Multiple instances of the same RouteMap may be used in the same RoutingPolicy instance. If this is desired, then the Sequence attribute of this aggregation can be used to disambiguate them.")))