
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CertificateManagementService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CERTIFICATEMANAGEMENTSERVICE
              (CIM_KEYBASEDCREDENTIALMANAGEMENTSERVICE)
              ((SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
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
              (:CIM-NAME "CIM_CertificateManagementService")
              (:QUALIFIERS (:VERSION "2.29.0")
               (:CLASS-CONSTRAINT
                ("/* The constraints below aim to efficiently */  /* represent a singular OctetString. Each of the properties*/  /* is a single encoded string, thus only the first element */  /* needs to be populated. */ inv:self.CreateCertificateSigningRequest.Subject->size()<=1 and self.CreateCertificateSigningRequest.AltSubject->size()<=1 and self.CreateCertificateSigningRequest.CSR->size()=1 and self.CreateSelfSignedCertificate.Subject->size()<=1 and self.CreateSelfSignedCertificate.AltSubject->size()<=1 and self.ImportEncodedCertificates.EncodedCertificates->size()=1 and self.ApplyCRL.EncodedCRL->size()=1 and self.ExportEncodedCertificates.EncodedCertificates->size()=1"))
               (:UML-PACKAGE-PATH "CIM::User::SecurityServices")
               (:DESCRIPTION
                "CIM_CertificateManagementService is used for managing X509 based certificates.")))
(DEFCIM-METHOD CREATECERTIFICATESIGNINGREQUEST
    ((INSTANCE CIM_CERTIFICATEMANAGEMENTSERVICE)
     (SUBJECT STRING "Subject" :IN
      (:DESCRIPTION
       "Subject shall contain information as required by section 4.1.2.6 of RFC 3280 and shall be formatted based on RFC 4514. An example of the value of the Subject parameter could be \"CN=Marshall T. Rose, O=Dover Beach Consulting, L=Santa Clara, ST=California, C=US\".")
      :DN)
     (ALTSUBJECT STRING "AltSubject" :IN
      (:DESCRIPTION
       "Alternate subject identifier for the Certificate as specified by section 4.2.1.8 of RFC 3280."))
     (PUBLICKEYALGORITHM UINT16 "PublicKeyAlgorithm" :IN
      (:DESCRIPTION
       "The PublicKeyAlgorithm specifies the algorithm to be used for the public key.")
      (:VALUE-MAP ("2" "3" "4" ".." "32768..65535"))
      (:VALUES ("RSA" "DSA" "ECDSA" "DMTF Reserved" "Vendor Reserved")))
     (PUBLICKEYSIZE UINT16 "PublicKeySize" :IN
      (:DESCRIPTION
       "The PublicKeySize shall specify the length for the public key in bits.")
      (:P-UNIT "bit"))
     (SIGNATUREALGORITHM UINT16 "SignatureAlgorithm" :IN
      (:DESCRIPTION
       "The SignatureAlgorithm parameter defines the signature algorithm used to sign the CertificateRequestInfo as part of the CSR as defined in RFC 2986. This parameter covers the algorithms specified in the RFC3279.")
      (:VALUE-MAP
       ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16"
        "17" "18" "19" "20..32767" "32768..65535"))
      (:VALUES
       ("Other" "SHA1withDSA" "SHA1withECDSA" "SHA224withECDSA"
        "SHA256withECDSA" "SHA384withECDSA" "SHA512withECDSA"
        "GOST3411withGOST3410" "GOST3411withECGOST3410" "MD2withRSA"
        "MD5withRSA" "SHA1withRSA" "SHA224withRSA" "SHA256withRSA"
        "SHA384withRSA" "SHA512withRSA" "RIPEMD160withRSA" "RIPEMD128withRSA"
        "RIPEMD256withRSA" "DMTF Reserved" "Vendor Reserved")))
     (OUTPUTFORMAT UINT16 "OutputFormat" :REQUIRED :IN
      (:DESCRIPTION
       "The OutputFormat property represents the requested format of the Certificate Signing Request.")
      (:VALUE-MAP ("2" "3" ".." "32768..65535"))
      (:VALUES ("PEM" "DER" "DMTF Reserved" "Vendor Reserved")))
     (PUBLICPRIVATEKEYPAIR "CIM_UnsignedCredential" "PublicPrivateKeyPair" :IN
      (:DESCRIPTION
       "The PublicPrivateKeyPair parameter specifies a reference to an instance of CIM_UnsignedCredential which represents a public private key pair to be utilized by the CSR.The CIM_UnsignedCredential instance PublicKey and PublicKeyEncoding properties shall not be NULL."))
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION
       "Contains a reference to the ConcreteJob created to track the execution initiated by the method invocation. If the method returns 4096 - job started, then the parameter shall not have NULL value."))
     (EXTENDEDKEYUSAGEVALUE (ARRAY STRING) "ExtendedKeyUsageValue" :IN
      (:DESCRIPTION
       "The ExtendedKeyUsageValue indicates one or more purposes for which the certified public key may be used in the type specified by the ExtendedKeyUsageType parameter.")
      (:ARRAYTYPE "Indexed")
      (:MODEL-CORRESPONDENCE
       ("CIM_CertificateManagementService.CreateCertificateSigningRequest.ExtendedKeyUsageType")))
     (EXTENDEDKEYUSAGETYPE (ARRAY UINT16) "ExtendedKeyUsageType" :IN
      (:DESCRIPTION
       "Describes the type for ExtendedKeyUsageValue based on the ASN.1 GeneralName types.")
      (:VALUE-MAP ("1" "2" "3" "4" "5" "6" "7" "8" "9" ".." "32768..65535"))
      (:VALUES
       ("other" "rfc822Name" "dNSName" "x400Address" "directoryName"
        "ediPartyName" "uniformResourceIdentifier" "iPAddress" "registeredID"
        "DMTF Reserved" "Vendor Reserved"))
      (:ARRAYTYPE "Indexed")
      (:MODEL-CORRESPONDENCE
       ("CIM_CertificateManagementService.CreateCertificateSigningRequest.ExtendedKeyUsageValue")))
     (CSR (ARRAY STRING) "CSR" :REQUIRED :IN :OUT
      (:DESCRIPTION
       "The CSR parameter is an output parameter that upon successful exection of this method will contain the formated Certificate Signing Request.Only the first element of the array property shall be populated.")
      :OCTET-STRING))
    ((:CIM-NAME "CreateCertificateSigningRequest")
     (:QUALIFIERS
      (:DESCRIPTION
       "This method is called to request a Certificate Signing Request (CSR) based on the Distinguished Name provided through Subject parameter. The CSR utilizes PKCS#10 structure as defined in RFC2986. If either Subject parameter or AltSubject parameter are NULL, the method shall return 2 (Error Occured). If the PublicPrivateKeyPair parameter is NULL, then 1) PublicKeyAlgorithm shall specify the algorithm to be used for the public key, 2) the PublicKeySize shall specify the length for the public key in bits. If the PublicPrivateKeyPair parameter is NOT NULL then the following requirements shall apply: 1) the PublicKeyAlgorithm shall be NULL, 2) the PublicKeySize shall be NULL, 3) the PublicPrivateKeyPair shall reference an instance of CIM_UnsignedCredential representing the public/ private key pair to be used for the CSR. The OutputFormat parameter shall specify the output format of the CSR. If the OutputFormat parameter has a value that is not equal to any values in the OutputFormatsSupported property on the associated CIM_CertificateManagementCapabilities instance, then the method shall return 2 (Error Occured). Upon the successful execution, the CSR output parameter shall contain the CSR in PKCS#10 structure.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" ".." "4096" "4097..32767" "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported" "Error Occured" "Busy"
        "Invalid Reference" "Invalid Parameter" "Access Denied" "DMTF Reserved"
        "Job Started" "Method Reserved" "Vendor Specified")))))
