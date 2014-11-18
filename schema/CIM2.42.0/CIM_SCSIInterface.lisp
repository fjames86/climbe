
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SCSIInterface.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SCSIINTERFACE (CIM_CONTROLLEDBY)
              ((SCSITIMEOUTS UINT32 :CIM-NAME "SCSITimeouts" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION "Note: The use of this method is deprecated. 
Deprecated description: Number of SCSI timeouts that have occurred since the last hard or soft reset that is related to the controlled Device. The time of last reset is indicated in the TimeOfDeviceReset property, inherited from the ControlledBy association.")
                 :COUNTER)
                :INITFORM NIL)
               (SCSIRETRIES UINT32 :CIM-NAME "SCSIRetries" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION "Note: The use of this method is deprecated. 
Deprecated description: Number of SCSI retries that have occurred since the last hard or soft reset that is related to the controlled Device. The time of last reset is indicated in the TimeOfDeviceReset property, inherited from the ControlledBy association.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Mass Storage Statistics|001.18")))
                :INITFORM NIL)
               (INITIATORID UINT32 :CIM-NAME "InitiatorId" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION "Note: The use of this method is deprecated. 
Deprecated description: The SCSI Initiator ID.")
                 (:MAPPING-STRINGS ("MIF.DMTF|Bus Port|004.5")))
                :INITFORM NIL)
               (TARGETID UINT32 :CIM-NAME "TargetId" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_ProtocolControllerAccessesUnit.TargetControllerNumber"))
                 (:DESCRIPTION "Note: The use of this method is deprecated. 
Deprecated description: The SCSI Target ID.")
                 (:MAPPING-STRINGS ("MIF.DMTF|Bus Port|004.5")))
                :INITFORM NIL)
               (TARGETLUN UINT64 :CIM-NAME "TargetLUN" :QUALIFIERS
                ((:DEPRECATED ("CIM_ProtocolControllerForDevice.DeviceNumber"))
                 (:DESCRIPTION "Note: The use of this method is deprecated. 
Deprecated description: The SCSI Target LUN.")
                 (:MAPPING-STRINGS ("MIF.DMTF|Storage Devices|001.4")))
                :INITFORM NIL)
               (SCSIRESERVATION UINT16 :CIM-NAME "SCSIReservation" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION "Note: The use of this method is deprecated. 
Deprecated description: SCSIReservation indicates the type of SCSI reservation that currently exists between the source and destination.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES ("Unknown" "None" "Simple" "Persistent")))
                :INITFORM NIL)
               (SCSISIGNAL UINT16 :CIM-NAME "SCSISignal" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION "Note: The use of this method is deprecated. 
Deprecated description: The SCSI signal characteristics being used for this connection. The value listed here must also be listed in the SignalCapabilities field of the SCSIController.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" "6"))
                 (:VALUES
                  ("Other" "Unknown" "Single Ended" "Differential"
                   "Low Voltage Differential" "Optical"))
                 (:MAPPING-STRINGS ("MIF.DMTF|Bus Port|004.4"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SCSIController.SignalCapabilities")))
                :INITFORM NIL)
               (MAXQUEUEDEPTH UINT32 :CIM-NAME "MaxQueueDepth" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION "Note: The use of this method is deprecated. 
Deprecated description: Maximum number of Command Descriptor Blocks (CDBs) that can be supported by the target. This data cannot be obtained under all circumstances."))
                :INITFORM NIL)
               (QUEUEDEPTHLIMIT UINT32 :CIM-NAME "QueueDepthLimit" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION "Note: The use of this method is deprecated. 
Deprecated description: The maximum number of concurrent Command Descriptor Blocks (CDBs) that the initiator will send to the target. This value should never be greater than MaxQueueDepth."))
                :INITFORM NIL)
               (ACCESSSTATE UINT16 :CIM-NAME "AccessState" :QUALIFIERS
                ((:DESCRIPTION
                  "The State property indicates whether the Controller is actively commanding or accessing the Device (value=1) or not (value=2). Also, the value, \"Unknown\" (0), can be defined. This information is necessary when a LogicalDevice can be commanded by, or accessed through, multiple Controllers.")
                 (:VALUE-MAP ("0" "1" "2"))
                 (:VALUES ("Unknown" "Active" "Inactive")))
                :INITFORM NIL)
               (TIMEOFDEVICERESET DATETIME :CIM-NAME "TimeOfDeviceReset"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The time that the downstream Device was last reset by the Controller."))
                :INITFORM NIL)
               (NUMBEROFHARDRESETS UINT32 :CIM-NAME "NumberOfHardResets"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Number of hard resets issued by the Controller. A hard reset returns the Device to its initialization or boot-up state. All internal Device state information and data are lost.")
                 :COUNTER)
                :INITFORM NIL)
               (NUMBEROFSOFTRESETS UINT32 :CIM-NAME "NumberOfSoftResets"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Number of soft resets issued by the Controller. A soft reset does not completely clear current Device state or data. Exact semantics are dependent on the Device and on the protocols and mechanisms used to communicate with the Device.")
                 :COUNTER)
                :INITFORM NIL)
               (DEVICENUMBER STRING :CIM-NAME "DeviceNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "Address of associated Device in context of the antecedent Controller."))
                :INITFORM NIL)
               (ACCESSMODE UINT16 :CIM-NAME "AccessMode" :QUALIFIERS
                ((:DESCRIPTION
                  "This property describes the accessibility of the device through the antecedent controller.")
                 (:VALUE-MAP ("2" "3" "4"))
                 (:VALUES ("ReadWrite" "ReadOnly" "NoAccess")))
                :INITFORM NIL)
               (ACCESSPRIORITY UINT16 :CIM-NAME "AccessPriority" :QUALIFIERS
                ((:DESCRIPTION
                  "The property describes the priority given to accesses of the device through this controller. The highest priority path will have the lowest value for this parameter."))
                :INITFORM NIL)
               (NEGOTIATEDSPEED UINT64 :CIM-NAME "NegotiatedSpeed" :QUALIFIERS
                ((:DESCRIPTION
                  "When several bus and connection speeds are possible, the NegotiatedSpeed property defines the one that is in use between the Devices. Speed is specified in bits per second. If connection or bus speeds are not negotiated, or if this information is not available or not important to Device management, the property should be set to 0.")
                 (NIL "Bits per Second")
                 (:MAPPING-STRINGS ("MIF.DMTF|Bus Port Association|001.2"))
                 (:P-UNIT "bit / second"))
                :INITFORM NIL)
               (NEGOTIATEDDATAWIDTH UINT32 :CIM-NAME "NegotiatedDataWidth"
                :QUALIFIERS
                ((:DESCRIPTION
                  "When several bus and connection data widths are possible, the NegotiatedDataWidth property defines the one that is in use between the Devices. Data width is specified in bits. If data width is not negotiated, or if this information is not available or not important to Device management, the property should be set to 0.")
                 (NIL "Bits")
                 (:MAPPING-STRINGS ("MIF.DMTF|Bus Port Association|001.3"))
                 (:P-UNIT "bit"))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Antecedent")
                 (:DESCRIPTION "Note: The use of this method is deprecated. 
Deprecated description: The SCSIController.")
                 :KEY)
                :INITFORM "CIM_SCSIController")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The controlled Device.") :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_SCSIInterface")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ProtocolControllerAccessesUnit"))
               (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::Controller")
               (:DESCRIPTION
                "Note: The use of this class is deprecated in lieu of ProtocolControllerForUnit, because the SCSIController class involved in this association is itself deprecated. The protocol-related aspects of SCSI are better reflected in the new classes and associations. 
Deprecated description: SCSIInterface is a ControlledBy relationship that indicates which Devices are accessed through a SCSIController and describes the characteristics of this access.")))