
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ModulePort.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MODULEPORT (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION "A module that has ports.") :KEY)
                :INITFORM "CIM_LogicalModule")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "A Port that is associated with a module.")
                 :KEY)
                :INITFORM "CIM_NetworkPort"))
              (:CIM-NAME "CIM_ModulePort")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Device::Ports")
               (:DESCRIPTION
                "ModulePort associates ports with their hosting modules.")))