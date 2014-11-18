
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_StoragePool.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_STORAGEPOOL (CIM_LOGICALELEMENT)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (POOLID STRING :CIM-NAME "PoolID" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "A unique name in the context of the System that identifies this pool.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (PRIMORDIAL BOOLEAN :CIM-NAME "Primordial" :QUALIFIERS
                ((:DESCRIPTION
                  "If true, \"Primordial\" indicates that this StoragePool is the base from which storage capacity is drawn and returned in the activity of storage management. Being primordial means that this StoragePool shall not be created or deleted by consumers of this model. However, other actions, modeled or not, may affect the characteristics or size of primordial StoragePools. If false, \"Primordial\" indicated that the StoragePool, a concrete Storage Pool, is subject to storage services functions. This distinction is important because higher-level StoragePools may be assembled using the Component or AllocatedFromStoragePool associations. Although the higher-level abstractions can be created and deleted, the most basic, (i.e. primordial), hardware-based StoragePools cannot. They are physically realized as part of the System, or are actually managed by some other System and imported as if they were physically realized."))
                :INITFORM "false")
               (TOTALMANAGEDSPACE UINT64 :CIM-NAME "TotalManagedSpace"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The total amount of capacity usable for the allocation of StorageVolumes, LogicalDisks, or child Storage Pools. 
For primordial Storage Pools, this capacity reflects the usable capacity of Disk Drives or LUNs, for example, to the owning storage device or application. For example, in storage array, a primordial Storage Pool's TotalManagedSpace does not include metadata such as the disk label area and absolute disk drive capacity lost in disk formatting. 
For concrete Storage Pools, the same applies, but the metadata not included in TotalManagedSpace is consumed in virtualization like RAID and concatenation. Concrete Storage Pool may also be simple reserve of capacity. In such a case, no capacity may be lost in formation of the Storage Pool. 
Conceptually TotalManagedSpace is the sum of all storage known via AssociatedComponentExtent associations to underlying StorageExtents. However, note some of these underlying storage may not be modeled by the instrumentation.")
                 (NIL "Bytes")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StoragePool.RemainingManagedSpace")))
                :INITFORM NIL)
               (REMAININGMANAGEDSPACE UINT64 :CIM-NAME "RemainingManagedSpace"
                :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The remaining usable capacity after the allocation of StorageVolumes, LogicalDisks, or child Storage Pools. This property is maintained here to provide efficient access to this information. However, note that it is possible to compute RemainingManagedSpace as (TotalManagedSpace minus the sum of SpaceConsumed from all of the AllocatedFromStoragePool references from this StoragePool). Note that SpaceConsumed remains useful to determine the amount of capacity consumed by a particular allocated element.")
                 (NIL "Bytes")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StoragePool.TotalManagedSpace"
                   "CIM_AllocatedFromStoragePool.SpaceConsumed")))
                :INITFORM NIL)
               (INSTALLDATE DATETIME :CIM-NAME "InstallDate" :QUALIFIERS
                ((:DESCRIPTION
                  "A datetime value that indicates when the object was installed. Lack of a value does not indicate that the object is not installed.")
                 (:MAPPING-STRINGS ("MIF.DMTF|ComponentID|001.5")))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                ((:DESCRIPTION
                  "The Name property defines the label by which the object is known. When subclassed, the Name property can be overridden to be a Key property.")
                 (:MAX-LEN "1024"))
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
              (:CIM-NAME "CIM_StoragePool")
              (:QUALIFIERS (:VERSION "2.19.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageServices")
               (:DESCRIPTION
                "A StoragePool is a conglomeration of storage capacity for the purpose of assignment and allocation based on service characteristics, such as location, available space or other criteria (for example, cost per megabyte or hardware ownership). A StoragePool is managed within the scope of a particular System. StoragePools may consist of component StoragePools or StorageExtents. StorageExtents that belong to the StoragePool have a Component relationship to the StoragePool. StorageExtents/StoragePools that are elements of a pool have their available space aggregated into the pool. StoragePools, StorageVolumes and LogicalDisks may be created from StoragePools. This is indicated by the AllocatedFromStoragePool association. StoragePool is scoped to a system by the HostedStoragePool association.")))
