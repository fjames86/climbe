
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ZoneService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ZONESERVICE (CIM_SERVICE)
              ((SESSIONSTATE UINT16 :CIM-NAME "SessionState" :QUALIFIERS
                ((:DESCRIPTION
                  "SessionState is an integer enumeration that indicates whether the session is currently starting (value=2) or has ended (value=3). It is possible that a particular instance of a ZoneService might not support sessions. If sessions are not supported, the value 4 (\"Not Applicable\") is used.")
                 (:VALUE-MAP ("0" "2" "3" "4"))
                 (:VALUES ("Unknown" "Starting" "Ended" "Not Applicable")))
                :INITFORM "4")
               (REQUESTEDSESSIONSTATE UINT16 :CIM-NAME "RequestedSessionState"
                :QUALIFIERS
                ((:DESCRIPTION
                  "RequestedSessionState is an integer enumeration that indicates whether the ZoneService session has been requested to start (value=2), end (value=3), or terminate (value=4). Note that when RequestedSessionState is set to 4 (\"Not Applicable\"), then this property is not used. By default, the RequestedSessionState of the element is 5 (\"No Change\").")
                 (:VALUE-MAP ("2" "3" "4" "5"))
                 (:VALUES ("Start" "End" "Terminate" "No Change"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ZoneService.SessionState"
                   "CIM_ZoneService.SessionControl")))
                :INITFORM "5")
               (DEFAULTZONINGSTATE UINT16 :CIM-NAME "DefaultZoningState"
                :QUALIFIERS
                ((:DESCRIPTION
                  "DefaultZoningState indicates whether fabric members (devices) that are not in any other active Zones can access each other. In particular, if no Zones are active, a DefaultZoningState \"Allow\" indicates that all fabric members can access each other.")
                 (:VALUE-MAP ("0" "2" "3"))
                 (:VALUES ("Unknown" "Allow" "Deny")))
                :INITFORM NIL)
               (SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "The CreationClassName of the scoping System.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_System.CreationClassName"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The Name of the scoping System.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_System.Name"))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass that is used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:KEY (:OVERRIDE "Name")
                 (:DESCRIPTION
                  "The Name property uniquely identifies the Service and provides an indication of the functionality that is managed. This functionality is described in more detail in the Description property of the object.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (PRIMARYOWNERNAME STRING :CIM-NAME "PrimaryOwnerName"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The name of the primary owner for the service, if one is defined. The primary owner is the initial support contact for the Service.")
                 (:MAX-LEN "64")
                 (:MAPPING-STRINGS ("MIF.DMTF|General Information|001.3")))
                :INITFORM NIL)
               (PRIMARYOWNERCONTACT STRING :CIM-NAME "PrimaryOwnerContact"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "A string that provides information on how the primary owner of the Service can be reached (for example, phone number, e-mail address, and so on).")
                 (:MAX-LEN "256")
                 (:MAPPING-STRINGS ("MIF.DMTF|General Information|001.4")))
                :INITFORM NIL)
               (STARTMODE STRING :CIM-NAME "StartMode" :QUALIFIERS
                ((:DEPRECATED ("CIM_Service.EnabledDefault"))
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated in lieu of the EnabledDefault property that is inherited from EnabledLogicalElement. The EnabledLogicalElement addresses the same semantics. The change to a uint16 data type was discussed when CIM V2.0 was defined. However, existing V1.0 implementations used the string property. To remain compatible with those implementations, StartMode was grandfathered into the schema. Use of the deprecated qualifier allows the maintenance of the existing property but also permits an improved, clarified definition using EnabledDefault. 
Deprecated description: StartMode is a string value that indicates whether the Service is automatically started by a System, an Operating System, and so on, or is started only upon request.")
                 (:VALUE-MAP ("Automatic" "Manual")) (:MAX-LEN "10"))
                :INITFORM NIL)
               (STARTED BOOLEAN :CIM-NAME "Started" :QUALIFIERS
                ((:DESCRIPTION
                  "Started is a Boolean that indicates whether the Service has been started (TRUE), or stopped (FALSE)."))
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
              (:CIM-NAME "CIM_ZoneService")
              (:QUALIFIERS (:VERSION "2.23.0")
               (:UML-PACKAGE-PATH "CIM::Device::FC")
               (:DESCRIPTION
                "The ZoneService if responsible for managing the Zone enforcement for the fabric. The ZoneService is hosted on an AdminDomain. This relationship is depicted by the HostedService association.")))
