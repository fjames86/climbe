
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Slot.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SLOT (CIM_PHYSICALCONNECTOR)
              ((POWEREDON BOOLEAN :CIM-NAME "PoweredOn" :QUALIFIERS
                ((:OVERRIDE "PoweredOn")
                 (:MAPPING-STRINGS ("MIF.DMTF|System Slot|005.13"))
                 (:DESCRIPTION
                  "Boolean that indicates whether the PhysicalElement is powered on (TRUE) or is currently off (FALSE)."))
                :INITFORM NIL)
               (SUPPORTSHOTPLUG BOOLEAN :CIM-NAME "SupportsHotPlug" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether the Slot supports hot-plug of adapter Cards."))
                :INITFORM NIL)
               (HEIGHTALLOWED REAL32 :CIM-NAME "HeightAllowed" :QUALIFIERS
                ((:DESCRIPTION
                  "Maximum height of an adapter Card that can be inserted into the Slot, in inches.")
                 (NIL "Inches") (:P-UNIT "inch"))
                :INITFORM NIL)
               (LENGTHALLOWED REAL32 :CIM-NAME "LengthAllowed" :QUALIFIERS
                ((:DESCRIPTION
                  "Maximum length of an adapter Card that can be inserted into the Slot, in inches.")
                 (NIL "Inches") (:P-UNIT "inch"))
                :INITFORM NIL)
               (MAXDATAWIDTH UINT16 :CIM-NAME "MaxDataWidth" :QUALIFIERS
                ((:DESCRIPTION
                  "Maximum bus width of adapter Cards that can be inserted into this Slot, in bits. If the value is 'unknown', enter 0. If the value is other than 8, 16, 32, 64 or 128, enter 1.")
                 (NIL "Bits") (:VALUE-MAP ("0" "1" "8" "16" "32" "64" "128"))
                 (:MAPPING-STRINGS ("MIF.DMTF|System Slot|005.3"))
                 (:P-UNIT "bit"))
                :INITFORM NIL)
               (THERMALRATING UINT32 :CIM-NAME "ThermalRating" :QUALIFIERS
                ((:DESCRIPTION
                  "Maximum thermal dissipation of the Slot in milliwatts.")
                 (NIL "MilliWatts")
                 (:MAPPING-STRINGS ("MIF.DMTF|System Slot|005.11"))
                 (:P-UNIT "watt * 10^-3"))
                :INITFORM NIL)
               (SPECIALPURPOSE BOOLEAN :CIM-NAME "SpecialPurpose" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating that this Slot is physically unique and may hold special types of hardware, e.g. a graphics processor slot. If set to TRUE, then the property, Special PurposeDescription (a string), should specify the nature of the uniqueness or purpose of the Slot.")
                 (:MODEL-CORRESPONDENCE ("CIM_Slot.PurposeDescription")))
                :INITFORM NIL)
               (PURPOSEDESCRIPTION STRING :CIM-NAME "PurposeDescription"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string describing that this Slot is physically unique and may hold special types of hardware. This property only has meaning when the corresponding boolean property, SpecialPurpose, is set to TRUE.")
                 (:MODEL-CORRESPONDENCE ("CIM_Slot.SpecialPurpose")))
                :INITFORM NIL)
               (NUMBER UINT16 :CIM-NAME "Number" :QUALIFIERS
                ((:DESCRIPTION
                  "The Number property indicates the physical slot number, which can be used as an index into a system slot table, whether or not that slot is physically occupied.")
                 (:MAPPING-STRINGS ("MIF.DMTF|System Slot|005.1")))
                :INITFORM NIL)
               (POWERED BOOLEAN :CIM-NAME "Powered" :QUALIFIERS
                ((:DEPRECATED ("CIM_PhysicalElement.PoweredOn"))
                 (:DESCRIPTION
                  "A boolean indicating whether the Slot is currently powered (TRUE) or not (FALSE).")
                 (:MAPPING-STRINGS ("MIF.DMTF|System Slot|005.13")))
                :INITFORM NIL)
               (OPENSWITCH BOOLEAN :CIM-NAME "OpenSwitch" :QUALIFIERS
                ((:DESCRIPTION
                  "A boolean indicating whether the switch state of the Slot is currently open (TRUE) or closed (FALSE). This switch state determines whether the contents of the Slot can be hot-plugged.")
                 (:MAPPING-STRINGS ("MIF.DMTF|System Slot|005.15")))
                :INITFORM NIL)
               (MAXLINKWIDTH UINT16 :CIM-NAME "MaxLinkWidth" :QUALIFIERS
                ((:DESCRIPTION
                  "Maximum link width of a switching bus type, such as Infiniband and PCI Express. The width is expressed in number of communication lines, or lanes, between port and devices. This property dictates the maximum link width, in lanes, of adapter Cards that can be inserted into this Slot. If the value is 'unknown', enter 0.")
                 (:VALUE-MAP ("0" "2" "3" "4" "5" "6" "7" "8" "9.."))
                 (:VALUES
                  ("Unknown" "x1" "x2" "x4" "x8" "x12" "x16" "x32"
                   "DMTF Reserved")))
                :INITFORM NIL)
               (CONNECTORPINOUT STRING :CIM-NAME "ConnectorPinout" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string describing the pin configuration and/or signal usage of a PhysicalConnector.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PhysicalConnector.NumPhysicalPins")))
                :INITFORM NIL)
               (OTHERTYPEDESCRIPTION STRING :CIM-NAME "OtherTypeDescription"
                :QUALIFIERS
                ((:DEPRECATED ("CIM_PhysicalConnector.ConnectorDescription"))
                 (:DESCRIPTION
                  "A string describing the Connector - used when the ConnectorType property is set to 1 (\"Other\"). OtherType Description should be set to NULL when ConnectorType is any value other than 1. 
The use of this property is deprecated in lieu of Connector Description.")
                 (:MAPPING-STRINGS ("MIF.DMTF|Bus Port|004.11"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PhysicalConnector.ConnectorType")))
                :INITFORM NIL)
               (CONNECTORGENDER UINT16 :CIM-NAME "ConnectorGender" :QUALIFIERS
                ((:DESCRIPTION "Describes the gender of the connector.")
                 (:VALUE-MAP ("0" "2" "3"))
                 (:VALUES ("Unknown" "Male" "Female")))
                :INITFORM NIL)
               (NUMPHYSICALPINS UINT32 :CIM-NAME "NumPhysicalPins" :QUALIFIERS
                ((:DESCRIPTION
                  "Describes the number of physical pins (male/female) that are present on this connector.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PhysicalConnector.ConnectorPinout")))
                :INITFORM NIL)
               (CONNECTORLAYOUT UINT16 :CIM-NAME "ConnectorLayout" :QUALIFIERS
                ((:DESCRIPTION
                  "Describes the type of packaging normally associated with this type of connector.16 (PCI) - describes the generic PCI connector layout. 17 (PCI-X) - describes the PCI Extended connector layout. 18 (PCI-E) - describes the PCI Express connector layout, where the actual layout as far as the length is concerned is unknown. 19 - 25 (PCI-E xN) - describes the PCI Express connector layout, where N is the lane count that appropriately descirbes the length of the PCI-E connector.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25"
                   "26..32567" "32568..65535"))
                 (:VALUES
                  ("Unknown" "Other" "RS232" "BNC" "RJ11" "RJ45" "DB9" "Slot"
                   "SCSI High Density" "SCSI Low Density" "Ribbon" "AUI"
                   "Fiber SC" "Fiber ST" "FDDI-MIC" "Fiber-RTMJ" "PCI" "PCI-X"
                   "PCI-E" "PCI-E x1" "PCI-E x2" "PCI-E x4" "PCI-E x8"
                   "PCI-E x16" "PCI-E x32" "PCI-E x64" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PhysicalConnector.ConnectorDescription")))
                :INITFORM NIL)
               (CONNECTORDESCRIPTION STRING :CIM-NAME "ConnectorDescription"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the Connector - used when the ConnectorLayout property is set to 1 (\"Other\"). Connector Description should be set to NULL when ConnectorLayout is any value other than 1.")
                 (:MAPPING-STRINGS ("MIF.DMTF|Bus Port|004.11"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PhysicalConnector.ConnectorLayout")))
                :INITFORM NIL)
               (TAG STRING :CIM-NAME "Tag" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "An arbitrary string that uniquely identifies the Physical Element and serves as the key of the Element. The Tag property can contain information such as asset tag or serial number data. The key for PhysicalElement is placed very high in the object hierarchy in order to independently identify the hardware or entity, regardless of physical placement in or on Cabinets, Adapters, and so on. For example, a hotswappable or removable component can be taken from its containing (scoping) Package and be temporarily unused. The object still continues to exist and can even be inserted into a different scoping container. Therefore, the key for Physical Element is an arbitrary string and is defined independently of any placement or location-oriented hierarchy.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:OVERRIDE "Description")
                 (:DESCRIPTION "A textual description of the PhysicalElement.")
                 (:MAPPING-STRINGS ("MIF.DMTF|FRU|003.3")))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                ((:OVERRIDE "ElementName")
                 (:MAPPING-STRINGS ("MIB.IETF|Entity-MIB.entPhysicalName"))
                 (:DESCRIPTION
                  "A user-friendly name for the object. This property allows each instance to define a user-friendly name in addition to its key properties, identity data, and description information. 
Note that the Name property of ManagedSystemElement is also defined as a user-friendly name. But, it is often subclassed to be a Key. It is not reasonable that the same property can convey both identity and a user-friendly name, without inconsistencies. Where Name exists and is not a Key (such as for instances of LogicalDevice), the same information can be present in both the Name and ElementName properties. Note that if there is an associated instance of CIM_EnabledLogicalElementCapabilities, restrictions on this properties may exist as defined in ElementNameMask and MaxElementNameLen properties defined in that class."))
                :INITFORM NIL)
               (MANUFACTURER STRING :CIM-NAME "Manufacturer" :QUALIFIERS
                ((:DESCRIPTION
                  "The name of the organization responsible for producing the PhysicalElement. This organization might be the entity from whom the Element is purchased, but this is not necessarily true. The latter information is contained in the Vendor property of CIM_Product.")
                 (:MAX-LEN "256")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Entity-MIB.entPhysicalMfgName"
                   "MIF.DMTF|FRU|003.4")))
                :INITFORM NIL)
               (MODEL STRING :CIM-NAME "Model" :QUALIFIERS
                ((:DESCRIPTION
                  "The name by which the PhysicalElement is generally known.")
                 (:MAX-LEN "256")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Entity-MIB.entPhysicalDescr"
                   "MIF.DMTF|FRU|003.5")))
                :INITFORM NIL)
               (SKU STRING :CIM-NAME "SKU" :QUALIFIERS
                ((:DESCRIPTION
                  "The stock-keeping unit number for this PhysicalElement.")
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (SERIALNUMBER STRING :CIM-NAME "SerialNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "A manufacturer-allocated number used to identify the Physical Element.")
                 (:MAX-LEN "256")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Entity-MIB.entPhysicalSerialNum"
                   "MIF.DMTF|FRU|003.7")))
                :INITFORM NIL)
               (VERSION STRING :CIM-NAME "Version" :QUALIFIERS
                ((:DESCRIPTION
                  "A string that indicates the version of the PhysicalElement.")
                 (:MAX-LEN "64")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Entity-MIB.entPhysicalHardwareRev"
                   "MIF.DMTF|FRU|003.8")))
                :INITFORM NIL)
               (PARTNUMBER STRING :CIM-NAME "PartNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "The part number assigned by the organization that is responsible for producing or manufacturing the PhysicalElement.")
                 (:MAX-LEN "256")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Entity-MIB.entPhysicalModelName")))
                :INITFORM NIL)
               (OTHERIDENTIFYINGINFO STRING :CIM-NAME "OtherIdentifyingInfo"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "OtherIdentifyingInfo captures data in addition to Tag information. This information could be used to identify a Physical Element. One example is bar code data associated with an Element that also has an asset tag. Note that if only bar code data is available and is unique or able to be used as an Element key, this property would be null and the bar code data would be used as the class key, in the Tag property.")
                 (:MAPPING-STRINGS ("MIB.IETF|Entity-MIB.entPhysicalAlias")))
                :INITFORM NIL)
               (MANUFACTUREDATE DATETIME :CIM-NAME "ManufactureDate"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The date that this PhysicalElement was manufactured."))
                :INITFORM NIL)
               (VENDOREQUIPMENTTYPE STRING :CIM-NAME "VendorEquipmentType"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A vendor-specific hardware type for the PhysicalElement. It describes the specific equipment type for the element, as defined by the vendor or manufacturer.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Entity-MIB.entPhysicalVendorType")))
                :INITFORM NIL)
               (USERTRACKING STRING :CIM-NAME "UserTracking" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "User-assigned and writeable asset-tracking identifier for the PhysicalElement.")
                 (:MAPPING-STRINGS ("MIB.IETF|Entity-MIB.entPhysicalAssetID")))
                :INITFORM NIL)
               (CANBEFRUED BOOLEAN :CIM-NAME "CanBeFRUed" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean that indicates whether this PhysicalElement can be FRUed (TRUE) or not (FALSE).")
                 (:MAPPING-STRINGS ("MIB.IETF|Entity-MIB.entPhysicalIsFRU")))
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
               (CONNECTORTYPE (ARRAY UINT16) :CIM-NAME "ConnectorType"
                :QUALIFIERS
                ((:OVERRIDE "ConnectorType")
                 (:MAPPING-STRINGS ("MIF.DMTF|System Slot|005.2"))
                 (:DESCRIPTION
                  "An array of integers defining the type of PhysicalConnector. An array is specified to allow the description of 'combinations' of Connector information. For example, one array entry could specify RS-232 (value=25), another DB-25 (value=23) and a third entry define the Connector as \"Male\" (value=2). 
This single property is being deprecated in lieu of using separate properties to describe the various aspects of the connector. The separation allows for a more generic means of describing the connectors. Obsolete connectors were intentionally removed from the new list.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25"
                   "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37"
                   "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49"
                   "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61"
                   "62" "63" "64" "65" "66" "67" "68" "69" "70" "71" "72" "73"
                   "74" "75" "76" "77" "78" "79" "80" "81" "82" "83" "84" "85"
                   "86" "87" "88" "89" "90" "91" "92" "93" "94" "95" "96" "97"
                   "98" "99" "100" "101" "102" "103" "104" "105" "106" "107"
                   "108" "109" "110" "111" "112" "113" "114" "115" "116" "117"
                   "118" "119" "120" "121" "122"))
                 (:VALUES
                  ("Unknown" "Other" "Male" "Female" "Shielded" "Unshielded"
                   "SCSI (A) High-Density (50 pins)"
                   "SCSI (A) Low-Density (50 pins)"
                   "SCSI (P) High-Density (68 pins)" "SCSI SCA-I (80 pins)"
                   "SCSI SCA-II (80 pins)" "Fibre Channel (DB-9, Copper)"
                   "Fibre Channel (Optical Fibre)"
                   "Fibre Channel SCA-II (40 pins)"
                   "Fibre Channel SCA-II (20 pins)" "Fibre Channel BNC"
                   "ATA 3-1/2 Inch (40 pins)" "ATA 2-1/2 Inch (44 pins)"
                   "ATA-2" "ATA-3" "ATA/66" "DB-9" "DB-15" "DB-25" "DB-36"
                   "RS-232C" "RS-422" "RS-423" "RS-485" "RS-449" "V.35" "X.21"
                   "IEEE-488" "AUI" "UPT Category 3" "UPT Category 4"
                   "UPT Category 5" "BNC" "RJ11" "RJ45" "Fiber MIC" "Apple AUI"
                   "Apple GeoPort" "PCI" "ISA" "EISA" "VESA" "PCMCIA"
                   "PCMCIA Type I" "PCMCIA Type II" "PCMCIA Type III" "ZV Port"
                   "CardBus" "USB" "IEEE 1394" "HIPPI" "HSSDC (6 pins)" "GBIC"
                   "DIN" "Mini-DIN" "Micro-DIN" "PS/2" "Infrared" "HP-HIL"
                   "Access.bus" "NuBus" "Centronics" "Mini-Centronics"
                   "Mini-Centronics Type-14" "Mini-Centronics Type-20"
                   "Mini-Centronics Type-26" "Bus Mouse" "ADB" "AGP" "VME Bus"
                   "VME64" "Proprietary" "Proprietary Processor Card Slot"
                   "Proprietary Memory Card Slot" "Proprietary I/O Riser Slot"
                   "PCI-66MHZ" "AGP2X" "AGP4X" "PC-98" "PC-98-Hireso" "PC-H98"
                   "PC-98Note" "PC-98Full" "SSA SCSI" "Circular"
                   "On Board IDE Connector" "On Board Floppy Connector"
                   "9 Pin Dual Inline" "25 Pin Dual Inline"
                   "50 Pin Dual Inline" "68 Pin Dual Inline"
                   "On Board Sound Connector" "Mini-jack" "PCI-X"
                   "Sbus IEEE 1396-1993 32 bit" "Sbus IEEE 1396-1993 64 bit"
                   "MCA" "GIO" "XIO" "HIO" "NGIO" "PMC" "MTRJ" "VF-45"
                   "Future I/O" "SC" "SG" "Electrical" "Optical" "Ribbon" "GLM"
                   "1x9" "Mini SG" "LC" "HSSC" "VHDCI Shielded (68 pins)"
                   "InfiniBand" "AGP8X"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PhysicalConnector.OtherTypeDescription")))
                :INITFORM NIL)
               (VCCMIXEDVOLTAGESUPPORT (ARRAY UINT16) :CIM-NAME
                "VccMixedVoltageSupport" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of enumerated integers indicating the Vcc voltage supported by this Slot.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES ("Unknown" "Other" "3.3V" "5V"))
                 (:MAPPING-STRINGS ("MIF.DMTF|System Slot|005.9")))
                :INITFORM NIL)
               (VPPMIXEDVOLTAGESUPPORT (ARRAY UINT16) :CIM-NAME
                "VppMixedVoltageSupport" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of enumerated integers indicating the Vpp voltage supported by this Slot.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES ("Unknown" "Other" "3.3V" "5V" "12V"))
                 (:MAPPING-STRINGS ("MIF.DMTF|System Slot|005.10")))
                :INITFORM NIL)
               (VENDORCOMPATIBILITYSTRINGS (ARRAY STRING) :CIM-NAME
                "VendorCompatibilityStrings" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of strings that identify the components that are compatible and can be inserted in a slot. This allows vendors to provide clues to the system administrators by providing sufficient information to request the appropriate hardware that can populate the slot. In order to ensure uniqueness within the NameSpace, each value defined by the vendor for use in the VendorCompatibilityStrings property SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PhysicalPackage.VendorCompatibilityStrings")))
                :INITFORM NIL)
               (CONNECTORELECTRICALCHARACTERISTICS (ARRAY UINT16) :CIM-NAME
                "ConnectorElectricalCharacteristics" :QUALIFIERS
                ((:DESCRIPTION
                  "Describes the electrical characteristic for this connector.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7" "8"))
                 (:VALUES
                  ("Unknown" "Other" "Single Ended" "Differential"
                   "Low Voltage Differential" "Optical" "Copper" "Shielded"
                   "Unshielded"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PhysicalConnector.OtherElectricalCharacteristics")))
                :INITFORM NIL)
               (OTHERELECTRICALCHARACTERISTICS (ARRAY STRING) :CIM-NAME
                "OtherElectricalCharacteristics" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the connector's electrical characteristics - used when the ConnectorElectricalCharacteristics property contains an entry of 1 (Other). OtherElectricalCharacteristics should be set to NULL when ConnectorElectricalCharacteristics does not contain an value of 1.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PhysicalConnector.ConnectorElectricalCharacteristics")))
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
              (:CIM-NAME "CIM_Slot")
              (:QUALIFIERS (:VERSION "2.18.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Connector")
               (:DESCRIPTION
                "The Slot class represents Connectors into which Packages are inserted. For example, a PhysicalPackage that is a DiskDrive may be inserted into an SCA 'Slot'. As another example, a Card (subclass of PhysicalPackage) may be inserted into a 16-, 32-, or 64-bit expansion 'Slot' on a HostingBoard. PCI or PCMCIA Type III Slots are examples of the latter.")))