(DEFCIM-METHOD CREATESELFSIGNEDCERTIFICATE
    ((INSTANCE CIM_CERTIFICATEMANAGEMENTSERVICE)
     (SUBJECT STRING "Subject" :IN
      (:DESCRIPTION
       "Subject shall contain the information as required by section 4.1.2.6 of RFC 3280 and shall be formatted based on RFC 4514. An example of the value of the Subject parameter could be \"CN=Marshall T. Rose, O=Dover Beach Consulting, OU=Sales, L=Santa Clara, ST=California, C=US\".")
      :DN)
     (ALTSUBJECT STRING "AltSubject" :IN
      (:DESCRIPTION
       "Alternate subject identifier for the Certificate as specified by section 4.2.1.8 of RFC 3280."))
     (PUBLICKEYALGORITHM UINT16 "PublicKeyAlgorithm" :IN
      (:DESCRIPTION
       "The PublicKeyAlgorithm specifies the algorithm to be used for the public key.")
      (:VALUE-MAP ("2" "3" "4" ".." "32768..65535"))
      (:VALUES ("RSA" "DSA" "ECDSA" "DMTF Reserved" "Vendor Reserved")))
     (PUBLICKEYSIZE UINT16 "PublicKeySize" :IN
      (:DESCRIPTION
       "The PublicKeySize shall specify the length for the public key in bits. The value shall be of power of 2.")
      (:P-UNIT "bit"))
     (USAGE UINT16 "Usage" :IN
      (:DESCRIPTION
       "The usage of the certificate by the managed element that the certificate is for or is scoped to.")
      (:VALUE-MAP ("2" "3" "4" "6" "7" "8" ".." "32768..65535"))
      (:VALUES
       ("Owned" "Trusted" "Trusted for Authentication"
        "Trusted for Authorization" "Trusted for Authentication/Authorization"
        "Trusted for Third-Party Authentication/Authorization" "DMTF Reserved"
        "Vendor Reserved"))
      (:MODEL-CORRESPONDENCE ("CIM_CredentialContext.Usage")))
     (SIGNATUREALGORITHM UINT16 "SignatureAlgorithm" :IN
      (:DESCRIPTION
       "The SignatureAlgorithm parameter defines the signature algorithm used to sign the TBSCertificate as defined in RFC 3280. This parameter covers the algorithms specified in the RFC3279.")
      (:VALUE-MAP
       ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16"
        "17" "18" "19" "20..32767" "32768..65535"))
      (:VALUES
       ("Other" "SHA1withDSA" "SHA1withECDSA" "SHA224withECDSA"
        "SHA256withECDSA" "SHA384withECDSA" "SHA512withECDSA"
        "GOST3411withGOST3410" "GOST3411withECGOST3410" "MD2withRSA"
        "MD5withRSA" "SHA1withRSA" "SHA224withRSA" "SHA256withRSA"
        "SHA384withRSA" "SHA512withRSA" "RIPEMD160withRSA" "RIPEMD128withRSA"
        "RIPEMD256withRSA" "DMTF Reserved" "Vendor Reserved")))
     (PUBLICPRIVATEKEYPAIR "CIM_UnsignedCredential" "PublicPrivateKeyPair" :IN
      (:DESCRIPTION
       "The PublicPrivateKeyPair parameter specifies a reference to an instance of CIM_UnsignedCredential which represents a public private key pair to be utilized by the newly created selef signed certificate. The PublicKey and PublicKeyEncodingproperties of the instance of CIM_UnsignedCredentialshall be Non-NULL."))
     (KEYSTORE "CIM_Keystore" "Keystore" :IN
      (:DESCRIPTION
       "The Keystore parameter denotes the reference to the instance of CIM_Keystore that represents the key store where the new certificate will be added."))
     (CREDENTIALCONTEXT "CIM_ManagedElement" "CredentialContext" :IN
      (:DESCRIPTION
       "The managed element that represents the user or owner or the scoping element of the certificate. Such managed element could be the web service that owns the certificate or uses it for verification or account that the certificate is scoped to."))
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION
       "Contains a reference to the ConcreteJob created to track the execution initiated by the method invocation. If the method returns 4096 - job started, then the parameter shall not have NULL value."))
     (SELFSIGNEDCERTIFICATE "CIM_X509Certificate" "SelfSignedCertificate" :IN
      :OUT
      (:DESCRIPTION
       "Reference to the newly created instance of CIM_X509Certificate representing the self signed certificate.")))
    ((:CIM-NAME "CreateSelfSignedCertificate")
     (:QUALIFIERS
      (:DESCRIPTION
       "This method is called to generate to generate a self-signed certificate. If either Subject parameter or AltSubject parameter are NULL, the method shall return 2 (Error Occured). If the PublicPrivateKeyPair parameter is NULL, the following numbered requirements shall apply: 1) the PublicKeyAlgorithm shall be non-NULL and specify the algorithm to be used for the public key, 3) the PublicKeySize shall be non-NULL and specify the length for the public key in bits. If the PublicPrivateKeyPair parameter is not NULL, the following numbered requirements shall apply: 1) the PublicKeyAlgorithm shall be NULL, 2) the PublicKeySize shall be NULL, 3) the PublicPrivateKeyPair shall reference an instance of CIM_UnsignedCredential representing the public/ private key pair to be used for the self signed certificate. Upon successful execution the reference to the newly created instance of CIM_X509Certificate shall be returned in the NewCertificate parameter which represents the self-signed certificate with the public/private key pair of the size specified by the KeySize parameter. If the Keystore parameter is not NULL, this instance shall be associated to the instance of CIM_Keystore referenced by the Keystore parameter through CIM_MemberOfCollection association. If the CredentialContext parameter is not NULL, the newly created instance shall be associated with the instance of CIM_ManagedElement referenced by the CredentialContext parameter through CIM_CredentialContext association. If the CredentialContext parameter is NULL, the newly created instance shall not be associated with the instance of CIM_ManagedElement through CIM_CredentialContext association.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" ".." "4096" "4097..32767" "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported" "Error Occured" "Busy"
        "Invalid Reference" "Invalid Parameter" "Access Denied" "DMTF Reserved"
        "Job Started" "Method Reserved" "Vendor Specified")))))
