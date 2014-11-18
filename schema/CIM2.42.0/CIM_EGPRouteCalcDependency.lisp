
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_EGPRouteCalcDependency.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_EGPROUTECALCDEPENDENCY (CIM_SERVICESERVICEDEPENDENCY)
              ((IGPINJECTION UINT16 :CIM-NAME "IGPInjection" :QUALIFIERS
                ((:DESCRIPTION
                  "Sometimes it is necessary to inject EGP information, such as that from BGP, into IGPs. This attribute defines whether this should be done for the two routing protocols that are defined by this association. The values below mean that no, partial, and full EGP information is injected into the IGP, respectively.")
                 (:VALUE-MAP ("1" "2" "3"))
                 (:VALUES ("None" "Partial" "Full")))
                :INITFORM NIL)
               (TYPEOFDEPENDENCY UINT16 :CIM-NAME "TypeOfDependency"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The nature of the Service-to-Service dependency. 2 - Antecedent Service shall have completed before Dependent service's functionality is available.
3 - Antecedent Service shall have started before Dependent service's functionality is available.
4 - Antecedent Service shall not be started in order for Dependent service's functionality to be available.
5 - The two Services cooperate and augment each other's function. There is no requirement implied by this value regarding the execution of the Antecedent service in order for the Dependent service to operate.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "Other" "Service Must Have Completed"
                   "Service Must Be Started" "Service Must Not Be Started"
                   "Cooperate")))
                :INITFORM NIL)
               (RESTARTSERVICE BOOLEAN :CIM-NAME "RestartService" :QUALIFIERS
                ((:DESCRIPTION
                  "This property describes that the Antecedent Service must be restarted after the Dependent operation is complete."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The independent RouteCalculationService that provides routing information from the AS, for the EGP to use.")
                 :KEY)
                :INITFORM "CIM_RouteCalculationService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The dependent RouteCalculationService (e.g., the Route CalculationService) that is functioning as an EGP.")
                 :KEY)
                :INITFORM "CIM_RouteCalculationService"))
              (:CIM-NAME "CIM_EGPRouteCalcDependency")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "This is a specialization of ServiceServiceDependency, and captures the dependency that external gateway protocols (such as BGP) have on interior gateway protocols (such as OSPF).")))