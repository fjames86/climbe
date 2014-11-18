
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AllocationCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ALLOCATIONCAPABILITIES (CIM_CAPABILITIES)
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
                   "Other Storage Device" "Serial port" "Parallel port"
                   "USB Controller" "Graphics controller"
                   "IEEE 1394 Controller" "Partitionable Unit"
                   "Base Partitionable Unit" "Power" "Cooling Capacity"
                   "Ethernet Switch Port" "Logical Disk" "Storage Volume"
                   "Ethernet Connection" "DMTF reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AllocationCapabilities.OtherResourceType"
                   "CIM_ResourceAllocationSettingData.ResourceType")))
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
                  "A string describing an implementation specific sub-type for this resource. For example, this may be used to distinguish different models of the same resource type."))
                :INITFORM NIL)
               (REQUESTTYPESSUPPORTED UINT16 :CIM-NAME "RequestTypesSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates whether requesting a specific resource is supported 
\"Specific\" -- request can include a request for specific resource 
\"General\" -- request does not include specific resource 
\"Both\" -- both specific and general requests are supported.")
                 (:VALUE-MAP ("0" "2" "3" "4" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("Unknown" "Specific" "General" "Both" "DMTF reserved"
                   "Vendor Reserved")))
                :INITFORM NIL)
               (SHARINGMODE UINT16 :CIM-NAME "SharingMode" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates how access to underlying resource is granted: 
\"Dedicated\" -- exclusive access to underlying resource 
\"Shared\" -- shared use of underlying resource. 
Actual quantity is controlled by min, max size, weights, etc.")
                 (:VALUE-MAP ("0" "1" "2" "3" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("Unknown" "Other" "Dedicated" "Shared" "DMTF reserved"
                   "Vendor Reserved")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "The user friendly name for this instance of Capabilities. In addition, the user friendly name can be used as a index property for a search of query. (Note: Name does not have to be unique within a namespace.)"))
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
               (SUPPORTEDADDSTATES (ARRAY UINT16) :CIM-NAME
                "SupportedAddStates" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the states that the System, to which the resource will be associated via SystemDevice, may be in when a new resource is created.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" ".."
                   "0x8000..0xFFFF"))
                 (:VALUES
                  ("Unknown" "Other" "Enabled" "Disabled" "Shutting Down"
                   "Not Applicable" "Enabled but Offline" "In Test" "Deferred"
                   "Quiesce" "Starting" "Paused" "Suspended" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM NIL)
               (SUPPORTEDREMOVESTATES (ARRAY UINT16) :CIM-NAME
                "SupportedRemoveStates" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the states that the System, to which the resource is associated via SystemDevice, may be in when a the resource is removed .")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" ".."
                   "0x8000..0xFFFF"))
                 (:VALUES
                  ("Unknown" "Other" "Enabled" "Disabled" "Shutting Down"
                   "Not Applicable" "Enabled but Offline" "In Test" "Deferred"
                   "Quiesce" "Starting" "Paused" "Suspended" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_AllocationCapabilities")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Core::Capabilities")
               (:DESCRIPTION
                "CIM_AllocationCapabilities extends the CIM_Capabilities class for the purposes of expressing the resource allocation capabilities of the associated managed element for the allocation of a specific Resource Type. This class describes the supported types of allocations allowed, specific or general, the sharing modes supported for the device, dedicated and or shared and the system states where the addition or removal of the Resource Type is allowed.")))