(DEFCIM-METHOD IMPORTENCODEDCERTIFICATES
    ((INSTANCE CIM_CERTIFICATEMANAGEMENTSERVICE)
     (FORMAT UINT16 "Format" :REQUIRED :IN
             (:DESCRIPTION
              "The Format shall specify the format for the encoding that is used by octet string EncodedCertificates parameter.")
             (:VALUE-MAP ("2" "3" "4" "5" ".." "32768..65535"))
             (:VALUES
              ("DER" "PEM" "PKCS7" "PKCS12" "DMTF Reserved"
               "Vendor Reserved")))
     (KEYSTORE "CIM_Keystore" "Keystore" :IN
      (:DESCRIPTION
       "The Keystore parameter denotes the reference to the instance of CIM_Keystore that represents the key store where the new certificate or certificate chain will be added."))
     (CREDENTIALCONTEXT "CIM_ManagedElement" "CredentialContext" :IN
      (:DESCRIPTION
       "The managed element that represents the user or owner or the scoping element of the certificate(s). Such managed element could be the web service that owns the certificate(s) or uses it for verification or account that the certificate is scoped to."))
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION
       "Contains a reference to the ConcreteJob created to track the execution initiated by the method invocation. If the method returns 4096 - job started, then the parameter shall not have NULL value."))
     (ENCODEDCERTIFICATES (ARRAY STRING) "EncodedCertificates" :REQUIRED :IN
      (:DESCRIPTION
       "An array of strings representing octet string of an encoded certificate or certificate chain to be imported. Only the first element of the array property shall be populated, even if a certificate chain is imported.")
      :OCTET-STRING)
     (USAGE (ARRAY UINT16) "Usage" :IN
      (:DESCRIPTION
       "The usage of the certificate by the managed element that the certificate is for or is scoped to. If a certificate chain is imported, the sequence of elements in the Usage array shall correspond to the sequence of the certificates in the EncodedCertificates octet string parameter.")
      (:VALUE-MAP ("2" "3" "4" "6" "7" "8" ".." "32768..65535"))
      (:VALUES
       ("Owned" "Trusted" "Trusted for Authentication"
        "Trusted for Authorization" "Trusted for Authentication/Authorization"
        "Trusted for Third-Party Authentication/Authorization" "DMTF Reserved"
        "Vendor Reserved"))
      (:ARRAYTYPE "Indexed")
      (:MODEL-CORRESPONDENCE
       ("CIM_CredentialContext.Usage"
        "CIM_CertificateManagementService.ImportEncodedCertificates.NewCertificates")))
     (NEWCERTIFICATES "CIM_X509Certificate" "NewCertificates" :REQUIRED :IN
      :OUT
      (:DESCRIPTION
       "Reference to the newly created instance of CIM_X509Certificate representing the imported certificate or certificate chain.")
      (:ARRAYTYPE "Indexed")
      (:MODEL-CORRESPONDENCE
       ("CIM_CertificateManagementService.ImportEncodedCertificates.Usage"))))
    ((:CIM-NAME "ImportEncodedCertificates")
     (:QUALIFIERS
      (:DESCRIPTION
       "This method is called to import a certificate or a certificate chain using the certificate's encoded representation. Upon successful execution the array of references to the instance(s) of CIM_X509Certificate representing the imported certificate or certificate chain shall be returned inside the NewCertificates output parameter. If the Keystore parameter is not NULL, the newly created instance(s) of CIM_X509Certificate shall be associated to the instance of the CIM_Keystore referenced in the Keystore parameter. If the CredentialContext parameter is not NULL, the newly created instance(s) of the CIM_X509Certificate shall be associated to the insatnces of CIM_ManagedElement referenced in the CredentialContext property through the CIM_CredentialContext association. If the CredentialContext parameter is NULL, the newly created instance(s) of the CIM_X509Certificate shall not be associated to the insatnces of CIM_ManagedElement through the CIM_CredentialContext association.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" ".." "4096" "4097..32767" "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported" "Error Occured" "Busy"
        "Invalid Reference" "Invalid Parameter" "Access Denied" "DMTF Reserved"
        "Job Started" "Method Reserved" "Vendor Specified")))))