(DEFCIM-METHOD GETSUPPORTEDSIZES
    ((INSTANCE CIM_STORAGEPOOL)
     (ELEMENTTYPE UINT16 "ElementType" :IN
      (:DESCRIPTION
       "The type of element for which supported sizes are reported for.")
      (:VALUE-MAP ("2" "3" "4"))
      (:VALUES ("Storage Pool" "Storage Volume" "Logical Disk")))
     (GOAL "CIM_StorageSetting" "Goal" :IN
      (:DESCRIPTION
       "The StorageSetting for which supported sizes should be reported for."))
     (SIZES (ARRAY UINT64) "Sizes" :IN :OUT
      (:DESCRIPTION
       "List of supported sizes for a Volume/Pool creation or modification.")
      (NIL "Bytes")))
    ((:CIM-NAME "GetSupportedSizes")
     (:QUALIFIERS
      (:DESCRIPTION
       "For pools that support discrete sizes for volume or pool creation, this method can be used to retrieve a list of supported sizes. Note that different pool implementations may support either or both the GetSupportedSizes and GetSupportedSizeRanges methods at different times, depending on Pool configuration. Also note that the advertised sizes may change after the call due to requests from other clients. If the pool currently only supports a range of sizes, then the return value will be set to 1.")
      (:VALUE-MAP ("0" "1" "2"))
      (:VALUES
       ("Method completed OK" "Method not supported"
        "Use GetSupportedSizeRange instead")))))
(DEFCIM-METHOD GETSUPPORTEDSIZERANGE
    ((INSTANCE CIM_STORAGEPOOL)
     (ELEMENTTYPE UINT16 "ElementType" :IN
      (:DESCRIPTION
       "The type of element for which supported size ranges are reported for.")
      (:VALUE-MAP ("2" "3" "4"))
      (:VALUES ("Storage Pool" "Storage Volume" "Logical Disk")))
     (MINIMUMVOLUMESIZE UINT64 "MinimumVolumeSize" :IN :OUT
      (:DESCRIPTION "The minimum size for a volume/pool in bytes.")
      (NIL "Bytes"))
     (MAXIMUMVOLUMESIZE UINT64 "MaximumVolumeSize" :IN :OUT
      (:DESCRIPTION "The maximum size for a volume/pool in bytes.")
      (NIL "Bytes"))
     (VOLUMESIZEDIVISOR UINT64 "VolumeSizeDivisor" :IN :OUT
      (:DESCRIPTION
       "A volume/pool size must be a multiple of this value which is specified in bytes.")
      (NIL "Bytes"))
     (GOAL "CIM_StorageSetting" "Goal" :IN
      (:DESCRIPTION
       "The StorageSetting for which supported size ranges should be reported for.")))
    ((:CIM-NAME "GetSupportedSizeRange")
     (:QUALIFIERS
      (:DESCRIPTION
       "For pools that that support a range of sizes for volume or pool creation, this method can be used to retrieve the supported range. Note that different pool implementations may support either or both the GetSupportedSizes and GetSupportedSizeRanges methods at different times, depending on Pool configuration. Also note that the advertised sizes may change after the call due to requests from other clients. If the pool currently only supports discrete sizes, then the return value will be set to 1.")
      (:VALUE-MAP ("0" "1" "2"))
      (:VALUES
       ("Method completed OK" "Method not supported"
        "Use GetSupportedSizes instead")))))
(DEFCIM-METHOD GETAVAILABLEEXTENTS
    ((INSTANCE CIM_STORAGEPOOL)
     (GOAL "CIM_StorageSetting" "Goal" :IN
      (:DESCRIPTION
       "The StorageSetting (Goal) for which supported extents should be retrieved as available. 
If a NULL is passed for the Goal, the method will return all available extents, regardless of the goal. There exists a possibility of error in creating a Pool, Volume, or LogicalDisk retrieved in this manner."))
     (AVAILABLEEXTENTS "CIM_StorageExtent" "AvailableExtents" :OUT
      (:DESCRIPTION
       "List of references to available StorageExtents, or subclass instances.")))
    ((:CIM-NAME "GetAvailableExtents")
     (:QUALIFIERS
      (:DESCRIPTION
       "This method can be used to retrieve a list of available Extents that may be used in the creation or modification of a StoragePool, StorageVolume, or LogicalDisk. The GetAvailableExtents method MUST return the Extents from the set of Component Extents of the Pool on which the method is being invoked. The returned Extents are available at the time the method returns. There is no guarantee that the same Extents will be available later. This method MUST return the Extents that are not being used as supporting capacity for any other Pools, Volumes, or LogicalDisks that have been allocated from this Pool. The Extent returned MUST be a component Extent of the Pool or subdivisions of a component Extent, the subdivisions themselves represented as Extents.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" ".." "4098..32767" "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported" "Unknown" "Timeout" "Failed"
        "Invalid Parameter" "In Use" "DMTF Reserved" "Method Reserved"
        "Vendor Specific")))))