(DEFCIM-METHOD CREATEZONESET
    ((INSTANCE CIM_ZONESERVICE)
     (ZONESETNAME STRING "ZoneSetName" :REQUIRED :IN
      (:DESCRIPTION
       "A user-friendly name for the ZoneSet that is unique within the AdminDomain.")
      (:MODEL-CORRESPONDENCE ("CIM_ZoneSet.ElementName")))
     (ZONESET "CIM_ZoneSet" "ZoneSet" :IN :OUT
      (:DESCRIPTION "A reference to the newly created Zone.")))
    ((:CIM-NAME "CreateZoneSet")
     (:QUALIFIERS
      (:DESCRIPTION
       "The method creates a ZoneSet and the association HostedCollection. The newly created association, HostedCollection, associates the Zone to the same AdminDomain that the ZoneService is hosted to. For the newly created ZoneSet, the Active property is always set to false. 

This method might be deprecated in the future in lieu of intrinsics after limitations in the CIM Operations are addressed.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10..0x0FFF" "0x1000..0x7777"
        "0x8000.."))
      (:VALUES
       ("Success" "Not Supported" "Unspecified Error" "Timeout" "Failed"
        "Invalid Parameter" "Access_Denied" "Not_Found" "Already_Exists"
        "Insufficient_Resources" "DMTF_Reserved" "Method_Reserved"
        "Vendor_Reserved")))))
(DEFCIM-METHOD CREATEZONE
    ((INSTANCE CIM_ZONESERVICE)
     (ZONENAME STRING "ZoneName" :REQUIRED :IN
      (:DESCRIPTION
       "A user-friendly name for the Zone that is unique within the AdminDomain.")
      (:MODEL-CORRESPONDENCE ("CIM_Zone.ElementName")))
     (ZONETYPE UINT16 "ZoneType" :IN
      (:DESCRIPTION "The type of zoning to be enforced.")
      (:VALUE-MAP ("2" "3")) (:VALUES ("Default" "Protocol"))
      (:MODEL-CORRESPONDENCE ("CIM_Zone.ZoneType")))
     (ZONESUBTYPE UINT16 "ZoneSubType" :IN
      (:DESCRIPTION
       "Specific clarification to be used when the ZoneType has an enumeration that requires it. Specifically, if ZoneType is \"Protocol\", then SubType is the Fibre Channel FC4 type.")
      (:VALUE-MAP ("2" "3" "4")) (:VALUES ("SCSI" "VI" "IP"))
      (:MODEL-CORRESPONDENCE ("CIM_Zone.ZoneSubType")))
     (ZONE "CIM_Zone" "Zone" :IN :OUT
      (:DESCRIPTION "A reference to the newly created Zone.")))
    ((:CIM-NAME "CreateZone")
     (:QUALIFIERS
      (:DESCRIPTION
       "The method creates a Zone and the association HostedCollection. The newly created association, HostedCollection, associates the Zone to the same AdminDomain that the ZoneService is hosted to. For the newly created Zone, the Active property is always set to false. 

This method might be deprecated in the future in lieu of intrinsics after limitations in the CIM Operations are addressed.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10..0x0FFF" "0x1000..0x7777"
        "0x8000.."))
      (:VALUES
       ("Success" "Not Supported" "Unspecified Error" "Timeout" "Failed"
        "Invalid Parameter" "Access_Denied" "Not_Found" "Already_Exists"
        "Insufficient_Resources" "DMTF_Reserved" "Method_Reserved"
        "Vendor_Reserved")))))