(DEFCIM-METHOD IMPORTCERTIFICATES
    ((INSTANCE CIM_CERTIFICATEMANAGEMENTSERVICE)
     (KEYSTORE "CIM_Keystore" "Keystore" :IN
      (:DESCRIPTION
       "The Keystore parameter denotes the reference to the instance of CIM_Keystore that represents the key store where the new certificate or certificate chain will be added."))
     (CREDENTIALCONTEXT "CIM_ManagedElement" "CredentialContext" :IN
      (:DESCRIPTION
       "The managed element that represents the user or owner or the scoping element of the certificate(s). Such managed element could be the web service that owns the certificate(s) or uses it for verification or account that the certificate is scoped to."))
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION
       "Contains a reference to the ConcreteJob created to track the execution initiated by the method invocation. If the method returns 4096 - job started, then the parameter shall not have NULL value."))
     (INPUTCERTIFICATES (ARRAY STRING) "InputCertificates" :REQUIRED :IN
      (:DESCRIPTION
       "An array of embedded instance(s) of CIM_X509Certificate that contains the necessary information to import a certificate or a certificate chain.")
      (:EMBEDDED-INSTANCE "CIM_X509Certificate"))
     (USAGE (ARRAY UINT16) "Usage" :IN
      (:DESCRIPTION
       "The usage of the certificate by the managed element that the certificate is for or is scoped to. If a certificate chain is imported, the sequence of elements in the Usage array shall correspond to the sequence of the certificates in the InputCertificates array parameter.")
      (:VALUE-MAP ("2" "3" "4" "6" "7" "8" ".." "32768..65535"))
      (:VALUES
       ("Owned" "Trusted" "Trusted for Authentication"
        "Trusted for Authorization" "Trusted for Authentication/Authorization"
        "Trusted for Third-Party Authentication/Authorization" "DMTF Reserved"
        "Vendor Reserved"))
      (:ARRAYTYPE "Indexed")
      (:MODEL-CORRESPONDENCE
       ("CIM_CredentialContext.Usage"
        "CIM_CertificateManagementService.ImportCertificates.InputCertificates"
        "CIM_CertificateManagementService.ImportCertificates.Usage")))
     (NEWCERTIFICATES "CIM_X509Certificate" "NewCertificates" :REQUIRED :IN
      :OUT
      (:DESCRIPTION
       "Reference to the newly created instance of CIM_X509Certificate representing the imported certificate or certificate chain.")))
    ((:CIM-NAME "ImportCertificates")
     (:QUALIFIERS
      (:DESCRIPTION
       "This method is called to import a certificate or a certificate chain using an array of embedded instance of CIM_X509Certificate. Upon successful execution the array of references to the instance(s) of CIM_X509Certificate representing the imported certificate or certificate chain shall be returned by the NewCertificates output parameter. If the Keystore parameter is not NULL, the newly created instance(s) of CIM_X509Certificate shall be associated to the instance of the CIM_Keystore referenced in the Keystore parameter. If the CredentialContext parameter is not NULL, the newly created instance(s) of the CIM_X509Certificate shall be associated to the insatnces of CIM_ManagedElement referenced in the CredentialContext property through the CIM_CredentialContext association.If the CredentialContext parameter is NULL, the newly created instance(s) of the CIM_X509Certificate shall not be associated to the insatnces of CIM_ManagedElement through the CIM_CredentialContext association.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" ".." "4096" "4097..32767" "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported" "Error Occured" "Busy"
        "Invalid Reference" "Invalid Parameter" "Access Denied" "DMTF Reserved"
        "Job Started" "Method Reserved" "Vendor Specified")))))
