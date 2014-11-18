
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProtocolControllerForPort.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PROTOCOLCONTROLLERFORPORT (CIM_PROTOCOLCONTROLLERFORDEVICE)
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
                 (:DESCRIPTION
                  "The LogicalPort 'behind' the ProtocolController.")
                 :KEY)
                :INITFORM "CIM_LogicalPort"))
              (:CIM-NAME "CIM_ProtocolControllerForPort")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Device::ProtocolController")
               (:DESCRIPTION
                "This association is used to define a relationship between a ProtocolController and a LogicalPort. This subclass is provided so that an enumeration of related controllers and ports can be performed without retrieving any other controllers or connected units.")))