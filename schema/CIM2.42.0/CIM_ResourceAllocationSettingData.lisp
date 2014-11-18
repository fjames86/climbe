
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ResourceAllocationSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_RESOURCEALLOCATIONSETTINGDATA (CIM_SETTINGDATA)
              ((RESOURCETYPE UINT16 :CIM-NAME "ResourceType" :QUALIFIERS
                ((:DESCRIPTION
                  "The type of resource this allocation setting represents.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26"
                   "27" "28" "29" "30" "31" "32" "33" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("Other" "Computer System" "Processor" "Memory"
                   "IDE Controller" "Parallel SCSI HBA" "FC HBA" "iSCSI HBA"
                   "IB HCA" "Ethernet Adapter" "Other Network Adapter"
                   "I/O Slot" "I/O Device" "Floppy Drive" "CD Drive"
                   "DVD drive" "Disk Drive" "Tape Drive" "Storage Extent"
                   "Other storage device" "Serial port" "Parallel port"
                   "USB Controller" "Graphics controller"
                   "IEEE 1394 Controller" "Partitionable Unit"
                   "Base Partitionable Unit" "Power" "Cooling Capacity"
                   "Ethernet Switch Port" "Logical Disk" "Storage Volume"
                   "Ethernet Connection" "DMTF reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ResourceAllocationSettingData.OtherResourceType"
                   "CIM_ResourceAllocationSettingData.ResourceSubType")))
                :INITFORM NIL)
               (OTHERRESOURCETYPE STRING :CIM-NAME "OtherResourceType"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string that describes the resource type when a well defined value is not available and ResourceType has the value \"Other\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ResourceAllocationSettingData.ResourceType")))
                :INITFORM NIL)
               (RESOURCESUBTYPE STRING :CIM-NAME "ResourceSubType" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing an implementation specific sub-type for this resource. For example, this may be used to distinguish different models of the same resource type.The property value shall conform to this format (in ABNF): vs-type = dmtf-value / other-org-value / legacy-value dmtf-value = \"DMTF:\" defining-org \":\" org-vs-type org-value = defining-org \":\" org-vs-type
Where: dmtf-value: is a property value defined by DMTF and is defined in the description of this property. other-org-value: is a property value defined by a business entity other than DMTF and is not defined in the description of this property. legacy-value: is a property value defined by a business entity other than DMTF and is not defined in the description of this property. These values are permitted but recommended to be deprecated over time. defining-org:
is an identifier for the business entity that defines the virtual system type. It shall include a copyrighted, trademarked, or otherwise unique name that is owned by that business entity. It shall not be \"DMTF\" and shall not contain a colon (:). org-vs-type:
is an identifier for the virtual system type within the defining business entity. It shall be unique within the defining-org. It may use any character allowed for CIM strings, except for the following: U0000-U001F (Unicode C0 controls) U0020 (space), note that the reason is that OVF allows for multiple space-separated vs-type values in this property. U007F (Unicode C0 controls) U0080-U009F (Unicode C1 controls)
If there is a need to structure the value into segments, the segments should be separated with a single colon (:).
The values of this property shall be processed case sensitively. They are intended to be processed programmatically (instead of being a display name) and should be short.
The following DMTF values are defined: DMTF:unknown - the resource sub-type is unknown or cannot be determined
Developers should consult the relevant profile for defined values.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ResourceAllocationSettingData.ResourceType")))
                :INITFORM NIL)
               (POOLID STRING :CIM-NAME "PoolID" :QUALIFIERS
                ((:DESCRIPTION
                  "This property specifies which ResourcePool the resource is currently allocated from, or which ResourcePool the resource will be allocated from when the allocation occurs.")
                 (:MODEL-CORRESPONDENCE ("CIM_ResourcePool.PoolId")))
                :INITFORM NIL)
               (CONSUMERVISIBILITY UINT16 :CIM-NAME "ConsumerVisibility"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Describes the consumers visibility to the allocated resource.
A value of \"Passed-Through\" indicates the underlying or host resource is utilized and passed through to the consumer, possibly using partitioning. At least one item shall be present in the HostResource property. 
A value of \"Virtualized\" indicates the resource is virtualized and may not map directly to an underlying/host resource. Some implementations may support specific assignment for virtualized resources, in which case the host resource(s) are exposed using the HostResource property. 
A value of \"Not represented\" indicates a representation of the resource does not exist within the context of the resource consumer.")
                 (:VALUE-MAP ("0" "2" "3" "4" ".." "32767..65535"))
                 (:VALUES
                  ("Unknown" "Passed-Through" "Virtualized" "Not represented"
                   "DMTF reserved" "Vendor Reserved")))
                :INITFORM NIL)
               (ALLOCATIONUNITS STRING :CIM-NAME "AllocationUnits" :QUALIFIERS
                ((:DESCRIPTION
                  "This property specifies the units of allocation used by the Reservation and Limit properties. For example, when ResourceType=Processor, AllocationUnits may be set to hertz*10^6 or percent. When ResourceType=Memory, AllocationUnits may be set to bytes*10^3. 
It is expected that profiles constrain the units that apply in context of particular resource types.
The value of this property shall be a legal value of the Programmatic Units qualifier as defined in Annex C.1 of DSP0004 V2.5 or later.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ResourceAllocationSettingData.Reservation"
                   "CIM_ResourceAllocationSettingData.Limit"))
                 :IS-P-UNIT)
                :INITFORM NIL)
               (VIRTUALQUANTITY UINT64 :CIM-NAME "VirtualQuantity" :QUALIFIERS
                ((:DESCRIPTION
                  "This property specifies the quantity of resources presented to the consumer. For example, when ResourceType=Processor, this property would reflect the number of discrete Processors presented to the virtual computer system. When ResourceType=Memory, this property could reflect the number of MB reported to the virtual computer system.
The value of the VirtualQuantity property should be expressed in units as defined by the value of the VirtualQuantityUnits property.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ResourceAllocationSettingData.VirtualQuantityUnits")))
                :INITFORM NIL)
               (RESERVATION UINT64 :CIM-NAME "Reservation" :QUALIFIERS
                ((:DESCRIPTION
                  "This property specifies the amount of resource guaranteed to be available for this allocation. On system which support over-commitment of resources, this value is typically used for admission control to prevent an an allocation from being accepted thus preventing starvation.
The value of the Reservation property is expressed in the unit specified by the value of the AllocationUnits property.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ResourceAllocationSettingData.AllocationUnits")))
                :INITFORM NIL)
               (LIMIT UINT64 :CIM-NAME "Limit" :QUALIFIERS
                ((:DESCRIPTION
                  "This property specifies the upper bound, or maximum amount of resource that will be granted for this allocation. For example, a system which supports memory paging may support setting the Limit of a Memory allocation below that of the VirtualQuantity, thus forcing paging to occur for this allocation.
The value of the Limit property is expressed in the unit specified by the value of the AllocationUnits property.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ResourceAllocationSettingData.AllocationUnits")))
                :INITFORM NIL)
               (WEIGHT UINT32 :CIM-NAME "Weight" :QUALIFIERS
                ((:DESCRIPTION
                  "This property specifies a relative priority for this allocation in relation to other allocations from the same ResourcePool. This property has no unit of measure, and is only relevant when compared to other allocations vying for the same host resources."))
                :INITFORM NIL)
               (AUTOMATICALLOCATION BOOLEAN :CIM-NAME "AutomaticAllocation"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property specifies if the resource will be automatically allocated. For example when set to true, when the consuming virtual computer system is powered on, this resource would be allocated. A value of false indicates the resource must be explicitly allocated. For example, the setting may represent removable media (cdrom, floppy, etc.) where at power on time, the media is not present. An explicit operation is required to allocate the resource."))
                :INITFORM NIL)
               (AUTOMATICDEALLOCATION BOOLEAN :CIM-NAME "AutomaticDeallocation"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property specifies if the resource will be automatically de-allocated. For example, when set to true, when the consuming virtual computer system is powered off, this resource would be de-allocated. When set to false, the resource will remain allocated and must be explicitly de-allocated."))
                :INITFORM NIL)
               (PARENT STRING :CIM-NAME "Parent" :QUALIFIERS
                ((:DESCRIPTION
                  "The Parent of the resource. For example, a controller for the current allocation"))
                :INITFORM NIL)
               (ADDRESS STRING :CIM-NAME "Address" :QUALIFIERS
                ((:DESCRIPTION
                  "The address of the resource. For example, the MAC address of a Ethernet port."))
                :INITFORM NIL)
               (MAPPINGBEHAVIOR UINT16 :CIM-NAME "MappingBehavior" :QUALIFIERS
                ((:DESCRIPTION
                  "Specifies how this resource maps to underlying resourcesIf the HostResource array contains any entries, this property reflects how the resource maps to those specific resources.")
                 (:VALUE-MAP ("0" "2" "3" "4" "5" ".." "32767..65535"))
                 (:VALUES
                  ("Unknown" "Not Supported" "Dedicated" "Soft Affinity"
                   "Hard Affinity" "DMTF Reserved" "Vendor Reserved")))
                :INITFORM NIL)
               (ADDRESSONPARENT STRING :CIM-NAME "AddressOnParent" :QUALIFIERS
                ((:DESCRIPTION
                  "Describes the address of this resource in the context of the Parent. The Parent/AddressOnParent properties are used to describe the controller relationship as well the ordering of devices on a controller.For example, if the parent is a PCI Controller, this property would specify the PCI slot of this child device."))
                :INITFORM NIL)
               (VIRTUALQUANTITYUNITS STRING :CIM-NAME "VirtualQuantityUnits"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property specifies the units used by the VirtualQuantity property. For example
- if ResourceType=Processor, the value of the VirtualQuantityUnits property may be set to \"count\", indicating that the value of the VirtualQuantity property is expressed as a count.
- if ResourceType=Memory, the value of the VirtualQuantityUnits property may be set to \"bytes*10^3\", indicating that the value of the VirtualQuantity property is expressed in kilobyte.
It is expected that profiles constrain the units that apply in context of particular resource types.
The value of this property shall be a legal value of the Programmatic Units qualifier as defined in Annex C.1 of DSP0004 V2.5 or later.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ResourceAllocationSettingData.VirtualQuantity"))
                 :IS-P-UNIT)
                :INITFORM "count")
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> must include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> must not contain a colon (:). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements. If the above \"preferred\" algorithm is not used, the defining entity must assure that the resulting InstanceID is not reused across any InstanceIDs produced by this or other providers for the NameSpace of this instance. 
For DMTF-defined instances, the \"preferred\" algorithm must be used with the <OrgID> set to CIM."))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "The user-friendly name for this instance of SettingData. In addition, the user-friendly name can be used as an index property for a search or query. (Note: The name does not have to be unique within a namespace.)"))
                :INITFORM NIL)
               (CHANGEABLETYPE UINT16 :CIM-NAME "ChangeableType" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating the type of setting. 0 \"Not Changeable - Persistent\" indicates the instance of SettingData represents primordial settings and shall not be modifiable. 1 \"Changeable - Transient\" indicates the SettingData represents modifiable settings that are not persisted. Establishing persistent settings from transient settings may be supported. 2 \"Changeable - Persistent\" indicates the SettingData represents a persistent configuration that may be modified. 3 \"Not Changeable - Transient\" indicates the SettingData represents a snapshot of the settings of the associated ManagedElement and is not persistent.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES
                  ("Not Changeable - Persistent" "Changeable - Transient"
                   "Changeable - Persistent" "Not Changeable - Transient")))
                :INITFORM NIL)
               (CONFIGURATIONNAME STRING :CIM-NAME "ConfigurationName"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An instance of CIM_SettingData may correspond to a well-known configuration that exists for an associated CIM_ManagedElement. If the ConfigurationName property is non-NULL, the instance of CIM_SettingData shall correspond to a well-known configuration for a Managed Element, the value of the ConfigurationName property shall be the name of the configuration, and the ChangeableType property shall have the value 0 or 2. A value of NULL for the ConfigurationName property shall mean that the instance of CIM_SettingData does not correspond to a well-known configuration for a Managed Element or that this information is unknown."))
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
               (HOSTRESOURCE (ARRAY STRING) :CIM-NAME "HostResource"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property exposes specific assignment of resources. Each non-null value of the HostResource property shall be formated as a URI per RFC3986.
If this resource is modeled then a value should be a WBEM URI (DSP0207). If the resource is not modeled then see the appropriate profile. 
Profiles may further constrain the type of URI. A NULL value or empty array requests the implementation decide the kind of host resource.
If the virtual resource is mapped to more than oneunderlying resource, this property may be left NULL.
If NULL, the DeviceAllocatedFromPool or ResourceAllocationFromPool associations may be used to determine the pool of host resources this virtual resource may use. If specific assignment is utilized, all underlying resources used by this virtual resource should be listed.The kind of dependency is specified by the ConsumerVisibility and the MappingBehavior properties. Typically the array contains one item, however multiple host resources may be specified. 
A client may set the value(s) to indicate that the requested virtual resource allocation be based on host resources that are identified by element values.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ResourceAllocationSettingData.ConsumerVisibility"
                   "CIM_ResourceAllocationSettingData.MappingBehavior")))
                :INITFORM NIL)
               (CONNECTION (ARRAY STRING) :CIM-NAME "Connection" :QUALIFIERS
                ((:DESCRIPTION
                  "The thing to which this resource is connected. For example, a named network or switch port."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_ResourceAllocationSettingData")
              (:QUALIFIERS (:VERSION "2.24.0")
               (:UML-PACKAGE-PATH "CIM::Core::Resource")
               (:DESCRIPTION
                "The ResourceAllocationSettingData class represents settings specifically related to an allocated resource that are outside the scope of the CIM class typically used to represent the resource itself. These settings include information specific to the allocation that may not be visible to the consumer of the resource itself. For example, a virtual processor may look like a 2 ghz processor to the consumer (virtual computer system), however the virtualization system may use time-slicing to schedule the the virtual processor to only allow it to use 1 ghz.")))