(DEFCIM-METHOD EXPORTENCODEDCERTIFICATES
    ((INSTANCE CIM_CERTIFICATEMANAGEMENTSERVICE)
     (FORMAT UINT16 "Format" :REQUIRED :IN
             (:DESCRIPTION
              "The Format parameter specifies the format of the octet string EncodedCertificates parameter.")
             (:VALUE-MAP ("2" "3" "4" "5" ".." "32768..65535"))
             (:VALUES
              ("DER" "Base64" "PKCS7" "PKCS12" "DMTF Reserved"
               "Vendor Reserved")))
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION
       "Contains a reference to the ConcreteJob created to track the execution initiated by the method invocation. If the method returns 4096 - job started, then the parameter shall not have NULL value."))
     (ENCODEDCERTIFICATES (ARRAY STRING) "EncodedCertificates" :REQUIRED :IN
      :OUT
      (:DESCRIPTION
       "An array of strings representing octet string of an exported encoded certificate or certificate chain. Only the first element of the array property shall be populated, even if a certificate chain is exported.")
      :OCTET-STRING)
     (CERTIFICATESTOEXPORT "CIM_X509Certificate" "CertificatesToExport"
      :REQUIRED :IN
      (:DESCRIPTION
       "Reference to the instance(s) of CIM_SignedCredential representing the certificate or certificate chain to be exported.")))
    ((:CIM-NAME "ExportEncodedCertificates")
     (:QUALIFIERS
      (:DESCRIPTION
       "This method is called to export a certificate or a certificate chain using the certificate's encoded representation. Upon successful execution the array of unsigned integers representing octet string of the exported certificate or certificate chain shall be returned inside the EncodedCertificates output parameter based on the encoding specified in the EncodingFormat parameter.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" ".." "4096" "4097..32767" "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported" "Error Occured" "Busy"
        "Invalid Reference" "Invalid Parameter" "Access Denied" "DMTF Reserved"
        "Job Started" "Method Reserved" "Vendor Specified")))))
