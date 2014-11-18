
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MessageLog.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MESSAGELOG (CIM_LOG)
              ((CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:KEY (:OVERRIDE "Name")
                 (:DESCRIPTION
                  "The inherited Name serves as part of the key (a unique identifier) for the MessageLog instance.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (MAXLOGSIZE UINT64 :CIM-NAME "MaxLogSize" :QUALIFIERS
                ((:DESCRIPTION
                  "The maximum size, in bytes, to which the Log can grow. If there is no maximum, then MaxLogSize should be set to 0.")
                 (NIL "Bytes") (:P-UNIT "byte"))
                :INITFORM NIL)
               (SIZEOFHEADER UINT64 :CIM-NAME "SizeOfHeader" :QUALIFIERS
                ((:DESCRIPTION
                  "The size of the Log header, in bytes, if one is present. If there is no Log header, then this property should be set to 0. Headers may include general information about the Log such as the current number of records, time of last update, or a pointer to the location of the first Log entry. Note that this property is NOT the size of the header for an individual Log entry. The latter is described by the property, SizeOfRecordHeader.")
                 (NIL "Bytes") (:P-UNIT "byte"))
                :INITFORM NIL)
               (HEADERFORMAT STRING :CIM-NAME "HeaderFormat" :QUALIFIERS
                ((:DESCRIPTION
                  "If the SizeOfHeader property is non-zero, this property describes the structure and format of the Log header. It is a free-form string. If the SizeOfHeader property is 0, then the information in this property is undefined."))
                :INITFORM NIL)
               (MAXRECORDSIZE UINT64 :CIM-NAME "MaxRecordSize" :QUALIFIERS
                ((:DESCRIPTION
                  "Maximum size, in bytes, to which an individual Log entry (record) can grow - if the Capabilities array includes a value of 7 (\"Variable Length Records Supported\"). If the Capabilities array does not include a 7, then the Log only supports fixed length entries. The size of these entries is described by this property.")
                 (NIL "Bytes") (:P-UNIT "byte"))
                :INITFORM NIL)
               (SIZEOFRECORDHEADER UINT64 :CIM-NAME "SizeOfRecordHeader"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The size of the header for the Log's individual entries, in bytes, if record headers are defined. If there are no record headers, then this property should be set to 0. Record headers may include information such as the type of the Log entry, the date/time that the entry was last updated, or a pointer to the start of optional data. Note that this property defines the header size for individual records in the Log, while the SizeOfHeader property describes the Log's overall header, typically located at the start of the MessageLog.")
                 (NIL "Bytes") (:P-UNIT "byte"))
                :INITFORM NIL)
               (RECORDHEADERFORMAT STRING :CIM-NAME "RecordHeaderFormat"
                :QUALIFIERS
                ((:DESCRIPTION
                  "If the SizeOfRecordHeader property is non-zero, this property describes the structure and format of the record headers. It is a free-form string. If the SizeOfRecordHeader property is 0, then the information in this property is undefined."))
                :INITFORM NIL)
               (OVERWRITEPOLICY UINT16 :CIM-NAME "OverwritePolicy" :QUALIFIERS
                ((:OVERRIDE "OverwritePolicy")
                 (:DESCRIPTION
                  "An enumeration describing the behavior of the Log, when it becomes full or near full. For example, the Log may wrap (value=2) or may simply stop recording entries (value =7). 

Some of the property's possible values need further explanation: 
3=\"Clear When Near Full\" indicates that all of the Log's entries will be deleted when a specified record capacity is reached. The capacity is specified in percentage, using the property, PercentageNearFull. 'Near Full' may be less than 100% if the Log takes time to clear, and a position should always be available for new records. 
4=\"Overwrite Outdated When Needed\" describes that Log entries (timestamped later than the date/time specified in the property, TimeWhenOutdated) can be overwritten. 
5=\"Remove Outdated Records\" specifies that records (timestamped later than the date/time specified in the property, TimeWhenOutdated) are logically and/or physically removed from the Log. 
6=\"Overwrite Specific Records\" indicates that specially flagged records may be overwritten. This property only makes sense when the Capabilities array includes a value of 10, \"Can Flag Records for Overwrite\".")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7"))
                 (:VALUES
                  ("Unknown" "Other" "Wraps When Full" "Clear When Near Full"
                   "Overwrite Outdated When Needed" "Remove Outdated Records"
                   "Overwrite Specific Records" "Never Overwrite"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_MessageLog.OtherPolicyDescription"
                   "CIM_MessageLog.TimeWhenOutdated"
                   "CIM_MessageLog.PercentageNearFull")))
                :INITFORM NIL)
               (OTHERPOLICYDESCRIPTION STRING :CIM-NAME
                "OtherPolicyDescription" :QUALIFIERS
                ((:DESCRIPTION
                  "When the OverwritePolicy specifies a value of 1 (\"Other\"), the Log's behavior can be explained using this property. If OverwritePolicy is not 1, then this property's contents are undefined.")
                 (:MODEL-CORRESPONDENCE ("CIM_MessageLog.OverwritePolicy")))
                :INITFORM NIL)
               (TIMEWHENOUTDATED DATETIME :CIM-NAME "TimeWhenOutdated"
                :QUALIFIERS
                ((:DESCRIPTION
                  "If the OverwritePolicy is based on 'outdated' records (values 4 or 5), this property defines when a Log entry is considered to be outdated - either by time interval or at a specific date and time.")
                 (:MODEL-CORRESPONDENCE ("CIM_MessageLog.OverwritePolicy")))
                :INITFORM NIL)
               (PERCENTAGENEARFULL UINT8 :CIM-NAME "PercentageNearFull"
                :QUALIFIERS
                ((:DESCRIPTION
                  "If the OverwritePolicy is based on clearing records when the Log is near full (value=3), this property defines the record capacity (in percentage) that is considered to be 'near full'.")
                 (NIL "Percent")
                 (:MODEL-CORRESPONDENCE ("CIM_MessageLog.OverwritePolicy"))
                 (:P-UNIT "percent"))
                :INITFORM NIL)
               (LASTCHANGE UINT16 :CIM-NAME "LastChange" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration describing the last change to the MessageLog.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES ("Unknown" "Add" "Delete" "Modify" "Log Cleared")))
                :INITFORM NIL)
               (TIMEOFLASTCHANGE DATETIME :CIM-NAME "TimeOfLastChange"
                :QUALIFIERS
                ((:DESCRIPTION
                  "When a change is made to the Log, the date/time of that modification is captured. This property could be used to event against any update to the MessageLog."))
                :INITFORM NIL)
               (RECORDLASTCHANGED UINT64 :CIM-NAME "RecordLastChanged"
                :QUALIFIERS
                ((:DESCRIPTION
                  "When a change is made to the Log, the record number that was modified is captured."))
                :INITFORM NIL)
               (ISFROZEN BOOLEAN :CIM-NAME "IsFrozen" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating that the Log is currently frozen and modifications are not allowed."))
                :INITFORM NIL)
               (CHARACTERSET UINT16 :CIM-NAME "CharacterSet" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration describing the character set used to record data in the individual Log entries. For example, the Log records may contain ASCII data (value=2), or be raw octet strings (value=10).")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11"))
                 (:VALUES
                  ("Unknown" "Other" "ASCII" "Unicode" "ISO2022" "ISO8859"
                   "Extended UNIX Code" "UTF-8" "UCS-2" "Bitmapped Data"
                   "OctetString" "Defined by Individual Records")))
                :INITFORM NIL)
               (MAXNUMBEROFRECORDS UINT64 :CIM-NAME "MaxNumberOfRecords"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Maximum number of records that can be captured in the Log. If undefined, a value of zero should be specified."))
                :INITFORM NIL)
               (CURRENTNUMBEROFRECORDS UINT64 :CIM-NAME
                "CurrentNumberOfRecords" :QUALIFIERS
                ((:DESCRIPTION "Current number of records in the Log.") :GAUGE)
                :INITFORM NIL)
               (LOGSTATE UINT16 :CIM-NAME "LogState" :QUALIFIERS
                ((:DESCRIPTION
                  "LogState is an integer enumeration that indicates the current state of a log represented by CIM_Log subclasses. LogState is to be used in conjunction with the EnabledState property to fully describe the current state of the log. The following text briefly summarizes the various log states: 
Unknown (0) indicates the state of the log is unknown. 
Normal (2) indicates that the log is or could be executing logging commands, will process any queued log entries, and will queue new logging requests. 
Erasing (3) indicates that the log is being erased. 
Not Applicable (4) indicates the log does not support representing a log state.")
                 (:VALUE-MAP ("0" "2" "3" "4" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "Normal" "Erasing" "Not Applicable"
                   "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM "4")
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
               (CAPABILITIES (ARRAY UINT16) :CIM-NAME "Capabilities"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An array of integers indicating the Log capabilities. Information such as \"Write Record Supported\" (value= 2) or \"Variable Length Records Supported\" (8) is specified in this property.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10"))
                 (:VALUES
                  ("Unknown" "Other" "Write Record Supported"
                   "Delete Record Supported" "Can Move Backward in Log"
                   "Freeze Log Supported" "Clear Log Supported"
                   "Supports Addressing by Ordinal Record Number"
                   "Variable Length Records Supported"
                   "Variable Formats for Records"
                   "Can Flag Records for Overwrite"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_MessageLog.CapabilitiesDescriptions")))
                :INITFORM NIL)
               (CAPABILITIESDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "CapabilitiesDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of free-form strings providing more detailed explanations for any of the Log features indicated in the Capabilities array. Note, each entry of this array is related to the entry in the Capabilities array that is located at the same index.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE ("CIM_MessageLog.Capabilities")))
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
              (:CIM-NAME "CIM_MessageLog")
              (:QUALIFIERS (:VERSION "2.14.0")
               (:UML-PACKAGE-PATH "CIM::System::Logs")
               (:DESCRIPTION
                "MessageLog represents any type of event, error or informational register or chronicle. The object describes the existence of the log and its characteristics. Several methods are defined for retrieving, writing and deleting log entries, and maintaining the log. This type of log uses iterators to access the log records, whereas its peer class, RecordLog, uses more abstracted access mechanisms.")))
(DEFCIM-METHOD POSITIONTOFIRSTRECORD
    ((INSTANCE CIM_MESSAGELOG)
     (ITERATIONIDENTIFIER STRING "IterationIdentifier" :IN :OUT
      (:DESCRIPTION "An identifier for the iterator.")))
    ((:CIM-NAME "PositionToFirstRecord")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests that an iteration of the MessageLog be established and that the iterator be set to the first entry in the Log. An identifier for the iterator is returned as an output parameter of the method. 

Regarding iteration, you have 2 choices: 1) Embed iteration data in the method call, and allow implementations to track/ store this data manually; or, 2) Iterate using a separate object (for example, class ActiveIterator) as an iteration agent. The first approach is used here for interoperability. The second requires an instance of the Iterator object for EACH iteration in progress. 2's functionality could be implemented underneath 1. 

The return value from PositionToFirstRecord should be 0 if the request was successfully executed, 1 if the request is not supported and some other value if an error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD POSITIONATRECORD
    ((INSTANCE CIM_MESSAGELOG)
     (ITERATIONIDENTIFIER STRING "IterationIdentifier" :IN :OUT
      (:DESCRIPTION "An identifier for the iterator."))
     (MOVEABSOLUTE BOOLEAN "MoveAbsolute" :IN
      (:DESCRIPTION
       "Advancing or retreating the IterationIdentifier is achieved by setting the MoveAbsolute boolean to FALSE, and specifying the number of entries to advance or retreat as positive or negative values in the RecordNumber parameter. Moving to a specific record number is accomplished by setting the MoveAbsolute parameter to TRUE, and placing the record number into the RecordNumber parameter."))
     (RECORDNUMBER SINT64 "RecordNumber" :IN :OUT
      (:DESCRIPTION "The relative or absolute record number.")))
    ((:CIM-NAME "PositionAtRecord")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests that the Log's iteration identifier be advanced or retreated a specific number of records, or set to the entry at a specified numeric location. These two different behaviors are accomplished using the input parameters of the method. Advancing or retreating is achieved by setting the MoveAbsolute boolean to FALSE, and then specifying the number of entries to advance or retreat as positive or negative values in the RecordNumber parameter. Moving to a specific record number is accomplished by setting the MoveAbsolute input parameter to TRUE, and then placing the record number into the RecordNumber parameter. This can only be done if the Capabilities array includes a value of 7, \"Supports Addressing by Ordinal Record Number\". 

After the method completes and if ordinal record numbers are supported (the Capabilities array includes a 7), the current record number is returned in the RecordNumber output parameter. Otherwise, the value of the parameter is undefined. 

IterationIdentifier is defined as an Input/Output method parameter to allow the Log to embed state information in the Identifier and potentially let the identifier be maintained by the using application. 

The return value from PositionAtRecord should be 0 if the request was successfully executed, 1 if the request is not supported and some other value if an error occurred. If the request is not supported, check the Capabilities array regarding support for ordinal record number addressing and backward movement in the Log (values 7 and 4, respectively). 

Note: In a subclass, the set of possible return codes could be described using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD GETRECORD
    ((INSTANCE CIM_MESSAGELOG)
     (ITERATIONIDENTIFIER STRING "IterationIdentifier" :IN :OUT
      (:DESCRIPTION "An identifier for the iterator."))
     (POSITIONTONEXT BOOLEAN "PositionToNext" :IN
      (:DESCRIPTION
       "Boolean indicating that the Iteration Identifier should be advanced to the next record, after retrieving the current Log entry."))
     (RECORDNUMBER UINT64 "RecordNumber" :IN :OUT
      (:DESCRIPTION "The record number."))
     (RECORDDATA (ARRAY UINT8) "RecordData" :IN :OUT
      (:DESCRIPTION "The record data.")))
    ((:CIM-NAME "GetRecord")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests that the record indicated by the IterationIdentifier be retrieved from the MessageLog. After retrieval, the IterationIdentifier may be advanced to the next record by setting the PositionToNext input parameter to TRUE. Two output parameters are defined for the method - RecordData which holds the contents of the Log entry (as an array of bytes that can be recast to an appropriate format), and RecordNumber which returns the current record number addressed via the Iteration Identifier. The RecordNumber parameter is only defined/valid when the Capabilities array indicates that ordinal record number addressing is supported (a value of 7). 

IterationIdentifier is defined as an Input/Output method parameter to allow the Log to embed state information in the Identifier and potentially let the identifier be maintained by the using application. 

The return value from GetRecord should be 0 if the request was successfully executed, 1 if the request is not supported, and some other value if an error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD DELETERECORD
    ((INSTANCE CIM_MESSAGELOG)
     (ITERATIONIDENTIFIER STRING "IterationIdentifier" :IN :OUT
      (:DESCRIPTION "An identifier for the iterator."))
     (POSITIONTONEXT BOOLEAN "PositionToNext" :IN
      (:DESCRIPTION
       "Boolean that when set to TRUE requests the IterationIdentifier to be advanced to the next record, after the current entry is deleted. If set to FALSE, IterationIdentifier is set to the previous record."))
     (RECORDNUMBER UINT64 "RecordNumber" :IN :OUT
      (:DESCRIPTION "The record number."))
     (RECORDDATA (ARRAY UINT8) "RecordData" :IN :OUT
      (:DESCRIPTION "The record data.")))
    ((:CIM-NAME "DeleteRecord")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests that the record indicated by the IterationIdentifier be deleted from the MessageLog. After deletion, the Iteration Identifier may be advanced to the next record by setting the PositionToNext input parameter to TRUE. If set to FALSE, then the IterationIdentifier will be positioned at the previous record. Two output parameters are defined for the method - RecordData which holds the contents of the deleted Log entry (as an array of bytes that can be recast to an appropriate format or discarded), and RecordNumber which returns the current record number addressed via the IterationIdentifier. The RecordNumber parameter is only defined/valid when the Capabilities array indicates that ordinal record number addressing is supported (a value of 7). 

IterationIdentifier is defined as an Input/Output method parameter to allow the Log to embed state information in the Identifier and potentially let the identifier be maintained by the using application. 

The return value from DeleteRecord should be 0 if the request was successfully executed, 1 if the request is not supported, and some other value if an error occurred. If the request is not supported, check the Capabilities array that a value of 3 (\"Delete Record Supported\") is specified. 

Note: In a subclass, the set of possible return codes could be described using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD WRITERECORD
    ((INSTANCE CIM_MESSAGELOG)
     (ITERATIONIDENTIFIER STRING "IterationIdentifier" :IN :OUT
      (:DESCRIPTION "An identifier for the iterator."))
     (POSITIONTONEXT BOOLEAN "PositionToNext" :IN
      (:DESCRIPTION
       "Boolean indicating that the Iteration Identifier should be advanced to the next record, after writing the Log entry."))
     (RECORDNUMBER UINT64 "RecordNumber" :IN :OUT
      (:DESCRIPTION "The record number."))
     (RECORDDATA (ARRAY UINT8) "RecordData" :IN
      (:DESCRIPTION "The record data.")))
    ((:CIM-NAME "WriteRecord")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests that a record be inserted at the Log position indicated by the IterationIdentifier. The entry's data is provided in the RecordData input parameter. After insertion, the IterationIdentifier may be advanced to the next record by setting the PositionToNext input parameter to TRUE. The output parameter, RecordNumber, returns the current record number addressed via the IterationIdentifier. This parameter is only defined/valid when the Capabilities array indicates that ordinal record number addressing is supported (a value of 7). 

IterationIdentifier is defined as an Input/Output method parameter to allow the Log to embed state information in the Identifier and potentially let the identifier be maintained by the using application. 

The return value from WriteRecord should be 0 if the request was successfully executed, 1 if the request is not supported, and some other value if an error occurred. If the request is not supported, check the Capabilities array that a value of 2 (\"Write Record Supported\") is specified. 

Note: In a subclass, the set of possible return codes could be described using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD CANCELITERATION
    ((INSTANCE CIM_MESSAGELOG)
     (ITERATIONIDENTIFIER STRING "IterationIdentifier" :IN
      (:DESCRIPTION "An identifier for the iterator.")))
    ((:CIM-NAME "CancelIteration")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests that an iteration of the Log, identified by the IterationIdentifier input parameter, be stopped. The return value from CancelIteration should be 0 if the request was successfully executed, 1 if the request is not supported and some other value if an error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD FREEZELOG
    ((INSTANCE CIM_MESSAGELOG)
     (FREEZE BOOLEAN "Freeze" :IN
      (:DESCRIPTION
       "If TRUE then freeze the log, if FALSE 'unfreeze' the log.")))
    ((:CIM-NAME "FreezeLog")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests that the MessageLog be placed in a frozen state (\"Freeze\" input parameter = TRUE) or 'unfrozen' (= FALSE). If frozen, modifications to the Log will not be allowed. If successful, the Log's IsFrozen boolean property will be updated to reflect the desired state. 

The method's return code should be 0 if the request was successfully executed, 1 if the request is not supported and some other value if an error occurred. If the request is not supported, check the Capabilities array that a value of 5 (\"Freeze Log Supported\") is specified. 

Note: In a subclass, the set of possible return codes could be described using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD FLAGRECORDFOROVERWRITE
    ((INSTANCE CIM_MESSAGELOG)
     (ITERATIONIDENTIFIER STRING "IterationIdentifier" :IN :OUT
      (:DESCRIPTION "An identifier for the iterator."))
     (POSITIONTONEXT BOOLEAN "PositionToNext" :IN
      (:DESCRIPTION
       "Boolean indicating that the Iteration Identifier should be advanced to the next record, after updating the current Log entry."))
     (RECORDNUMBER UINT64 "RecordNumber" :IN :OUT
      (:DESCRIPTION "The record number.")))
    ((:CIM-NAME "FlagRecordForOverwrite")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests that the record indicated by the IterationIdentifier be flagged as overwriteable. This method is only supported when the Capabilities array includes a value of 10, \"Can Flag Records for Overwrite\". After updating the entry, the IterationIdentifier may be advanced to the next record by setting the PositionToNext input parameter to TRUE. One output parameter is defined for the method RecordNumber. It returns the current record number addressed via the Iteration Identifier. This parameter is only defined/valid when the Capabilities array indicates that ordinal record number addressing is supported (a value of 7). 

IterationIdentifier is defined as an Input/Output method parameter to allow the Log to embed state information in the Identifier and potentially let the identifier be maintained by the using application. 

The return value from FlagRecordForOverwrite should be 0 if the request was successfully executed, 1 if the request is not supported, and some other value if an error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD CLEARLOG
    ((INSTANCE CIM_MESSAGELOG))
    ((:CIM-NAME "ClearLog")
     (:QUALIFIERS
      (:DESCRIPTION "Requests that the Log be cleared of all entries. 
The return value should be 0 if the request was successfully executed, 1 if the request is not supported, and some other value, as indicated by the ValueMap/Values qualifiers, if an error occurred.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6..0x0FFF" "0x1000..0x7FFF" "0x8000.."))
      (:VALUES
       ("Completed with no error" "Not Supported" "Unspecified Error" "Timeout"
        "Failed" "Invalid Parameter" "DMTF_Reserved" "Method_Reserved"
        "Vendor_Reserved")))))
(DEFCIM-METHOD REQUESTSTATECHANGE
    ((INSTANCE CIM_MESSAGELOG)
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