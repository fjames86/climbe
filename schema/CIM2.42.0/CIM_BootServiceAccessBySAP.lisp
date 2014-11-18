
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BootServiceAccessBySAP.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BOOTSERVICEACCESSBYSAP (CIM_SERVICEACCESSBYSAP)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The BootService.")
                 :KEY)
                :INITFORM "CIM_BootService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "An access point for the BootService.") :KEY)
                :INITFORM "CIM_BootSAP"))
              (:CIM-NAME "CIM_BootServiceAccessBySAP")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::Boot")
               (:DESCRIPTION
                "BootServiceAccessBySAP is the relationship between a Boot Service and its access points.")))