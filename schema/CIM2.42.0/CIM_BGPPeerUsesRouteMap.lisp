
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BGPPeerUsesRouteMap.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BGPPEERUSESROUTEMAP (CIM_COLLECTEDMSES)
              ((MAPSEQUENCE UINT16 :CIM-NAME "MapSequence" :QUALIFIERS
                ((:DESCRIPTION
                  "This defines the position of this RouteMap instance relative to all other instances of the same RouteMap."))
                :INITFORM NIL)
               (COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Collection")
                 (:DESCRIPTION
                  "The BGPPeerGroup that aggregates the RouteMaps.")
                 :KEY)
                :INITFORM "CIM_BGPPeerGroup")
               (MEMBER NIL :CIM-NAME "Member" :QUALIFIERS
                       ((:OVERRIDE "Member")
                        (:DESCRIPTION
                         "The RouteMaps that are used by the BGPPeerGroup.")
                        :KEY)
                       :INITFORM "CIM_BGPRouteMap"))
              (:CIM-NAME "CIM_BGPPeerUsesRouteMap")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "This association defines the RouteMaps that are aggregated and used by a particular BGPPeerGroup object. Multiple instances of the same RouteMap may be aggregated into the same BGPPeerGroup. If this is desired, then the MapSequence attribute of the association can be used to disambiguate them.")))