
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedClusterService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDCLUSTERSERVICE (CIM_HOSTEDSERVICE)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The Cluster.") :KEY)
                :INITFORM "CIM_ComputerSystem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The ClusteringService that is hosted on the Cluster.")
                 :WEAK :KEY)
                :INITFORM "CIM_ClusteringService"))
              (:CIM-NAME "CIM_HostedClusterService")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::System::SystemElements")
               (:DESCRIPTION
                "HostedClusterService defines the hosting Cluster for a ClusteringService. Since this relationship is subclassed from HostedService, it inherits the scoping/naming scheme defined for Service - where a Service is weak to its hosting System. In this case, a ClusteringService must be weak to its hosting Cluster System.")))