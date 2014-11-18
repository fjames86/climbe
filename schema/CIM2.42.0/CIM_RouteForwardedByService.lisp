
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RouteForwardedByService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ROUTEFORWARDEDBYSERVICE (CIM_DEPENDENCY)
              ((ADMINDISTANCE UINT16 :CIM-NAME "AdminDistance" :QUALIFIERS
                ((:DEPRECATED ("CIM_NextHopRoute.AdminDistance"))
                 (:DESCRIPTION
                  "This property contains the current administrative distance of this route, for the ForwardingService. Note that this property indicates current, specific values - whereas an instance of the CIM_AdministrativeDistance class defines default distances."))
                :INITFORM NIL)
               (PATHMETRIC UINT16 :CIM-NAME "PathMetric" :QUALIFIERS
                ((:DEPRECATED ("CIM_NextHopRoute.RouteMetric"))
                 (:DESCRIPTION
                  "PathMetric provides a numeric indication as to the preference of this route compared to other routes that reach the same destination."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The forwarding service for the route.") :KEY)
                :INITFORM "CIM_ForwardingService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Dependent")
                 (:DESCRIPTION "The route being forwarded.") :KEY)
                :INITFORM "CIM_NextHopRouting"))
              (:CIM-NAME "CIM_RouteForwardedByService")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value"))
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Network::Routes")
               (:DESCRIPTION
                "This assocation makes explicit the next hops that are forwarded by a specific ForwardingService, to reach the destination. Every ForwardingService can have its own unique set of routing destinations and next hops. The association is deprecated since it is incorrect to mandate the existence of a ForwardingService in order to define the existence of a route.")))