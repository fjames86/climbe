
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ComputerSystemDMA.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COMPUTERSYSTEMDMA (CIM_COMPUTERSYSTEMRESOURCE)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The ComputerSystem.") :KEY)
                :INITFORM "CIM_ComputerSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent") :WEAK
                 (:DESCRIPTION "A DMA channel of the ComputerSystem.") :KEY)
                :INITFORM "CIM_DMA"))
              (:CIM-NAME "CIM_ComputerSystemDMA")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::System::SystemResources")
               (:DESCRIPTION
                "An association between a ComputerSystem and the DMA channels available on it.")))