(DEFCIM-METHOD APPLYCRL
    ((INSTANCE CIM_CERTIFICATEMANAGEMENTSERVICE)
     (FORMAT UINT16 "Format" :REQUIRED :IN
             (:DESCRIPTION
              "The Format shall specify the format for the encoding that is used by octet string EncodedCRL parameter.")
             (:VALUE-MAP ("2" "3" "4" "5" ".." "32768..65535"))
             (:VALUES
              ("DER" "PEM" "PKCS7" "PKCS12" "DMTF Reserved"
               "Vendor Reserved")))
     (KEYSTORE "CIM_Keystore" "Keystore" :IN
      (:DESCRIPTION
       "The Keystore parameter denotes the reference to the instance of CIM_Keystore that represents the key store where the CRL will be applied."))
     (CREDENTIALCONTEXT "CIM_ManagedElement" "CredentialContext" :REQUIRED :IN
      (:DESCRIPTION
       "The managed element that represents the service or the managed element for which the certificates were revoked by the application of the CRL."))
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION
       "Contains a reference to the ConcreteJob created to track the execution initiated by the method invocation. If the method returns 4096 - job started, then the parameter shall not have NULL value."))
     (APPLIEDCRL "CIM_X509CRL" "AppliedCRL" :REQUIRED :IN :OUT
      (:DESCRIPTION
       "Reference to the newly created instance of CIM_X509CRL representing the applied CRL."))
     (ENCODEDCRL (ARRAY STRING) "EncodedCRL" :REQUIRED :IN
      (:DESCRIPTION
       "An array of unsigned integers representing octet string of an encoded CRL to be applied. Only the first element of the array property shall be populated.")
      :OCTET-STRING))
    ((:CIM-NAME "ApplyCRL")
     (:QUALIFIERS
      (:DESCRIPTION
       "This method is called to apply Certificate Revocation List (CRL) using an encoded format. Upon successful execution the references to the instance(s) of CIM_X509CRL representing the applied CRL shall be returned inside the AppliedCRL output parameter. If the Keystore parameter is not NULL, the newly created instance(s) of CIM_X509CRL shall be associated to the instance of the CIM_Keystore referenced in the Keystore parameter. The newly created instance(s) of the CIM_X509CRL shall be associated to the insatnces of CIM_ManagedElement referenced in the CredentialContext property through the CIM_CredentialContext association.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" ".." "4096" "4097..32767" "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported" "Error Occured" "Busy"
        "Invalid Reference" "Invalid Parameter" "Access Denied" "DMTF Reserved"
        "Job Started" "Method Reserved" "Vendor Specified")))))
