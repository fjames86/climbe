
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProtocolControllerAccessesUnit.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PROTOCOLCONTROLLERACCESSESUNIT
              (CIM_PROTOCOLCONTROLLERFORDEVICE)
              ((TARGETCONTROLLERNUMBER STRING :CIM-NAME
                "TargetControllerNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of the dependent's target protocol controller. As an example, in SCSI this is the Target ID."))
                :INITFORM NIL)
               (DEVICENUMBER STRING :CIM-NAME "DeviceNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "Address of the associated Device in the context of the Antecedent Controller."))
                :INITFORM NIL)
               (ACCESSPRIORITY UINT16 :CIM-NAME "AccessPriority" :QUALIFIERS
                ((:DESCRIPTION
                  "This property describes the priority given to accesses of the device through this Controller. The highest priority path will have the lowest value for this parameter."))
                :INITFORM NIL)
               (ACCESSSTATE UINT16 :CIM-NAME "AccessState" :QUALIFIERS
                ((:DESCRIPTION
                  "The AccessState property describes the accessibility of the LogicalDevice through the ProtocolController. 
Unknown (0) indicates the instrumentation does not know whether access is or is not functioning. 
Active (2) indicates normal access. 
Inactive (3) indicates the instrumentation knows this path is not active, and one of the other values (below) does not apply. 
Replication in Progress (4) indicates that the path is temporarily inactive due to a replication activity. 
Mapping Inconsistency (5) indicates the instrumentation has detected that this path is inactive due to an inconsistency in the DeviceNumber/DeviceAccess configuration.")
                 (:VALUE-MAP ("0" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "Active" "Inactive" "Replication In Progress"
                   "Mapping Inconsistency")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The protocol controller.") :KEY)
                :INITFORM "CIM_ProtocolController")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The logical unit (eg StorageVolume).") :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_ProtocolControllerAccessesUnit")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Device::ProtocolController")
               (:DESCRIPTION
                "This association is used to define a relationship between a protocol controllers and a Logical Unit (for example a Storage Volume or Media Access Device) controlled by the controller. This association is used instead of ProtocolControllerForUnit to indicate a 'controlled through' relationship rather than a 'controlled by' one. An example is SCSI where this association is used to indicate a target/initiator relationship.")))