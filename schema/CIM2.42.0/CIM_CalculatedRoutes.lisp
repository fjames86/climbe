
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CalculatedRoutes.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CALCULATEDROUTES (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_ConcreteDependency.Antecedent"
                   "CIM_NextHopIPRoute.RouteDerivation"))
                 (:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The route's calculation service.") :KEY)
                :INITFORM "CIM_RouteCalculationService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ConcreteDependency.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The IP route calculated by a specific service.")
                 :KEY)
                :INITFORM "CIM_IPRoute"))
              (:CIM-NAME "CIM_CalculatedRoutes")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED
                ("CIM_ConcreteDependency"
                 "CIM_NextHopIPRoute.RouteDerivation"))
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Network::Routes")
               (:DESCRIPTION
                "This assocation makes explicit the routes that are calculated by a specific RouteCalculationService. Thus, every RouteCalculationService can have its own unique set of calculated routes. The association is not necessary in the model and has been deprecated. An instance of the general ConcreteDependency association can tie a NextHopIPRoute to a RouteCalculationService. In addition, information on how the route was derived is available in NextHopIPRoute's RouteDerivation enumeration.")))