(DEFCIM-METHOD APPLYDECODEDCRL
    ((INSTANCE CIM_CERTIFICATEMANAGEMENTSERVICE)
     (ISSUER STRING "Issuer" :REQUIRED :IN
      (:DESCRIPTION
       "Issuer represents the information about the issuer of the CRL. The Issuer property shall contain information as required by section 4.1.2.4 of RFC 3280 and shall be formatted based on RFC 4514. An example of the value of the Subject parameter could be \"CN=Marshall T. Rose, O=Dover Beach Consulting, OU=Sales, L=Santa Clara, ST=California, C=US\".")
      :DN)
     (KEYSTORE "CIM_Keystore" "Keystore" :IN
      (:DESCRIPTION
       "The Keystore parameter denotes the reference to the instance of CIM_Keystore that represents the key store where the CRL will be applied."))
     (CREDENTIALCONTEXT "CIM_ManagedElement" "CredentialContext" :REQUIRED :IN
      (:DESCRIPTION
       "The managed element that represents the service or the managed element for which the certificates were revoked by the application of the CRL."))
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION
       "Contains a reference to the ConcreteJob created to track the execution initiated by the method invocation. If the method returns 4096 - job started, then the parameter shall not have NULL value."))
     (APPLIEDCRL "CIM_X509CRL" "AppliedCRL" :REQUIRED :IN :OUT
      (:DESCRIPTION
       "Reference to the newly created instance of CIM_X509CRL representing the applied CRL."))
     (SERIALNUMBERS (ARRAY STRING) "SerialNumbers" :REQUIRED :IN
      (:DESCRIPTION
       "An array of serial numbers of X.509 certificates that are part of CRL.")
      :OCTET-STRING))
    ((:CIM-NAME "ApplyDecodedCRL")
     (:QUALIFIERS
      (:DESCRIPTION
       "This method is called to apply Certificate Revocation List (CRL) using the decoded format. Upon successful execution the references to the instance(s) of CIM_X509CRL representing the applied CRL shall be returned inside the AppliedCRL output parameter. If the Keystore parameter is not NULL, the newly created instance(s) of CIM_X509CRL shall be associated to the instance of the CIM_Keystore referenced in the Keystore parameter. The newly created instance(s) of the CIM_X509CRL shall be associated to the insatnces of CIM_ManagedElement referenced in the CredentialContext property through the CIM_CredentialContext association.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" ".." "4096" "4097..32767" "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported" "Error Occured" "Busy"
        "Invalid Reference" "Invalid Parameter" "Access Denied" "DMTF Reserved"
        "Job Started" "Method Reserved" "Vendor Specified")))))
(DEFCIM-METHOD IMPORTPUBLICPRIVATEKEYPAIR
    ((INSTANCE CIM_CERTIFICATEMANAGEMENTSERVICE)
     (USAGE UINT16 "Usage" :IN
      (:DESCRIPTION
       "The usage of the certificate by the managed element that the certificate is for or is scoped to.")
      (:VALUE-MAP ("2" "3" "4" "6" "7" "8" ".." "32768..65535"))
      (:VALUES
       ("Owned" "Trusted" "Trusted for Authentication"
        "Trusted for Authorization" "Trusted for Authentication/Authorization"
        "Trusted for Third-Party Authentication/Authorization" "DMTF Reserved"
        "Vendor Reserved"))
      (:MODEL-CORRESPONDENCE ("CIM_CredentialContext.Usage")))
     (KEYSTORE "CIM_Keystore" "Keystore" :REQUIRED :IN
      (:DESCRIPTION
       "The reference to the CIM_Keystore instance representing the key store, which the public/private key pair is imported in to."))
     (CREDENTIALCONTEXT "CIM_ManagedElement" "CredentialContext" :IN
      (:DESCRIPTION
       "The managed element that represents the user or owner or the scoping element of the certificate. Such managed element could be the web service that owns the certificate or uses it for verification or account that the certificate is scoped to."))
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION
       "Contains a reference to the ConcreteJob created to track the execution initiated by the method invocation. If method returns 4096 - Job Started, then this parameter shall not be NULL."))
     (PPKPCREDENTIAL "CIM_UnsignedCredential" "PPKPCredential" :REQUIRED :IN
      :OUT
      (:DESCRIPTION
       "The PPKPCredential output parameter references the instance of CIM_UnsignedCredential that represents the public/private key pair."))
     (PUBLICKEY (ARRAY STRING) "PublicKey" :REQUIRED :IN
      (:DESCRIPTION
       "The DER-encoded raw public key.Only the first element of the array property shall be populated.")
      :OCTET-STRING)
     (PRIVATEKEY (ARRAY STRING) "PrivateKey" :REQUIRED :IN
      (:DESCRIPTION
       "The DER-encoded raw private key.Only the first element of the array property shall be populated.")
      :OCTET-STRING))
    ((:CIM-NAME "ImportPublicPrivateKeyPair")
     (:QUALIFIERS
      (:DESCRIPTION
       "This method is called to request an import of public/private key pair. The method is used when assymetric private/public keys are generated elsewhere but are required by the managed system for creation of Certificate Signing Requests (CSRs) or self-signed certificates or any other key based credentials. Upon the successful execution, the PPKPCredential shall be the reference to the CIM_UnsignedCredential instance representing the private/public key pair. The CIM_UnsignedCredential instance shall be associated through CIM_MemberOfCollection association with the instance of CIM_Keystore referenced by the Keystore parameter, and shall be associated through the CIM_AffectsElement association with the method invocation instance of CIM_KeyBasedCredentialManagementService.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" ".." "4096" "4097..32767" "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported" "Error Occured" "Busy"
        "Invalid Reference" "Invalid Parameter" "Access Denied" "DMTF Reserved"
        "Job Started" "Method Reserved" "Vendor Specified")))))
