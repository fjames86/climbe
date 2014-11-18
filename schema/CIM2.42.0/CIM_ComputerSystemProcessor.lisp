
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ComputerSystemProcessor.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COMPUTERSYSTEMPROCESSOR (CIM_SYSTEMDEVICE)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_SystemDevice.GroupComponent")) :AGGREGATE
                 (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "Note: This method is deprecated. Deprecated description: The UnitaryComputerSystem.")
                 (:MIN "1") (:MAX "1") :KEY)
                :INITFORM "CIM_UnitaryComputerSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_SystemDevice.PartComponent"))
                 (:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "Note: This method is deprecated. Deprecated description: The Processor that is part of the UnitaryComputerSystem.")
                 :WEAK :KEY)
                :INITFORM "CIM_Processor"))
              (:CIM-NAME "CIM_ComputerSystemProcessor")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_SystemDevice"))
               (NIL "true") :COMPOSITION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::Processor")
               (:DESCRIPTION
                "Note: ComputerSystemProcessor is deprecated in lieu of its superclass, SystemDevice, because it adds no detail and changes none of the cardinalities in the definition of the superclass. Deprecated description: An association that indicates the processors of a UnitaryComputer System.")))