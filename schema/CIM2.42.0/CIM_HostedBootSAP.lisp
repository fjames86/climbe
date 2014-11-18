
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedBootSAP.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDBOOTSAP (CIM_HOSTEDACCESSPOINT)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The UnitaryComputerSystem.") :KEY)
                :INITFORM "CIM_ComputerSystem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The BootSAP hosted on the UnitaryComputer System.")
                 :WEAK :KEY)
                :INITFORM "CIM_BootSAP"))
              (:CIM-NAME "CIM_HostedBootSAP")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::System::Boot")
               (:DESCRIPTION
                "HostedBootSAP defines the hosting UnitaryComputerSystem for a BootSAP. Since this relationship is subclassed from HostedAccessPoint, it inherits the scoping/naming scheme defined for AccessPoint - where an AccessPoint is weak to its hosting System. In this case, a BootSAP must be weak to its hosting UnitaryComputerSystem.")))