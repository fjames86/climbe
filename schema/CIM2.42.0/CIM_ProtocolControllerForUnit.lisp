
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProtocolControllerForUnit.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PROTOCOLCONTROLLERFORUNIT (CIM_PROTOCOLCONTROLLERFORDEVICE)
              ((DEVICEACCESS UINT16 :CIM-NAME "DeviceAccess" :QUALIFIERS
                ((:DESCRIPTION
                  "The access rights granted to the referenced logical unit as exposed through referenced ProtocolController. The 'No Access' value is used in implementations where the DeviceNumber is reserved, but no access is granted. 
If the instrumentation exposes PrivilegeManagementService, this property MUST be synchronized with the Activities property of any Privilege instances associated with StorageHardwareIDs associated to the referenced ProtocolController and the referenced LogicalDevice. In particular, when this property is 'Read Write', Privilege.Activities MUST include entries for 'Read' and 'Write'. When this property is 'Read-Only', Privilege.Activities MUST include an entry for 'Read'. The corresponding entries for Privilege.ActivityQualifiers MUST be 'CDB=*' and the corresponding entries for Privilege.QualifierFormat MUST be 'SCSI Command'.")
                 (:VALUE-MAP ("0" "2" "3" "4" "5..15999" "16000.."))
                 (:VALUES
                  ("Unknown" "Read Write" "Read-Only" "No Access"
                   "DMTF Reserved" "Vendor Reserved")))
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
                 (:DESCRIPTION "The ProtocolController.") :KEY)
                :INITFORM "CIM_ProtocolController")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The logical unit (eg StorageVolume) 'behind' the ProtocolController.")
                 :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_ProtocolControllerForUnit")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Device::ProtocolController")
               (:DESCRIPTION
                "This association is used to define a relationship between a ProtocolController and an exposed Logical Unit (for example a Storage Volume or a MediaAccessDevice such as a tape drive). An example of the use of this association is SCSI, where it link the target controller and Logical Units. This subclass is provided so that an enumeration of related controllers and units can be performed without retrieving any connected ports or other controllers.")))