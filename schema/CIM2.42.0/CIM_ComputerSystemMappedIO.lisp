
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ComputerSystemMappedIO.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COMPUTERSYSTEMMAPPEDIO (CIM_COMPUTERSYSTEMRESOURCE)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The ComputerSystem.") :KEY)
                :INITFORM "CIM_ComputerSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent") :WEAK
                 (:DESCRIPTION
                  "A memory mapped I/O port of the ComputerSystem.")
                 :KEY)
                :INITFORM "CIM_MemoryMappedIO"))
              (:CIM-NAME "CIM_ComputerSystemMappedIO")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::System::SystemResources")
               (:DESCRIPTION
                "An association between a ComputerSystem and the Memory Mapped I/O ports available on it.")))