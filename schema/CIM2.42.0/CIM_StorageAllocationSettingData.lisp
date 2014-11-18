
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_StorageAllocationSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_STORAGEALLOCATIONSETTINGDATA
              (CIM_RESOURCEALLOCATIONSETTINGDATA)
              ((VIRTUALRESOURCEBLOCKSIZE UINT64 :CIM-NAME
                "VirtualResourceBlockSize" :QUALIFIERS
                ((:DESCRIPTION
                  "Size in bytes of the blocks that are presented to the consumer as the result of this storage resource allocation or storage resource allocation request. If the block size is variable, then the maximum block size in bytes should be specified. If the block size is unknown or if a block concept does not apply, then the value 1 shall be used.
NOTE: The use of 1 (and not 0) to indicate that the blocksize is unknown still allows the use of the VirtualQuantity property to convey the size in blocks of size 1).
NOTE: This property is a copy of the CIM_StorageExtent.BlockSize property. See the description of the CIM_StorageExtent.BlockSize property for details.")
                 (:MODEL-CORRESPONDENCE ("CIM_StorageExtent.BlockSize"))
                 (:P-UNIT "byte"))
                :INITFORM NIL)
               (VIRTUALQUANTITY UINT64 :CIM-NAME "VirtualQuantity" :QUALIFIERS
                ((:OVERRIDE "VirtualQuantity")
                 (:DESCRIPTION
                  "Number of blocks that are presented to the consumer. The blocksize is specified by the value of the VirtualResourceBlockSize property.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageExtent.NumberOfBlocks"
                   "CIM_StorageAllocationSettingData.VirtualQuantityUnits")))
                :INITFORM NIL)
               (VIRTUALQUANTITYUNITS STRING :CIM-NAME "VirtualQuantityUnits"
                :QUALIFIERS
                ((:OVERRIDE "VirtualQuantityUnits")
                 (:DESCRIPTION
                  "This property specifies the units used by the VirtualQuantity property. The value shall match \"count(fixed size block)\" | \"byte\".
The default value \"count(fixed size block)\" assumes that the implementation knows a fixed block size and conveys the block size through the value of the VirtualResourceBlockSize property. However, if the VirtualResourceBlockSize property has a value \"1\", this indicates an unknown or variable block size; in this case the value of the VirtualQuantityUnit property should be set to \"byte\", such that the value of the VirtualQuantity property is measured directly in byte.
NOTE: The IsPUnit qualifier already formally restricts the value of this property to be a unit as specified in DMTF DSP0004:2.5.0, Annex C; in addition, the normative text in the description of this property above further constrains the value to match \"byte\" | \"count(fixed size block)\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageAllocationSettingData.VirtualQuantity"))
                 :IS-P-UNIT)
                :INITFORM "count(fixed size block)")
               (ACCESS UINT16 :CIM-NAME "Access" :QUALIFIERS
                ((:DESCRIPTION
                  "Access describes whether the allocated storage extent is 1 (readable), 2 (writeable), or 3 (both).
NOTE: This property is a copy of the CIM_StorageExtent.Access property, except deprecated values. See the description of the CIM_StorageExtent.Access property for details.")
                 (:VALUE-MAP ("0" "1" "2" "3" ".."))
                 (:VALUES
                  ("Unknown" "Readable" "Writeable" "Read/Write Supported"
                   "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_StorageExtent.Access")))
                :INITFORM NIL)
               (HOSTRESOURCEBLOCKSIZE UINT64 :CIM-NAME "HostResourceBlockSize"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Size in bytes of the blocks that are allocated at the host as the result of this storage resource allocation or storage resource allocation request. If the block size is variable, then the maximum block size in bytes should be specified. If the block size is unknown or if a block concept does not apply, then the value 1 shall be used.
NOTE: This property is a copy of the CIM_StorageExtent.BlockSize property. See the description of the CIM_StorageExtent.BlockSize property for details.")
                 (:MODEL-CORRESPONDENCE ("CIM_StorageExtent.BlockSize"))
                 (:P-UNIT "byte"))
                :INITFORM NIL)
               (RESERVATION UINT64 :CIM-NAME "Reservation" :QUALIFIERS
                ((:OVERRIDE "Reservation")
                 (:DESCRIPTION
                  "The amount of blocks that are guaranteed to be available for this storage resource allocation at the host. The blocksize is specified by the value of the HostResourceBlockSize property.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageAllocationSettingData.HostResourceBlockSize")))
                :INITFORM NIL)
               (LIMIT UINT64 :CIM-NAME "Limit" :QUALIFIERS
                ((:OVERRIDE "Limit")
                 (:DESCRIPTION
                  "The maximum amount of blocks that will be granted for this storage resource allocation at the host. The blocksize is specified by the value of the HostResourceBlockSize property.Usually the value this property would reflect a maximum size for the allocated host extent that matches the size of the virtual storage extent presented to the consumer. A value less than that would indicate a situation where a sparsely populated virtual storage extent is expected, where the fill rate is limited by the value of the Limit property.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageAllocationSettingData.HostResourceBlockSize")))
                :INITFORM NIL)
               (HOSTEXTENTSTARTINGADDRESS UINT64 :CIM-NAME
                "HostExtentStartingAddress" :QUALIFIERS
                ((:DESCRIPTION
                  "The HostExtentStartingAddress property identifies the starting address on the host storage extent identified by the value of the HostExtentName property that is used for the allocation of the virtual storage extent.
A value of NULL indicates that there is no direct mapping of the virtual storage extent onto the referenced host storage extent.
NOTE: This property is a copy of the CIM_BasedOn.StartingAddess property. See the description of CIM_BasedOn association for details.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageAllocationSettingData.HostResourceBlockSize"
                   "CIM_BasedOn.StartingAddress")))
                :INITFORM NIL)
               (HOSTEXTENTNAME STRING :CIM-NAME "HostExtentName" :QUALIFIERS
                ((:DESCRIPTION
                  "A unique identifier for the host extent. The identified host extent is used for the storage resource allocation.
NOTE: This property is a copy of the CIM_StorageExtent.Name property. See the description of CIM_StorageExtent.Name property for details.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageAllocationSettingData.HostExtentNameFormat"
                   "CIM_StorageAllocationSettingData.HostExtentNameNamespace"
                   "CIM_StorageExtent.Name")))
                :INITFORM NIL)
               (HOSTEXTENTNAMEFORMAT UINT16 :CIM-NAME "HostExtentNameFormat"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The HostExtentNameFormat property identifies the format that is used for the value of the HostExtentName property.
NOTE: This property is a copy of the CIM_StorageExtent.NameFormat property, excluding deprecated values. See the description of CIM_StorageExtent.NameFormat class for details.
7 = Serial Number/Vendor/Model (SNVM) SNVM is 3 strings representing the vendor name, product name within the vendor namespace, and the serial number within the model namespace. Strings are delimited with a '+'. Spaces may be included and are significant. The serial number is the text representation of the serial number in hexadecimal upper case. This represents the vendor and model ID from SCSI Inquiry data; the vendor field MUST be 8 characters wide and the product field MUST be 16 characters wide. For example, 
'ACME____+SUPER DISK______+124437458' (_ is a space character) 
9 = NAA as a generic format. See 
http://standards.ieee.org/regauth/oui/tutorials/fibrecomp_id.html. Formatted as 16 or 32 unseparated uppercase hex characters (2 per binary byte). For example '21000020372D3C73' 
10 = EUI as a generic format (EUI64) See 
http://standards.ieee.org/regauth/oui/tutorials/EUI64.html. 
Formatted as 16 unseparated uppercase hex characters (2 per binary byte) 
11 = T10 vendor identifier format as returned by SCSI Inquiry VPD page 83, identifier type 1. See T10 SPC-3 specification. This is the 8-byte ASCII vendor ID from the T10 registry followed by a vendor specific ASCII identifier; spaces are permitted. For non SCSI volumes, 'SNVM' may be the most appropriate choice. 12 = OS Device Name (for LogicalDisks). See LogicalDisk Name description for details.")
                 (:VALUE-MAP ("0" "1" "7" "9" "10" "11" "12" ".."))
                 (:VALUES
                  ("Unknown" "Other" "SNVM" "NAA" "EUI64" "T10VID"
                   "OS Device Name" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageAllocationSettingData.HostExtentName"
                   "CIM_StorageAllocationSettingData.OtherHostExtentNameFormat"
                   "CIM_StorageExtent.NameFormat")))
                :INITFORM NIL)
               (OTHERHOSTEXTENTNAMEFORMAT STRING :CIM-NAME
                "OtherHostExtentNameFormat" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the format of the HostExtentName property if the value of the HostExtentNameFormat property is 1 (Other).")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageAllocationSettingData.HostExtentNameFormat")))
                :INITFORM NIL)
               (HOSTEXTENTNAMENAMESPACE UINT16 :CIM-NAME
                "HostExtentNameNamespace" :QUALIFIERS
                ((:DESCRIPTION
                  "If the host extent is a SCSI volume, then the preferred source for SCSI volume names is SCSI VPD Page 83 responses.
NOTE: This property is a copy of the CIM_StorageExtent.NameNamespace property. See the description of CIM_StorageExtent.NameNamespace class for details.
Page 83 returns a list of identifiers for various device elements. The metadata for each identifier includes an Association field, identifiers with association of 0 apply to volumes. Page 83 supports several namespaces specified in the Type field in the identifier metadata. See SCSI SPC-3 specification. 
2 = VPD Page 83, Type 3 NAA (NameFormat SHOULD be NAA) 
3 = VPD Page 83, Type 2 EUI64 (NameFormat EUI) 
4 = VPD Page 83, Type 1 T10 Vendor Identification 
(NameFormat T10) 
Less preferred volume namespaces from other interfaces: 
5 = VPD page 80, Serial number (NameFormat SHOULD be Other) 
6 = FC NodeWWN (NameFormat SHOULD be NAA or EUI) 
7 = Serial Number/Vendor/Model (NameFormat SHOULD be SNVM) cThe preferred namespace for LogigicalDisk names is platform specific device namespace; see LogigicalDIsk Description. 
8 = OS Device Namespace.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7" "8" ".."))
                 (:VALUES
                  ("Unknown" "Other" "VPD83Type3" "VPD83Type2" "VPD83Type1"
                   "VPD80" "NodeWWN" "SNVM" "OS Device Namespace"
                   "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageAllocationSettingData.HostExtentName"
                   "CIM_StorageAllocationSettingData.OtherHostExtentNameNamespace"
                   "CIM_StorageAllocationSettingData.HostExtentNameFormat"
                   "CIM_StorageExtent.NameNamespace")))
                :INITFORM NIL)
               (OTHERHOSTEXTENTNAMENAMESPACE STRING :CIM-NAME
                "OtherHostExtentNameNamespace" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the namespace of the HostExtentName property if the value of the HostExtentNameNamespace matches 1 (Other).")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageAllocationSettingData.HostExtentNameNamespace")))
                :INITFORM NIL)
               (RESOURCETYPE UINT16 :CIM-NAME "ResourceType" :QUALIFIERS
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
              (:CIM-NAME "CIM_StorageAllocationSettingData")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Core::Resource")
               (:DESCRIPTION
                "The CIM_StorageAllocationSettingData class represents settings specifically related to the allocation of virtual storage.")))