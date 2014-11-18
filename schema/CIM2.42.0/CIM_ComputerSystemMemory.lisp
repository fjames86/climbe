
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ComputerSystemMemory.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COMPUTERSYSTEMMEMORY (CIM_SYSTEMDEVICE)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_SystemDevice.GroupComponent")) :AGGREGATE
                 (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The UnitaryComputerSystem.") :KEY)
                :INITFORM "CIM_UnitaryComputerSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_SystemDevice.PartComponent"))
                 (:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The Memory StorageExtent which is part of the UnitaryComputerSystem.")
                 :WEAK :KEY)
                :INITFORM "CIM_Memory"))
              (:CIM-NAME "CIM_ComputerSystemMemory")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_SystemDevice"))
               (NIL "true") :COMPOSITION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Device::Memory")
               (:DESCRIPTION
                "The use of this association has be deprecated in lieu of SystemDevice. Association indicating that memory is installed and required for the UnitaryComputerSystem to operate. Note that this relationship inherits from the SystemDevice association, and therefore, the Memory StorageExtent is weak to the aggregating UnitaryComputerSystem.")))