(DEFCIM-METHOD CREATEKEYSTORE
    ((INSTANCE CIM_CERTIFICATEMANAGEMENTSERVICE)
     (KEYSTORE STRING "Keystore" :REQUIRED :IN
      (:DESCRIPTION
       "The Keystore parameter contains the desired CIM_Keystore instance. The embedded instance shall contain the ElementName and Usage properties.")
      (:EMBEDDED-INSTANCE "CIM_Keystore"))
     (OWNINGSYSTEM "CIM_System" "OwningSystem" :REQUIRED :IN
      (:DESCRIPTION
       "The OwningSystem parameter references to the desired CIM_System instance that represents the owning managed system for the keystore."))
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION
       "Contains a reference to the ConcreteJob created to track the execution initiated by the method invocation. If method returns 4096 - Job Started, then this parameter shall not be NULL."))
     (NEWKEYSTORE "CIM_Keystore" "NewKeystore" :REQUIRED :IN :OUT
      (:DESCRIPTION
       "The NewKeystore output parameter references the instance of CIM_Keystore that represents the newly created keystore repository."))
     (KEYSTOREUTILIZERS "CIM_ManagedElement" "KeystoreUtilizers" :IN
      (:DESCRIPTION
       "The KeystoreUtilizers parameter contains an array of references to the instances of ManagedElement that represent the managed element that would utilize the keystore. Such services could be web services or protocol services that utilize the credentials stored in the keystore for the identity verification purposes.")))
    ((:CIM-NAME "CreateKeystore")
     (:QUALIFIERS
      (:DESCRIPTION
       "This method is called to request a creation of a keystore repository to be used for storage of the key based credentials. Upon the successful execution, the NewKeystore parameter shall reference to the newly created instance of CIM_Keystore. The property values of the newly created instance of the CIM_Keystore shall match all the non-null, non-key properties of the Keystore parameter embedded instance. The newly created CIM_Keystore instance shall be associated to the instance CIM_System referenced by the OwningSystem parameter using CIM_OwningCollectionElement association, shall be associated with the CIM_KeyBasedCredentialManagementService instance using the CIM_ServiceAffectsElement association, and shall be associated to the instances of CIM_Service referenced in the KeystoreUtilizers using CIM_Dependency association.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" ".." "4096" "4097..32767" "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported" "Error Occured" "Busy"
        "Invalid Reference" "Invalid Parameter" "Access Denied" "DMTF Reserved"
        "Job Started" "Method Reserved" "Vendor Specified")))))
(DEFCIM-METHOD STARTSERVICE
    ((INSTANCE CIM_CERTIFICATEMANAGEMENTSERVICE))
    ((:CIM-NAME "StartService")
     (:QUALIFIERS (:DEPRECATED ("CIM_Service.RequestStateChange"))
      (:DESCRIPTION
       "The StartService method places the Service in the started state. Note that the function of this method overlaps with the RequestedState property. RequestedState was added to the model to maintain a record (such as a persisted value) of the last state request. Invoking the StartService method should set the RequestedState property appropriately. The method returns an integer value of 0 if the Service was successfully started, 1 if the request is not supported, and any other number to indicate an error. In a subclass, the set of possible return codes could be specified using a ValueMap qualifier on the method. The strings to which the ValueMap contents are translated can also be specified in the subclass as a Values array qualifier. 

Note: The semantics of this method overlap with the RequestStateChange method that is inherited from EnabledLogicalElement. This method is maintained because it has been widely implemented, and its simple \"start\" semantics are convenient to use."))))
(DEFCIM-METHOD STOPSERVICE
    ((INSTANCE CIM_CERTIFICATEMANAGEMENTSERVICE))
    ((:CIM-NAME "StopService")
     (:QUALIFIERS (:DEPRECATED ("CIM_Service.RequestStateChange"))
      (:DESCRIPTION
       "The StopService method places the Service in the stopped state. Note that the function of this method overlaps with the RequestedState property. RequestedState was added to the model to maintain a record (such as a persisted value) of the last state request. Invoking the StopService method should set the RequestedState property appropriately. The method returns an integer value of 0 if the Service was successfully stopped, 1 if the request is not supported, and any other number to indicate an error. In a subclass, the set of possible return codes could be specified using a ValueMap qualifier on the method. The strings to which the ValueMap contents are translated can also be specified in the subclass as a Values array qualifier. 

Note: The semantics of this method overlap with the RequestStateChange method that is inherited from EnabledLogicalElement. This method is maintained because it has been widely implemented, and its simple \"stop\" semantics are convenient to use."))))
(DEFCIM-METHOD REQUESTSTATECHANGE
    ((INSTANCE CIM_CERTIFICATEMANAGEMENTSERVICE)
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