(DEFCIM-METHOD CREATEZONEALIAS
    ((INSTANCE CIM_ZONESERVICE)
     (COLLECTIONALIAS STRING "CollectionAlias" :REQUIRED :IN
      (:DESCRIPTION
       "A name (alias) for the ZoneAlias that is unique in the context of the hosting System.")
      (:MODEL-CORRESPONDENCE ("CIM_ZoneAlias.CollectionAlias")))
     (ZONEALIAS "CIM_NamedAddressCollection" "ZoneAlias" :IN :OUT
      (:DESCRIPTION "A reference to the newly created ZoneAlias.")))
    ((:CIM-NAME "CreateZoneAlias")
     (:QUALIFIERS
      (:DESCRIPTION
       "The method creates a ZoneAlias and the association HostedCollection. The newly created association, HostedCollection, associates the ZoneAlias to the same AdminDomain that the ZoneService is hosted to. For the newly created ZoneAlias, the Active property is always set to false. 

This method might be deprecated in the future in lieu of intrinsics after limitations in the CIM Operations are addressed.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10..0x0FFF" "0x1000..0x7777"
        "0x8000.."))
      (:VALUES
       ("Success" "Not Supported" "Unspecified Error" "Timeout" "Failed"
        "Invalid Parameter" "Access_Denied" "Not_Found" "Already_Exists"
        "Insufficient_Resources" "DMTF_Reserved" "Method_Reserved"
        "Vendor_Reserved")))))
(DEFCIM-METHOD CREATEZONEMEMBERSHIPSETTINGDATA
    ((INSTANCE CIM_ZONESERVICE)
     (CONNECTIVITYMEMBERTYPE UINT16 "ConnectivityMemberType" :REQUIRED :IN
      (:DESCRIPTION
       "Identifies the type of identification placed in ConnectivityMemberID.")
      (:VALUE-MAP ("0" "1" "2" "3" "4" "5" ".." "0x8000.."))
      (:VALUES
       ("Unknown" "Other" "PermanentAddress" "NetworkAddress" "SwitchPortID"
        "LogicalPortGroup" "DMTF_Reserved" "Vendor_Reserved"))
      (:MODEL-CORRESPONDENCE ("CIM_ZoneMembershipSettingData.ZoneMemberType")))
     (CONNECTIVITYMEMBERID STRING "ConnectivityMemberID" :REQUIRED :IN
      (:DESCRIPTION
       "This property specifies the type of identification used in the ConnectivityMemberID field. For Fibre Channel: 
* A ConnectivityMemberType of 'PermanentAddress', the ConnectivityMemberID is the NxPort WWN; 
* A ConnectivityMemberType of 'NetworkAddress', the ConnectivityMemberID is the NXPort Address ID; 
* A ConnectivityMemberType of 'SwitchPortID', the ConnectivityMemberID is 'Domain:PortNumber'.")
      (:MODEL-CORRESPONDENCE
       ("CIM_ZoneMembershipSettingData.ConnectivityMemberID")))
     (SYSTEMSPECIFICCOLLECTION "CIM_SystemSpecificCollection"
      "SystemSpecificCollection" :REQUIRED :IN
      (:DESCRIPTION
       "The collection that the ZoneMembershipSettingData should be added to. The collection is either a Zone or ZoneAlias."))
     (ZONEMEMBERSHIPSETTINGDATA "CIM_ZoneMembershipSettingData"
      "ZoneMembershipSettingData" :IN :OUT
      (:DESCRIPTION
       "A reference to the newly created ZoneMembershipSettingData.")))
    ((:CIM-NAME "CreateZoneMembershipSettingData")
     (:QUALIFIERS
      (:DESCRIPTION
       "CreateZoneMembershipSettingData creates a ZoneMembershipSettingData and adds it to the specified Zone or ZoneAlias by creating a MemberOfCollection association. 

This method might be deprecated in the future in lieu of intrinsics after limitations in the CIM Operations are addressed.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10..0x0FFF" "0x1000..0x7777"
        "0x8000.."))
      (:VALUES
       ("Success" "Not Supported" "Unspecified Error" "Timeout" "Failed"
        "Invalid Parameter" "Access_Denied" "Not_Found" "Already_Exists"
        "Insufficient_Resources" "DMTF_Reserved" "Method_Reserved"
        "Vendor_Reserved")))))
