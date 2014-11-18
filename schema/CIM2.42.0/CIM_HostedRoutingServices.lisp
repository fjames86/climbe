
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedRoutingServices.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDROUTINGSERVICES (CIM_HOSTEDSERVICE)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_HostedService.Antecedent"))
                 (:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The hosting router.") :KEY)
                :INITFORM "CIM_ComputerSystem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_HostedService.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION "The Service hosted on the System.") :WEAK :KEY)
                :INITFORM "CIM_RouteCalculationService"))
              (:CIM-NAME "CIM_HostedRoutingServices")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_HostedService"))
               (:VERSION "2.7.1")
               (:UML-PACKAGE-PATH "CIM::Network::RoutingForwarding")
               (:DESCRIPTION
                "This is a specialization of CIM_HostedService, which is an association between a Service and the System on which the functionality resides. The class, HostedRoutingServices, is deprecated since it provides no additional semantics over HostedService, and unecessarily restricts the Service to a single ComputerSystem, when the Service could reside in a Network or other higher level System.")))