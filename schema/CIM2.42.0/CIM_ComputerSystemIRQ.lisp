
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ComputerSystemIRQ.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COMPUTERSYSTEMIRQ (CIM_COMPUTERSYSTEMRESOURCE)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The ComputerSystem.") :KEY)
                :INITFORM "CIM_ComputerSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent") :WEAK
                 (:DESCRIPTION "An IRQ of the ComputerSystem.") :KEY)
                :INITFORM "CIM_IRQ"))
              (:CIM-NAME "CIM_ComputerSystemIRQ")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::System::SystemResources")
               (:DESCRIPTION
                "An association between a ComputerSystem and the IRQs available on it.")))