(DEFCIM-METHOD ADDZONE
    ((INSTANCE CIM_ZONESERVICE)
     (ZONESET "CIM_ZoneSet" "ZoneSet" :REQUIRED :IN
      (:DESCRIPTION "A reference to the ZoneSet that the Zone is added to."))
     (ZONE "CIM_Zone" "Zone" :IN
      (:DESCRIPTION
       "A reference to the Zone that is to be added to the ZoneSet.")))
    ((:CIM-NAME "AddZone")
     (:QUALIFIERS
      (:DESCRIPTION
       "Adds to the ZoneSet the specified Zone. Adding a Zone to a ZoneSet, extends the zone enforcement definition of the ZoneSet to include the members of that Zone. If adding the Zone is successful, the Zone should be associated with the ZoneSet by MemberOfCollection. 

This method might be deprecated in the future in lieu of intrinsics after limitations in the CIM Operations are addressed.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10..0x0FFF" "0x1000..0x7777"
        "0x8000.."))
      (:VALUES
       ("Success" "Not Supported" "Unspecified Error" "Timeout" "Failed"
        "Invalid Parameter" "Access_Denied" "Not_Found" "Already_Exists"
        "Insufficient_Resources" "DMTF_Reserved" "Method_Reserved"
        "Vendor_Reserved")))))
(DEFCIM-METHOD ADDZONEMEMBERSHIPSETTINGDATA
    ((INSTANCE CIM_ZONESERVICE)
     (SYSTEMSPECIFICCOLLECTION "CIM_SystemSpecificCollection"
      "SystemSpecificCollection" :REQUIRED :IN
      (:DESCRIPTION
       "A reference to the Zone or ZoneAlias that the ZoneMembershipSettingData is to be added to."))
     (ZONEMEMBERSHIPSETTINGDATA "CIM_ZoneMembershipSettingData"
      "ZoneMembershipSettingData" :IN
      (:DESCRIPTION
       "A reference to the ZoneMembershipSettingData that is to be added to the Zone or ZoneAlias.")))
    ((:CIM-NAME "AddZoneMembershipSettingData")
     (:QUALIFIERS
      (:DESCRIPTION
       "Adds to the Zone or ZoneAlias, the specified ZoneMembershipSettingData. If adding the ZoneMembershipSettingData is successful, an ElementSettingData association will be created between the ZoneMembershipSettingData and either the Zone or ZoneAlias. 

This method might be deprecated in the future in lieu of intrinsics after limitations in the CIM Operations are addressed.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10..0x0FFF" "0x1000..0x7777"
        "0x8000.."))
      (:VALUES
       ("Success" "Not Supported" "Unspecified Error" "Timeout" "Failed"
        "Invalid Parameter" "Access_Denied" "Not_Found" "Already_Exists"
        "Insufficient_Resources" "DMTF_Reserved" "Method_Reserved"
        "Vendor_Reserved")))))
(DEFCIM-METHOD ADDZONEALIAS
    ((INSTANCE CIM_ZONESERVICE)
     (ZONE "CIM_Zone" "Zone" :REQUIRED :IN
      (:DESCRIPTION
       "A reference to the Zone that the ZoneAlias is to be added to."))
     (ZONEALIAS "CIM_NamedAddressCollection" "ZoneAlias" :IN
      (:DESCRIPTION
       "A reference to the ZoneAlias that is to be added to the Zone.")))
    ((:CIM-NAME "AddZoneAlias")
     (:QUALIFIERS
      (:DESCRIPTION "Adds to the Zone the specified ZoneAlias. 

This method might be deprecated in the future in lieu of intrinsics after limitations in the CIM Operations are addressed.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10..0x0FFF" "0x1000..0x7777"
        "0x8000.."))
      (:VALUES
       ("Success" "Not Supported" "Unspecified Error" "Timeout" "Failed"
        "Invalid Parameter" "Access_Denied" "Not_Found" "Already_Exists"
        "Insufficient_Resources" "DMTF_Reserved" "Method_Reserved"
        "Vendor_Reserved")))))
