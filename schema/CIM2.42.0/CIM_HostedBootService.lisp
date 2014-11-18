
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedBootService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDBOOTSERVICE (CIM_HOSTEDSERVICE)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The hosting System.") :KEY)
                :INITFORM "CIM_System")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The BootService hosted on the System.") :WEAK
                 :KEY)
                :INITFORM "CIM_BootService"))
              (:CIM-NAME "CIM_HostedBootService")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::Boot")
               (:DESCRIPTION
                "HostedBootService defines the hosting System for a Boot Service. Since this relationship is subclassed from Hosted Service, it inherits the scoping/naming scheme defined for Service - where a Service is weak to its hosting System.")))