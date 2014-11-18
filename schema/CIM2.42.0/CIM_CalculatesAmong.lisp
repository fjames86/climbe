
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CalculatesAmong.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CALCULATESAMONG (CIM_SERVICESAPDEPENDENCY)
              ((ISSTATIC BOOLEAN :CIM-NAME "IsStatic" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "TRUE indicates that this ProtocolEndpoint represents a static route, and FALSE means that it represents a dynamically-learned route. This property is deprecated since a Service may use an Endpoint to output several routes, some static and others dynamic."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The required ProtocolEndpoint.") :KEY)
                :INITFORM "CIM_ProtocolEndpoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The RouteCalculationService, which is dependent on the underlying ProtocolEndpoint.")
                 :KEY)
                :INITFORM "CIM_RouteCalculationService"))
              (:CIM-NAME "CIM_CalculatesAmong")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::RoutingForwarding")
               (:DESCRIPTION
                "This is a specialization of the ServiceSAPDependency association, indicating that the referenced ProtocolEndpoint is utilized by the RouteCalculationService to provide its functionality.")))