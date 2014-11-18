
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SystemBIOS.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SYSTEMBIOS (CIM_SYSTEMCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION "The ComputerSystem that boots from the BIOS.")
                 :KEY)
                :INITFORM "CIM_ComputerSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The System's BIOS.") :KEY)
                :INITFORM "CIM_BIOSElement"))
              (:CIM-NAME "CIM_SystemBIOS")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Application::BIOS")
               (:DESCRIPTION
                "SystemBIOS associates a UnitaryComputerSystem's BIOS with the System itself.")))