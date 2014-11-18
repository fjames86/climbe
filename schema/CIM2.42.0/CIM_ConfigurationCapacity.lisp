
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ConfigurationCapacity.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CONFIGURATIONCAPACITY (CIM_PHYSICALCAPACITY)
              ((NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:KEY (:OVERRIDE "Name")
                 (:DESCRIPTION
                  "The inherited Name serves as a part of the Configuration Capacity object key.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (OBJECTTYPE UINT16 :CIM-NAME "ObjectType" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The type of object (power supply, fan, disk drive, ...) whose capacities are indicated. This information is part of the class' key.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24"
                   "25"))
                 (:VALUES
                  ("Other" "Processors" "Power Supplies" "Fans" "Batteries"
                   "I/O Slots" "Memory Slots" "MediaAccessDevices (Drives)"
                   "StorageMediaLocation Slots"
                   "StorageMediaLocation Magazines"
                   "StorageMediaLocation Panels"
                   "StorageMediaLocation InterLibrary Ports"
                   "StorageMediaLocation Limited Access Ports" "Doors"
                   "MediaTransferDevice Pickers" "MediaTransferDevice Changers"
                   "LabelReaders" "Contained Chassis" "Connected Chassis"
                   "Connected Frames" "Front Side I/O Slots"
                   "Back Side I/O Slots" "Cache Memory" "NVS Memory"
                   "Volatile Memory" "Multi-Purpose"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ConfigurationCapacity.OtherTypeDescription")))
                :INITFORM NIL)
               (OTHERTYPEDESCRIPTION STRING :CIM-NAME "OtherTypeDescription"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the object type - used when the ObjectType property is set to 0 (\"Other\"). OtherType Description should be set to NULL when ObjectType is any value other than 0.")
                 (:MAX-LEN "64")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ConfigurationCapacity.ObjectType")))
                :INITFORM NIL)
               (MINIMUMCAPACITY UINT64 :CIM-NAME "MinimumCapacity" :QUALIFIERS
                ((:DESCRIPTION
                  "Minimum number of Elements of type, ObjectType, that must be installed."))
                :INITFORM NIL)
               (MAXIMUMCAPACITY UINT64 :CIM-NAME "MaximumCapacity" :QUALIFIERS
                ((:DESCRIPTION
                  "Maximum number of Elements of type, ObjectType, that may be installed."))
                :INITFORM NIL)
               (INCREMENT UINT32 :CIM-NAME "Increment" :QUALIFIERS
                ((:DESCRIPTION
                  "Increment in which Elements must be added or removed."))
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
               (VENDORCOMPATIBILITYSTRINGS (ARRAY STRING) :CIM-NAME
                "VendorCompatibilityStrings" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of strings that identifies the compatibility of the elements within the configuration capacity. This allows vendors to provide information to the system administrators by providing sufficient information to request the appropriate hardware that can populate the configuration. In order to ensure uniqueness within the NameSpace, each value defined by the vendor for use in the VendorCompatibilityStrings property SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PhysicalPackage.VendorCompatibilityStrings"
                   "CIM_Slot.VendorCompatibilityStrings")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_ConfigurationCapacity")
              (:QUALIFIERS (:VERSION "2.18.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Misc")
               (:DESCRIPTION
                "ConfigurationCapacity provides information on the minimum and maximum numbers of power supplies, fans, disk drives, etc. that can be connected to or placed on/into a PhysicalElement (and the number that must be connected/added/removed at a time). The PhysicalElement whose configuration is described is identified using the ElementCapacity association, inherited from PhysicalCapacity. The object whose capacities are indicated (ie, the power supply or fan) is identified in the ObjectType and VendorCompatibilityStrings properties of this class. When ObjectType has a value of 25 (Multi-Purpose) then additional description of the object is provided in the VendorCompatibilityStrings property. Since the same min/max configurations can apply to multiple instances, this class is not defined as 'weak'. 
Examples of the use of the ConfigurationCapacity class are to describe that a 'control unit' Chassis may be connected to (at most) 4 other I/O chassis, or to describe what a StorageLibrary's cabinet may contain. Continuing the latter example, a particular StorageLibrary's cabinet might hold a minimum of 3 and a maximum of 9 TapeDrives, and a minimum of 88 and a maximum of 264 StorageMediaLocations (\"Slots\"). This information would be described in two instances of ConfigurationCapacity, both associated to the StorageLibrary's PhysicalPackage. 
This class does NOT represent the tradeoffs that are likely to be required of one resource for another. It simply represents capacities. In the case of the StorageLibrary, there may be only 2 valid configurations - 9 TapeDrives with 88 Slots, or 3 TapeDrives with 264 Slots. This class only conveys that 'up to' 9 Drives and 'up to' 264 slots may be available and are supported.")))