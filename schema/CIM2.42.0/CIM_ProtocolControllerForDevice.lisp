
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProtocolControllerForDevice.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PROTOCOLCONTROLLERFORDEVICE (CIM_DEPENDENCY)
              ((DEVICENUMBER STRING :CIM-NAME "DeviceNumber" :QUALIFIERS
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
                 (:DESCRIPTION "The controlled Device.") :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_ProtocolControllerForDevice")
              (:QUALIFIERS :ASSOCIATION :ABSTRACT (:VERSION "2.8.1000")
               (:UML-PACKAGE-PATH "CIM::Device::ProtocolController")
               (:DESCRIPTION
                "This association indicates a subclass of LogicalDevice (for example a Storage Volume) is connected through a specific ProtocolController. In many situations (for example storage LUN masking), there may be many of these associations used to relate to different objects. Therefore subclasses have been defined to optimize enumeration of the associations.")))