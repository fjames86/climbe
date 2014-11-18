
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_VirtualSystemSettingDataComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_VIRTUALSYSTEMSETTINGDATACOMPONENT (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "Reference to an instance of the CIM_VirtualSystemSettingData class that is the top-level object of a virtual system configuration.")
                 :KEY)
                :INITFORM "CIM_VirtualSystemSettingData")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "Reference to an instance of the CIM_ResourceAllocationSettingData class representing a part of a virtual system configuration applicable to one particular virtual resource.")
                 :KEY)
                :INITFORM "CIM_ResourceAllocationSettingData"))
              (:CIM-NAME "CIM_VirtualSystemSettingDataComponent")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::System::SystemElements")
               (:DESCRIPTION
                "The CIM_VirtualSystemSettingDataComponent association establishes a 'part of' relationship between an instance of the CIM_VirtualSystemSettingData class and a set of instances of the CIM_ResourceAllocationSettingData class.")))