
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_VirtualComputerSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_VIRTUALCOMPUTERSYSTEM (CIM_COMPUTERSYSTEM)
              ((VIRTUALSYSTEM STRING :CIM-NAME "VirtualSystem" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the type of System or hardware platform that is virtualized. OperatingSystem information is obtained via the RunningOS inherited from ComputerSystem."))
                :INITFORM NIL)
               (NAMEFORMAT STRING :CIM-NAME "NameFormat" :QUALIFIERS
                ((:OVERRIDE "NameFormat")
                 (:DESCRIPTION
                  "The ComputerSystem object and its derivatives are Top Level Objects of CIM. They provide the scope for numerous components. Having unique System keys is required. The NameFormat property identifies how the ComputerSystem Name is generated. The NameFormat ValueMap qualifier defines the various mechanisms for assigning the name. Note that another name can be assigned and used for the ComputerSystem that better suit a business, using the inherited ElementName property.
If the NameFormat is set to \"UUID\", then the Name property shall be a UUID in its canonical form consisting of 32 hexadecimal digits in 5 groups separated by hyphens, in the form 8-4-4-4-12 for a total of 36 characters (32 digits and 4 hyphens). For the first three fields, the most significant digit is on the left. The last two fields are treated as eight separate bytes, each having their most significant digit on the left, and they follow each other from left to right.")
                 (:VALUE-MAP
                  ("Other" "IP" "Dial" "HID" "NWA" "HWA" "X25" "ISDN" "IPX"
                   "DCC" "ICD" "E.164" "SNA" "OID/OSI" "WWN" "NAA" "UUID"))
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (RESETCAPABILITY UINT16 :CIM-NAME "ResetCapability" :QUALIFIERS
                ((:DESCRIPTION
                  "If enabled (value = 4), the ComputerSystem can be reset via hardware (e.g. the power and reset buttons). If disabled (value = 3), hardware reset is not allowed. In addition to Enabled and Disabled, other Values for the property are also defined - \"Not Implemented\" (5), \"Other\" (1) and \"Unknown\" (2).")
                 (:VALUE-MAP ("1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Other" "Unknown" "Disabled" "Enabled" "Not Implemented"))
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|System Hardware Security|001.4")))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:KEY (:OVERRIDE "Name")
                 (:DESCRIPTION
                  "The inherited Name serves as the key of a System instance in an enterprise environment.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (PRIMARYOWNERNAME STRING :CIM-NAME "PrimaryOwnerName"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The name of the primary system owner. The system owner is the primary user of the system.")
                 (:MAX-LEN "64")
                 (:MAPPING-STRINGS ("MIF.DMTF|General Information|001.3")))
                :INITFORM NIL)
               (PRIMARYOWNERCONTACT STRING :CIM-NAME "PrimaryOwnerContact"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "A string that provides information on how the primary system owner can be reached (for example, phone number, e-mail address, and so on).")
                 (:MAX-LEN "256")
                 (:MAPPING-STRINGS ("MIF.DMTF|General Information|001.4")))
                :INITFORM NIL)
               (ENABLEDSTATE UINT16 :CIM-NAME "EnabledState" :QUALIFIERS
                ((:DESCRIPTION
                  "EnabledState is an integer enumeration that indicates the enabled and disabled states of an element. It can also indicate the transitions between these requested states. For example, shutting down (value=4) and starting (value=10) are transient states between enabled and disabled. The following text briefly summarizes the various enabled and disabled states: 
Enabled (2) indicates that the element is or could be executing commands, will process any queued commands, and queues new requests. 
Disabled (3) indicates that the element will not execute commands and will drop any new requests. 
Shutting Down (4) indicates that the element is in the process of going to a Disabled state. 
Not Applicable (5) indicates the element does not support being enabled or disabled. 
Enabled but Offline (6) indicates that the element might be completing commands, and will drop any new requests. 
Test (7) indicates that the element is in a test state. 
Deferred (8) indicates that the element might be completing commands, but will queue any new requests. 
Quiesce (9) indicates that the element is enabled but in a restricted mode.
Starting (10) indicates that the element is in the process of going to an Enabled state. New requests are queued.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11..32767"
                   "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "Enabled" "Disabled" "Shutting Down"
                   "Not Applicable" "Enabled but Offline" "In Test" "Deferred"
                   "Quiesce" "Starting" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.OtherEnabledState")))
                :INITFORM "5")
               (OTHERENABLEDSTATE STRING :CIM-NAME "OtherEnabledState"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string that describes the enabled or disabled state of the element when the EnabledState property is set to 1 (\"Other\"). This property must be set to null when EnabledState is any value other than 1.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM NIL)
               (REQUESTEDSTATE UINT16 :CIM-NAME "RequestedState" :QUALIFIERS
                ((:DESCRIPTION
                  "RequestedState is an integer enumeration that indicates the last requested or desired state for the element, irrespective of the mechanism through which it was requested. The actual state of the element is represented by EnabledState. This property is provided to compare the last requested and current enabled or disabled states. Note that when EnabledState is set to 5 (\"Not Applicable\"), then this property has no meaning. Refer to the EnabledState property description for explanations of the values in the RequestedState enumeration. 
\"Unknown\" (0) indicates the last requested state for the element is unknown.
Note that the value \"No Change\" (5) has been deprecated in lieu of indicating the last requested state is \"Unknown\" (0). If the last requested or desired state is unknown, RequestedState should have the value \"Unknown\" (0), but may have the value \"No Change\" (5).Offline (6) indicates that the element has been requested to transition to the Enabled but Offline EnabledState. 
It should be noted that there are two new values in RequestedState that build on the statuses of EnabledState. These are \"Reboot\" (10) and \"Reset\" (11). Reboot refers to doing a \"Shut Down\" and then moving to an \"Enabled\" state. Reset indicates that the element is first \"Disabled\" and then \"Enabled\". The distinction between requesting \"Shut Down\" and \"Disabled\" should also be noted. Shut Down requests an orderly transition to the Disabled state, and might involve removing power, to completely erase any existing state. The Disabled state requests an immediate disabling of the element, such that it will not execute or accept any commands or processing requests. 

This property is set as the result of a method invocation (such as Start or StopService on CIM_Service), or can be overridden and defined as WRITEable in a subclass. The method approach is considered superior to a WRITEable property, because it allows an explicit invocation of the operation and the return of a result code. 

If knowledge of the last RequestedState is not supported for the EnabledLogicalElement, the property shall be NULL or have the value 12 \"Not Applicable\".")
                 (:VALUE-MAP
                  ("0" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" ".."
                   "32768..65535"))
                 (:VALUES
                  ("Unknown" "Enabled" "Disabled" "Shut Down" "No Change"
                   "Offline" "Test" "Deferred" "Quiesce" "Reboot" "Reset"
                   "Not Applicable" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM "12")
               (ENABLEDDEFAULT UINT16 :CIM-NAME "EnabledDefault" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "An enumerated value indicating an administrator's default or startup configuration for the Enabled State of an element. By default, the element is \"Enabled\" (value=2).")
                 (:VALUE-MAP ("2" "3" "5" "6" "7" "9" ".." "32768..65535"))
                 (:VALUES
                  ("Enabled" "Disabled" "Not Applicable" "Enabled but Offline"
                   "No Default" "Quiesce" "DMTF Reserved" "Vendor Reserved")))
                :INITFORM "2")
               (TIMEOFLASTSTATECHANGE DATETIME :CIM-NAME
                "TimeOfLastStateChange" :QUALIFIERS
                ((:DESCRIPTION
                  "The date or time when the EnabledState of the element last changed. If the state of the element has not changed and this property is populated, then it must be set to a 0 interval value. If a state change was requested, but rejected or not yet processed, the property must not be updated."))
                :INITFORM NIL)
               (TRANSITIONINGTOSTATE UINT16 :CIM-NAME "TransitioningToState"
                :QUALIFIERS
                ((:DESCRIPTION
                  "TransitioningToState indicates the target state to which the instance is transitioning. 
A value of 5 \"No Change\" shall indicate that no transition is in progress.A value of 12 \"Not Applicable\" shall indicate the implementation does not support representing ongoing transitions. 
A value other than 5 or 12 shall identify the state to which the element is in the process of transitioning.")
                 (:VALUE-MAP
                  ("0" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" ".."))
                 (:VALUES
                  ("Unknown" "Enabled" "Disabled" "Shut Down" "No Change"
                   "Offline" "Test" "Defer" "Quiesce" "Reboot" "Reset"
                   "Not Applicable" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.RequestStateChange"
                   "CIM_EnabledLogicalElement.RequestedState"
                   "CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM "12")
               (INSTALLDATE DATETIME :CIM-NAME "InstallDate" :QUALIFIERS
                ((:DESCRIPTION
                  "A datetime value that indicates when the object was installed. Lack of a value does not indicate that the object is not installed.")
                 (:MAPPING-STRINGS ("MIF.DMTF|ComponentID|001.5")))
                :INITFORM NIL)
               (STATUS STRING :CIM-NAME "Status" :QUALIFIERS
                ((:DEPRECATED ("CIM_ManagedSystemElement.OperationalStatus"))
                 (:DESCRIPTION
                  "A string indicating the current status of the object. Various operational and non-operational statuses are defined. This property is deprecated in lieu of OperationalStatus, which includes the same semantics in its enumeration. This change is made for 3 reasons: 
1) Status is more correctly defined as an array. This definition overcomes the limitation of describing status using a single value, when it is really a multi-valued property (for example, an element might be OK AND Stopped. 
2) A MaxLen of 10 is too restrictive and leads to unclear enumerated values. 
3) The change to a uint16 data type was discussed when CIM V2.0 was defined. However, existing V1.0 implementations used the string property and did not want to modify their code. Therefore, Status was grandfathered into the Schema. Use of the deprecated qualifier allows the maintenance of the existing property, but also permits an improved definition using OperationalStatus.")
                 (:VALUE-MAP
                  ("OK" "Error" "Degraded" "Unknown" "Pred Fail" "Starting"
                   "Stopping" "Service" "Stressed" "NonRecover" "No Contact"
                   "Lost Comm" "Stopped"))
                 (:MAX-LEN "10"))
                :INITFORM NIL)
               (HEALTHSTATE UINT16 :CIM-NAME "HealthState" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the current health of the element. This attribute expresses the health of this element but not necessarily that of its subcomponents. The possible values are 0 to 30, where 5 means the element is entirely healthy and 30 means the element is completely non-functional. The following continuum is defined: 
\"Non-recoverable Error\" (30) - The element has completely failed, and recovery is not possible. All functionality provided by this element has been lost. 
\"Critical Failure\" (25) - The element is non-functional and recovery might not be possible. 
\"Major Failure\" (20) - The element is failing. It is possible that some or all of the functionality of this component is degraded or not working. 
\"Minor Failure\" (15) - All functionality is available but some might be degraded. 
\"Degraded/Warning\" (10) - The element is in working order and all functionality is provided. However, the element is not working to the best of its abilities. For example, the element might not be operating at optimal performance or it might be reporting recoverable errors. 
\"OK\" (5) - The element is fully functional and is operating within normal operational parameters and without error. 
\"Unknown\" (0) - The implementation cannot report on HealthState at this time. 
DMTF has reserved the unused portion of the continuum for additional HealthStates in the future.")
                 (:VALUE-MAP
                  ("0" "5" "10" "15" "20" "25" "30" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "OK" "Degraded/Warning" "Minor failure"
                   "Major failure" "Critical failure" "Non-recoverable error"
                   "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (COMMUNICATIONSTATUS UINT16 :CIM-NAME "CommunicationStatus"
                :QUALIFIERS
                ((:DESCRIPTION
                  "CommunicationStatus indicates the ability of the instrumentation to communicate with the underlying ManagedElement. CommunicationStatus consists of one of the following values: Unknown, None, Communication OK, Lost Communication, or No Contact. 
A Null return indicates the implementation (provider) does not implement this property. 
\"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"Not Available\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"Communication OK \" indicates communication is established with the element, but does not convey any quality of service. 
\"No Contact\" indicates that the monitoring system has knowledge of this element, but has never been able to establish communications with it. 
\"Lost Communication\" indicates that the Managed Element is known to exist and has been contacted successfully in the past, but is currently unreachable.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Not Available" "Communication OK"
                   "Lost Communication" "No Contact" "DMTF Reserved"
                   "Vendor Reserved")))
                :INITFORM NIL)
               (DETAILEDSTATUS UINT16 :CIM-NAME "DetailedStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "DetailedStatus compliments PrimaryStatus with additional status detail. It consists of one of the following values: Not Available, No Additional Information, Stressed, Predictive Failure, Error, Non-Recoverable Error, SupportingEntityInError. Detailed status is used to expand upon the PrimaryStatus of the element. 
A Null return indicates the implementation (provider) does not implement this property. 
\"Not Available\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"No Additional Information\" indicates that the element is functioning normally as indicated by PrimaryStatus = \"OK\". 
\"Stressed\" indicates that the element is functioning, but needs attention. Examples of \"Stressed\" states are overload, overheated, and so on. 
\"Predictive Failure\" indicates that an element is functioning normally but a failure is predicted in the near future. 
\"Non-Recoverable Error \" indicates that this element is in an error condition that requires human intervention. 
\"Supporting Entity in Error\" indicates that this element might be \"OK\" but that another element, on which it is dependent, is in error. An example is a network service or endpoint that cannot function due to lower-layer networking problems.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" ".." "0x8000.."))
                 (:VALUES
                  ("Not Available" "No Additional Information" "Stressed"
                   "Predictive Failure" "Non-Recoverable Error"
                   "Supporting Entity in Error" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.PrimaryStatus"
                   "CIM_ManagedSystemElement.HealthState")))
                :INITFORM NIL)
               (OPERATINGSTATUS UINT16 :CIM-NAME "OperatingStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "OperatingStatus provides a current status value for the operational condition of the element and can be used for providing more detail with respect to the value of EnabledState. It can also provide the transitional states when an element is transitioning from one state to another, such as when an element is transitioning between EnabledState and RequestedState, as well as other transitional conditions.
OperatingStatus consists of one of the following values: Unknown, Not Available, In Service, Starting, Stopping, Stopped, Aborted, Dormant, Completed, Migrating, Emmigrating, Immigrating, Snapshotting. Shutting Down, In Test 
A Null return indicates the implementation (provider) does not implement this property. 
\"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"None\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"Servicing\" describes an element being configured, maintained, cleaned, or otherwise administered. 
\"Starting\" describes an element being initialized. 
\"Stopping\" describes an element being brought to an orderly stop. 
\"Stopped\" and \"Aborted\" are similar, although the former implies a clean and orderly stop, while the latter implies an abrupt stop where the state and configuration of the element might need to be updated. 
\"Dormant\" indicates that the element is inactive or quiesced. 
\"Completed\" indicates that the element has completed its operation. This value should be combined with either OK, Error, or Degraded in the PrimaryStatus so that a client can tell if the complete operation Completed with OK (passed), Completed with Error (failed), or Completed with Degraded (the operation finished, but it did not complete OK or did not report an error). 
\"Migrating\" element is being moved between host elements. 
\"Immigrating\" element is being moved to new host element. 
\"Emigrating\" element is being moved away from host element. 
\"Shutting Down\" describes an element being brought to an abrupt stop. 
\"In Test\" element is performing test functions. 
\"Transitioning\" describes an element that is between states, that is, it is not fully available in either its previous state or its next state. This value should be used if other values indicating a transition to a specific state are not applicable.
\"In Service\" describes an element that is in service and operational.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Not Available" "Servicing" "Starting" "Stopping"
                   "Stopped" "Aborted" "Dormant" "Completed" "Migrating"
                   "Emigrating" "Immigrating" "Snapshotting" "Shutting Down"
                   "In Test" "Transitioning" "In Service" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM NIL)
               (PRIMARYSTATUS UINT16 :CIM-NAME "PrimaryStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "PrimaryStatus provides a high level status value, intended to align with Red-Yellow-Green type representation of status. It should be used in conjunction with DetailedStatus to provide high level and detailed health status of the ManagedElement and its subcomponents. 
PrimaryStatus consists of one of the following values: Unknown, OK, Degraded or Error. \"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"OK\" indicates the ManagedElement is functioning normally. 
\"Degraded\" indicates the ManagedElement is functioning below normal. 
\"Error\" indicates the ManagedElement is in an Error condition.")
                 (:VALUE-MAP ("0" "1" "2" "3" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "OK" "Degraded" "Error" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.DetailedStatus"
                   "CIM_ManagedSystemElement.HealthState")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                ((:DESCRIPTION
                  "InstanceID is an optional property that may be used to opaquely and uniquely identify an instance of this class within the scope of the instantiating Namespace. Various subclasses of this class may override this property to make it required, or a key. Such subclasses may also modify the preferred algorithms for ensuring uniqueness that are defined below.
To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> must include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> must not contain a colon (:). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements. If not null and the above \"preferred\" algorithm is not used, the defining entity must assure that the resulting InstanceID is not reused across any InstanceIDs produced by this or other providers for the NameSpace of this instance. 
If not set to null for DMTF-defined instances, the \"preferred\" algorithm must be used with the <OrgID> set to CIM."))
                :INITFORM NIL)
               (CAPTION STRING :CIM-NAME "Caption" :QUALIFIERS
                ((:DESCRIPTION
                  "The Caption property is a short textual description (one- line string) of the object.")
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION
                  "The Description property provides a textual description of the object."))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                ((:DESCRIPTION
                  "A user-friendly name for the object. This property allows each instance to define a user-friendly name in addition to its key properties, identity data, and description information. 
Note that the Name property of ManagedSystemElement is also defined as a user-friendly name. But, it is often subclassed to be a Key. It is not reasonable that the same property can convey both identity and a user-friendly name, without inconsistencies. Where Name exists and is not a Key (such as for instances of LogicalDevice), the same information can be present in both the Name and ElementName properties. Note that if there is an associated instance of CIM_EnabledLogicalElementCapabilities, restrictions on this properties may exist as defined in ElementNameMask and MaxElementNameLen properties defined in that class."))
                :INITFORM NIL)
               (DEDICATED (ARRAY UINT16) :CIM-NAME "Dedicated" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating the purpose(s) to which the ComputerSystem is dedicated, if any, and what functionality is provided. For example, one could specify that the System is dedicated to \"Print\" (value=11) or acts as a \"Hub\" (value=8). 
Also, one could indicate that this is a general purpose system by indicating 'Not Dedicated' (value=0) but that it also hosts 'Print' (value=11) or mobile phone 'Mobile User Device' (value=17) services. 
A clarification is needed with respect to the value 17 (\"Mobile User Device\"). An example of a dedicated user device is a mobile phone or a barcode scanner in a store that communicates via radio frequency. These systems are quite limited in functionality and programmability, and are not considered 'general purpose' computing platforms. Alternately, an example of a mobile system that is 'general purpose' (i.e., is NOT dedicated) is a hand-held computer. Although limited in its programmability, new software can be downloaded and its functionality expanded by the user. 
A value of \"Management\" indicates this instance is dedicated to hosting system management software.
A value of \"Management Controller\" indicates this instance represents specialized hardware dedicated to systems management (i.e., a Baseboard Management Controller (BMC) or service processor).
The management scope of a \"Management Controller\" is typically a single managed system in which it is contained.
A value of \"Chassis Manager\" indicates this instance represents a system dedicated to management of a blade chassis and its contained devices. This value would be used to represent a Shelf Controller. A \"Chassis Manager\" is an aggregation point for management and may rely on subordinate management controllers for the management of constituent parts. A value of \"Host-based RAID Controller\" indicates this instance represents a RAID storage controller contained within a host computer. A value of \"Storage Device Enclosure\" indicates this instance represents an enclosure that contains storage devices. A \"Virtual Tape Library\" is the emulation of a tape library by a Virtual Library System. A \"Virtual Library System\" uses disk storage to emulate tape libraries.A \"FC Switch\" indicates this instance is dedicated to switching layer 2 fibre channel frames. An \"Ethernet Switch\" indicates this instance is dedicated to switching layer 2 ethernet frames.
\"Server\" indicates that the system is an independent computer system whose primary purpose is to host services for other systems and devices to access; typically as in a stand-alone floor or rack-mounted system.
\"Blade\" indicates this instance is a computer system that fits into another chassis and depends on it for services, such as power, cooling, etc.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25"
                   "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37"
                   "38" "39" "40" "136" "137" "138" ".." "32568..65535"))
                 (:VALUES
                  ("Not Dedicated" "Unknown" "Other" "Storage" "Router"
                   "Switch" "Layer 3 Switch" "Central Office Switch" "Hub"
                   "Access Server" "Firewall" "Print" "I/O" "Web Caching"
                   "Management" "Block Server" "File Server"
                   "Mobile User Device" "Repeater" "Bridge/Extender" "Gateway"
                   "Storage Virtualizer" "Media Library" "ExtenderNode"
                   "NAS Head" "Self-contained NAS" "UPS" "IP Phone"
                   "Management Controller" "Chassis Manager"
                   "Host-based RAID controller" "Storage Device Enclosure"
                   "Desktop" "Laptop" "Virtual Tape Library"
                   "Virtual Library System" "Network PC/Thin Client"
                   "FC Switch" "Ethernet Switch" "Server" "Blade"
                   "Partitioned Library System" "Unallocated Partition"
                   "Partition" "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|MIB-II.sysServices"
                   "FC-GS.INCITS-T11 | Platform | PlatformType"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ComputerSystem.OtherDedicatedDescriptions")))
                :INITFORM NIL)
               (OTHERDEDICATEDDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherDedicatedDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing how or why the system is dedicated when the Dedicated array includes the value 2, \"Other\".")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE ("CIM_ComputerSystem.Dedicated")))
                :INITFORM NIL)
               (POWERMANAGEMENTCAPABILITIES (ARRAY UINT16) :CIM-NAME
                "PowerManagementCapabilities" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_PowerManagementCapabilities.PowerCapabilities"))
                 (:DESCRIPTION
                  "An enumerated array describing the power management capabilities of the ComputerSystem. The use of this property has been deprecated. Instead, the Power Capabilites property in an associated PowerManagement Capabilities class should be used.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7"))
                 (:VALUES
                  ("Unknown" "Not Supported" "Disabled" "Enabled"
                   "Power Saving Modes Entered Automatically"
                   "Power State Settable" "Power Cycling Supported"
                   "Timed Power On Supported"))
                 (:MAPPING-STRINGS ("MIF.DMTF|System Power Controls|001.2")))
                :INITFORM NIL)
               (ROLES (ARRAY STRING) :CIM-NAME "Roles" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "An array (bag) of strings that specifies the administrator -defined roles this System plays in the managed environment. Examples might be 'Building 8 print server' or 'Boise user directories'. A single system may perform multiple roles. 
Note that the instrumentation view of the 'roles' of a System is defined by instantiating a specific subclass of System, or by properties in a subclass, or both. For example, the purpose of a ComputerSystem is defined using the Dedicated and OtherDedicatedDescription properties."))
                :INITFORM NIL)
               (OTHERIDENTIFYINGINFO (ARRAY STRING) :CIM-NAME
                "OtherIdentifyingInfo" :QUALIFIERS
                ((:DESCRIPTION
                  "OtherIdentifyingInfo captures additional data, beyond System Name information, that could be used to identify a ComputerSystem. One example would be to hold the Fibre Channel World-Wide Name (WWN) of a node. Note that if only the Fibre Channel name is available and is unique (able to be used as the System key), then this property would be NULL and the WWN would become the System key, its data placed in the Name property.")
                 (:ARRAYTYPE "Indexed") (:MAX-LEN "256")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_System.IdentifyingDescriptions")))
                :INITFORM NIL)
               (IDENTIFYINGDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "IdentifyingDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of free-form strings providing explanations and details behind the entries in the OtherIdentifying Info array. Note, each entry of this array is related to the entry in OtherIdentifyingInfo that is located at the same index.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE ("CIM_System.OtherIdentifyingInfo")))
                :INITFORM NIL)
               (AVAILABLEREQUESTEDSTATES (ARRAY UINT16) :CIM-NAME
                "AvailableRequestedStates" :QUALIFIERS
                ((:DESCRIPTION
                  "AvailableRequestedStates indicates the possible values for the RequestedState parameter of the method RequestStateChange, used to initiate a state change. The values listed shall be a subset of the values contained in the RequestedStatesSupported property of the associated instance of CIM_EnabledLogicalElementCapabilities where the values selected are a function of the current state of the CIM_EnabledLogicalElement. This property may be non-null if an implementation is able to advertise the set of possible values as a function of the current state. This property shall be null if an implementation is unable to determine the set of possible values as a function of the current state.")
                 (:VALUE-MAP ("2" "3" "4" "6" "7" "8" "9" "10" "11" ".."))
                 (:VALUES
                  ("Enabled" "Disabled" "Shut Down" "Offline" "Test" "Defer"
                   "Quiesce" "Reboot" "Reset" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.RequestStateChange"
                   "CIM_EnabledLogicalElementCapabilities.RequestedStatesSupported")))
                :INITFORM NIL)
               (OPERATIONALSTATUS (ARRAY UINT16) :CIM-NAME "OperationalStatus"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the current statuses of the element. Various operational statuses are defined. Many of the enumeration's values are self-explanatory. However, a few are not and are described here in more detail. 
\"Stressed\" indicates that the element is functioning, but needs attention. Examples of \"Stressed\" states are overload, overheated, and so on. 
\"Predictive Failure\" indicates that an element is functioning nominally but predicting a failure in the near future. 
\"In Service\" describes an element being configured, maintained, cleaned, or otherwise administered. 
\"No Contact\" indicates that the monitoring system has knowledge of this element, but has never been able to establish communications with it. 
\"Lost Communication\" indicates that the ManagedSystem Element is known to exist and has been contacted successfully in the past, but is currently unreachable. 
\"Stopped\" and \"Aborted\" are similar, although the former implies a clean and orderly stop, while the latter implies an abrupt stop where the state and configuration of the element might need to be updated. 
\"Dormant\" indicates that the element is inactive or quiesced. 
\"Supporting Entity in Error\" indicates that this element might be \"OK\" but that another element, on which it is dependent, is in error. An example is a network service or endpoint that cannot function due to lower-layer networking problems. 
\"Completed\" indicates that the element has completed its operation. This value should be combined with either OK, Error, or Degraded so that a client can tell if the complete operation Completed with OK (passed), Completed with Error (failed), or Completed with Degraded (the operation finished, but it did not complete OK or did not report an error). 
\"Power Mode\" indicates that the element has additional power model information contained in the Associated PowerManagementService association. 
\"Relocating\" indicates the element is being relocated.
OperationalStatus replaces the Status property on ManagedSystemElement to provide a consistent approach to enumerations, to address implementation needs for an array property, and to provide a migration path from today's environment to the future. This change was not made earlier because it required the deprecated qualifier. Due to the widespread use of the existing Status property in management applications, it is strongly recommended that providers or instrumentation provide both the Status and OperationalStatus properties. Further, the first value of OperationalStatus should contain the primary status for the element. When instrumented, Status (because it is single-valued) should also provide the primary status of the element.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Other" "OK" "Degraded" "Stressed"
                   "Predictive Failure" "Error" "Non-Recoverable Error"
                   "Starting" "Stopping" "Stopped" "In Service" "No Contact"
                   "Lost Communication" "Aborted" "Dormant"
                   "Supporting Entity in Error" "Completed" "Power Mode"
                   "Relocating" "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.StatusDescriptions")))
                :INITFORM NIL)
               (STATUSDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "StatusDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "Strings describing the various OperationalStatus array values. For example, if \"Stopping\" is the value assigned to OperationalStatus, then this property may contain an explanation as to why an object is being stopped. Note that entries in this array are correlated with those at the same array index in OperationalStatus.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.OperationalStatus")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_VirtualComputerSystem")
              (:QUALIFIERS (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::SystemElements")
               (:DESCRIPTION
                "A class derived from ComputerSystem that represents the ability to virtualize or emulate another ComputerSystem.")))
(DEFCIM-METHOD SETPOWERSTATE
    ((INSTANCE CIM_VIRTUALCOMPUTERSYSTEM)
     (POWERSTATE UINT32 "PowerState"
      (:DESCRIPTION "The Desired state for the COmputerSystem.")
      (:VALUE-MAP ("1" "2" "3" "4" "5" "6" "7" "8"))
      (:VALUES
       ("Full Power" "Power Save - Low Power Mode" "Power Save - Standby"
        "Power Save - Other" "Power Cycle" "Power Off" "Hibernate"
        "Soft Off")))
     (TIME
      DATETIME
      "Time"
      (:DESCRIPTION
       "Time indicates when the power state should be set, either as a regular date-time value or as an interval value (where the interval begins when the method invocation is received.")))
    ((:CIM-NAME "SetPowerState")
     (:QUALIFIERS (:DEPRECATED ("CIM_PowerManagementService.SetPowerState"))
      (:DESCRIPTION
       "Sets the power state of the computer. The use of this method has been deprecated. Instead, use the SetPowerState method in the associated PowerManagementService class."))))
(DEFCIM-METHOD REQUESTSTATECHANGE
    ((INSTANCE CIM_VIRTUALCOMPUTERSYSTEM)
     (REQUESTEDSTATE UINT16 "RequestedState" :IN
      (:DESCRIPTION
       "The state requested for the element. This information will be placed into the RequestedState property of the instance if the return code of the RequestStateChange method is 0 ('Completed with No Error'), or 4096 (0x1000) ('Job Started'). Refer to the description of the EnabledState and RequestedState properties for the detailed explanations of the RequestedState values.")
      (:VALUE-MAP ("2" "3" "4" "6" "7" "8" "9" "10" "11" ".." "32768..65535"))
      (:VALUES
       ("Enabled" "Disabled" "Shut Down" "Offline" "Test" "Defer" "Quiesce"
        "Reboot" "Reset" "DMTF Reserved" "Vendor Reserved"))
      (:MODEL-CORRESPONDENCE ("CIM_EnabledLogicalElement.RequestedState")))
     (TIMEOUTPERIOD DATETIME "TimeoutPeriod" :IN
      (:DESCRIPTION
       "A timeout period that specifies the maximum amount of time that the client expects the transition to the new state to take. The interval format must be used to specify the TimeoutPeriod. A value of 0 or a null parameter indicates that the client has no time requirements for the transition. 
If this property does not contain 0 or null and the implementation does not support this parameter, a return code of 'Use Of Timeout Parameter Not Supported' shall be returned."))
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION
       "May contain a reference to the ConcreteJob created to track the state transition initiated by the method invocation.")))
    ((:CIM-NAME "RequestStateChange")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests that the state of the element be changed to the value specified in the RequestedState parameter. When the requested state change takes place, the EnabledState and RequestedState of the element will be the same. Invoking the RequestStateChange method multiple times could result in earlier requests being overwritten or lost. 
A return code of 0 shall indicate the state change was successfully initiated. 
A return code of 3 shall indicate that the state transition cannot complete within the interval specified by the TimeoutPeriod parameter. 
A return code of 4096 (0x1000) shall indicate the state change was successfully initiated, a ConcreteJob has been created, and its reference returned in the output parameter Job. Any other return code indicates an error condition.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" ".." "4096" "4097" "4098" "4099"
        "4100..32767" "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported"
        "Unknown or Unspecified Error" "Cannot complete within Timeout Period"
        "Failed" "Invalid Parameter" "In Use" "DMTF Reserved"
        "Method Parameters Checked - Job Started" "Invalid State Transition"
        "Use of Timeout Parameter Not Supported" "Busy" "Method Reserved"
        "Vendor Specific"))
      (:MODEL-CORRESPONDENCE ("CIM_EnabledLogicalElement.RequestedState")))))