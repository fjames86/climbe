
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ForwardedRoutes.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FORWARDEDROUTES (CIM_ROUTEFORWARDEDBYSERVICE)
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
                 (:MAX "1")
                 (:DESCRIPTION "The forwarding service for the route.") :KEY)
                :INITFORM "CIM_ForwardingService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION "The IP route being forwarded.") :KEY)
                :INITFORM "CIM_IPRoute"))
              (:CIM-NAME "CIM_ForwardedRoutes")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value"))
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Network::Routes")
               (:DESCRIPTION
                "This assocation makes explicit the IP routes that are defined in the context of a specific ForwardingService. Every ForwardingService can have its own unique set of IP routing destinations. The association is deprecated since it is incorrect to mandate the existence of a ForwardingService in order to define the existence of a route.")))