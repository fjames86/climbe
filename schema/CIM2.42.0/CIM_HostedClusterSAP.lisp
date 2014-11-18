
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedClusterSAP.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDCLUSTERSAP (CIM_HOSTEDACCESSPOINT)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The ComputerSystem.") :KEY)
                :INITFORM "CIM_ComputerSystem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The ClusteringSAP that is hosted on the ComputerSystem.")
                 :WEAK :KEY)
                :INITFORM "CIM_ClusteringSAP"))
              (:CIM-NAME "CIM_HostedClusterSAP")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::SystemElements")
               (:DESCRIPTION
                "HostedClusterSAP defines the hosting ComputerSystem for a ClusteringSAP. Since this relationship is subclassed from HostedAccessPoint, it inherits the scoping/naming scheme defined for AccessPoint - where an AccessPoint is weak to its hosting System. In this case, a ClusteringSAP must be weak to its hosting ComputerSystem.")))