(DEFCIM-METHOD ACTIVATEZONESET
    ((INSTANCE CIM_ZONESERVICE)
     (ACTIVATE BOOLEAN "Activate" :REQUIRED :IN
      (:DESCRIPTION
       "Activate indicates whether the references to ZoneSet should be activated (Active=true) or deactivated (Active=false)."))
     (ZONESET "CIM_ZoneSet" "ZoneSet" :REQUIRED :IN
      (:DESCRIPTION "A reference to the ZoneSet to be activated.")))
    ((:CIM-NAME "ActivateZoneSet")
     (:QUALIFIERS
      (:DESCRIPTION
       "Activates the specified ZoneSet. After the ZoneSet is activated, the ZoneSet, associated Zone, ZoneAliases, and ZoneMembershipSettingData instances will have the active flag set to true. 

This method might be deprecated in the future in lieu of intrinsics after limitations in the CIM Operations are addressed.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" "7" "9" "10..0x0FFF" "0x1000..0x7777"
        "0x8000.."))
      (:VALUES
       ("Success" "Not Supported" "Unspecified Error" "Timeout" "Failed"
        "Invalid Parameter" "Access_Denied" "Not_Found"
        "Insufficient_Resources" "DMTF_Reserved" "Method_Reserved"
        "Vendor_Reserved")))))
(DEFCIM-METHOD SESSIONCONTROL
    ((INSTANCE CIM_ZONESERVICE)
     (REQUESTEDSESSIONSTATE UINT16 "RequestedSessionState" :IN
      (:DESCRIPTION
       "RequestedSessionState is an integer enumeration that indicates whether the ZoneService session has been requested to start (value=2), end (value=3), or terminate (value=4).")
      (:VALUE-MAP ("2" "3" "4")) (:VALUES ("Start" "End" "Terminate"))
      (:MODEL-CORRESPONDENCE ("CIM_ZoneService.RequestedSessionState"))))
    ((:CIM-NAME "SessionControl")
     (:QUALIFIERS
      (:DESCRIPTION
       "SessionControl requests that a session start (value=2), end (value=3), or terminate (value=4).")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" "9" "10..0x0FFF" "0x1000..0x7777"
        "0x8000.."))
      (:VALUES
       ("Success" "Not Supported" "Unspecified Error" "Timeout" "Failed"
        "Invalid Parameter" "Access_Denied" "Insufficient_Resources"
        "DMTF_Reserved" "Method_Reserved" "Vendor_Reserved")))))
(DEFCIM-METHOD STARTSERVICE
    ((INSTANCE CIM_ZONESERVICE))
    ((:CIM-NAME "StartService")
     (:QUALIFIERS (:DEPRECATED ("CIM_Service.RequestStateChange"))
      (:DESCRIPTION
       "The StartService method places the Service in the started state. Note that the function of this method overlaps with the RequestedState property. RequestedState was added to the model to maintain a record (such as a persisted value) of the last state request. Invoking the StartService method should set the RequestedState property appropriately. The method returns an integer value of 0 if the Service was successfully started, 1 if the request is not supported, and any other number to indicate an error. In a subclass, the set of possible return codes could be specified using a ValueMap qualifier on the method. The strings to which the ValueMap contents are translated can also be specified in the subclass as a Values array qualifier. 

Note: The semantics of this method overlap with the RequestStateChange method that is inherited from EnabledLogicalElement. This method is maintained because it has been widely implemented, and its simple \"start\" semantics are convenient to use."))))
(DEFCIM-METHOD STOPSERVICE
    ((INSTANCE CIM_ZONESERVICE))
    ((:CIM-NAME "StopService")
     (:QUALIFIERS (:DEPRECATED ("CIM_Service.RequestStateChange"))
      (:DESCRIPTION
       "The StopService method places the Service in the stopped state. Note that the function of this method overlaps with the RequestedState property. RequestedState was added to the model to maintain a record (such as a persisted value) of the last state request. Invoking the StopService method should set the RequestedState property appropriately. The method returns an integer value of 0 if the Service was successfully stopped, 1 if the request is not supported, and any other number to indicate an error. In a subclass, the set of possible return codes could be specified using a ValueMap qualifier on the method. The strings to which the ValueMap contents are translated can also be specified in the subclass as a Values array qualifier. 

Note: The semantics of this method overlap with the RequestStateChange method that is inherited from EnabledLogicalElement. This method is maintained because it has been widely implemented, and its simple \"stop\" semantics are convenient to use."))))
(DEFCIM-METHOD REQUESTSTATECHANGE
    ((INSTANCE CIM_ZONESERVICE)
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