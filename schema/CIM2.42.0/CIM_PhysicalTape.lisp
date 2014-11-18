
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PhysicalTape.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PHYSICALTAPE (CIM_PHYSICALMEDIA)
              ((TAPELENGTH REAL32 :CIM-NAME "TapeLength" :QUALIFIERS
                ((:DESCRIPTION "The physical length of the Tape in feet.")
                 (NIL "Feet") (:P-UNIT "foot"))
                :INITFORM NIL)
               (UNLOADANYWHERE BOOLEAN :CIM-NAME "UnloadAnywhere" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean set to TRUE if the Tape can be unloaded at any position on the Media. It is set to FALSE if the tape must be at a certain position for unload - such as at the beginning of tape (BOT) area, or at mid-tape point for TapeDrives with mid-tape load."))
                :INITFORM NIL)
               (CAPACITY UINT64 :CIM-NAME "Capacity" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of bytes that can be read from or written to a Media. This property is not applicable to \"Hard Copy\" (documentation) or cleaner Media. Data compression should not be assumed, as it would increase the value in this property. For tapes, it should be assumed that no filemarks or blank space areas are recorded on the Media.")
                 (NIL "Bytes") (:P-UNIT "byte"))
                :INITFORM NIL)
               (MEDIATYPE UINT16 :CIM-NAME "MediaType" :QUALIFIERS
                ((:DESCRIPTION
                  "Specifies the type of the PhysicalMedia, as an enumerated integer. The MediaDescription property is used to provide more explicit definition of the Media type, whether it is pre-formatted, compatability features, etc.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25"
                   "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37"
                   "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49"
                   "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61"
                   "62" "63" "64" "65" "66"))
                 (:VALUES
                  ("Unknown" "Other" "Tape Cartridge" "QIC Cartridge"
                   "AIT Cartridge" "DTF Cartridge" "DAT Cartridge"
                   "8mm Tape Cartridge" "19mm Tape Cartridge" "DLT Cartridge"
                   "Half-Inch Magnetic Tape Cartridge" "Cartridge Disk"
                   "JAZ Disk" "ZIP Disk" "SyQuest Disk"
                   "Winchester Removable Disk" "CD-ROM" "CD-ROM/XA" "CD-I"
                   "CD Recordable" "WORM" "Magneto-Optical" "DVD" "DVD-RW+"
                   "DVD-RAM" "DVD-ROM" "DVD-Video" "Divx" "Floppy/Diskette"
                   "Hard Disk" "Memory Card" "Hard Copy" "Clik Disk" "CD-RW"
                   "CD-DA" "CD+" "DVD Recordable" "DVD-RW" "DVD-Audio" "DVD-5"
                   "DVD-9" "DVD-10" "DVD-18" "Magneto-Optical Rewriteable"
                   "Magneto-Optical Write Once"
                   "Magneto-Optical Rewriteable (LIMDOW)"
                   "Phase Change Write Once" "Phase Change Rewriteable"
                   "Phase Change Dual Rewriteable" "Ablative Write Once"
                   "Near Field Recording" "MiniQic" "Travan"
                   "8mm Metal Particle" "8mm Advanced Metal Evaporate" "NCTP"
                   "LTO Ultrium" "LTO Accelis" "9 Track Tape" "18 Track Tape"
                   "36 Track Tape" "Magstar 3590" "Magstar MP" "D2 Tape"
                   "Tape - DST Small" "Tape - DST Medium" "Tape - DST Large"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PhysicalMedia.MediaDescription")))
                :INITFORM NIL)
               (MEDIADESCRIPTION STRING :CIM-NAME "MediaDescription"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Additional detail related to the MediaType enumeration. For example, if value 3 (\"QIC Cartridge\") is specified, this property could indicate whether the tape is wide or 1/4 inch, whether it is pre-formatted, whether it is Travan compatible, etc.")
                 (:MODEL-CORRESPONDENCE ("CIM_PhysicalMedia.MediaType")))
                :INITFORM NIL)
               (WRITEPROTECTON BOOLEAN :CIM-NAME "WriteProtectOn" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean specifying whether the Media is currently write protected by some kind of physical mechanism, such as a protect tab on a floppy diskette."))
                :INITFORM NIL)
               (CLEANERMEDIA BOOLEAN :CIM-NAME "CleanerMedia" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating that the PhysicalMedia is used for cleaning purposes and not data storage."))
                :INITFORM NIL)
               (MEDIASIZE REAL32 :CIM-NAME "MediaSize" :QUALIFIERS
                ((:DESCRIPTION
                  "Size of the Media in inches. For example, '3.5' would be entered for a 3.5 inch disk, or '12' would be entered for a 12 inch optical disk. On the other hand, '0.5' would be defined for a 1/2 inch tape.")
                 (NIL "Inches") (:P-UNIT "inch"))
                :INITFORM NIL)
               (MAXMOUNTS UINT64 :CIM-NAME "MaxMounts" :QUALIFIERS
                ((:DESCRIPTION
                  "For removable Media, the maximum number of times that the Media can be mounted before it should be retired. For cleaner Media, this is the maximum number of Drive cleans that can be performed. For nonremovable Media, such as hard disks, this property is not applicable and should be set to 0."))
                :INITFORM NIL)
               (MOUNTCOUNT UINT64 :CIM-NAME "MountCount" :QUALIFIERS
                ((:DESCRIPTION
                  "For removable or cleaner Media, the number of times that the Media has been mounted for data transfer or to clean a Drive. For nonremovable Media, such as hard disks, this property is not applicable and should be set to 0.")
                 :COUNTER
                 (:MODEL-CORRESPONDENCE ("CIM_PhysicalMedia.MaxMounts")))
                :INITFORM NIL)
               (DUALSIDED BOOLEAN :CIM-NAME "DualSided" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating that the Media has two recording sides (TRUE) or only a single side (FALSE). Examples of dual sided Media include DVD-ROM and some optical disks. Examples of single sided Media are tapes and CD-ROM."))
                :INITFORM NIL)
               (TIMEOFLASTMOUNT DATETIME :CIM-NAME "TimeOfLastMount"
                :QUALIFIERS
                ((:DESCRIPTION
                  "For removable or cleaner Media, the date and time that the Media was last mounted. For nonremovable Media, such as hard disks, this property has no meaning and is not applicable."))
                :INITFORM NIL)
               (TOTALMOUNTTIME UINT64 :CIM-NAME "TotalMountTime" :QUALIFIERS
                ((:DESCRIPTION
                  "For removable or cleaner Media, the total time (in seconds) that the Media has been mounted for data transfer or to clean a Drive. For nonremovable Media, such as hard disks, this property is not applicable and should be set to 0.")
                 (NIL "Seconds") (:P-UNIT "second"))
                :INITFORM NIL)
               (REMOVALCONDITIONS UINT16 :CIM-NAME "RemovalConditions"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The RemovalCapabilites property is used to describe the conditions under which a PhysicalPackage can be removed. Since all PhysicalPackages are not removable, this property defaults to 2, 'Not Applicable'.")
                 (:VALUE-MAP ("0" "2" "3" "4"))
                 (:VALUES
                  ("Unknown" "Not Applicable" "Removable when off"
                   "Removable when on or off")))
                :INITFORM "2")
               (REMOVABLE BOOLEAN :CIM-NAME "Removable" :QUALIFIERS
                ((:DEPRECATED ("CIM_PhysicalComponent.RemovalConditions"))
                 (:DESCRIPTION
                  "The use of this property is being deprecated. Instead RemovalConditions should be used. The RemovalConditions property addresses whether a PhysicalComponent is removable with or without power being applied. 

A PhysicalComponent is Removable if it is designed to be taken in and out of the physical container in which it is normally found, without impairing the function of the overall packaging. A Component can still be Removable if power must be 'off' in order to perform the removal. If power can be 'on' and the Component removed, then the Element is both Removable and HotSwappable. For example, an upgradeable Processor chip is Removable."))
                :INITFORM NIL)
               (REPLACEABLE BOOLEAN :CIM-NAME "Replaceable" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "The use of this property is being deprecated because it is redundant with the FRU class and its associations. A PhysicalComponent is Replaceable if it is possible to replace (FRU or upgrade) the Element with a physically different one. For example, some ComputerSystems allow the main Processor chip to be upgraded to one of a higher clock rating. In this case, the Processor is said to be Replaceable. All Removable Components are inherently Replaceable."))
                :INITFORM NIL)
               (HOTSWAPPABLE BOOLEAN :CIM-NAME "HotSwappable" :QUALIFIERS
                ((:DEPRECATED ("CIM_PhysicalComponent.RemovalConditions"))
                 (:DESCRIPTION
                  "The use of this property is being deprecated. Instead RemovalConditions should be used. The RemovalConditions property addresses whether a PhysicalComponent is removable with or without power being applied. 

A PhysicalComponent is HotSwappable if it is possible to replace the Element with a physically different but equivalent one while the containing Package has power applied to it (ie, is 'on'). For example, a fan Component may be designed to be HotSwappable. All HotSwappable Components are inherently Removable and Replaceable."))
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
               (POWEREDON BOOLEAN :CIM-NAME "PoweredOn" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean that indicates whether the PhysicalElement is powered on (TRUE) or is currently off (FALSE)."))
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
               (PHYSICALLABELS (ARRAY STRING) :CIM-NAME "PhysicalLabels"
                :QUALIFIERS
                ((:DESCRIPTION
                  "One or more strings on 'labels' on the PhysicalMedia. The format of the labels and their state (readable, unreadable, upside-down) are indicated in the LabelFormats and LabelStates array properties.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PhysicalMedia.LabelStates"
                   "CIM_PhysicalMedia.LabelFormats")))
                :INITFORM NIL)
               (LABELSTATES (ARRAY UINT16) :CIM-NAME "LabelStates" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of enumerated integers describing the states of each of the labels on a PhysicalMedia. The Labels themselves are listed in the PhysicalLabels property. Note, each entry of this array is related to the entry in PhysicalLabels that is located at the same index.")
                 (:VALUE-MAP ("0" "1" "2"))
                 (:VALUES ("OK/Readable" "Unreadable" "Upside Down"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE ("CIM_PhysicalMedia.PhysicalLabels")))
                :INITFORM NIL)
               (LABELFORMATS (ARRAY UINT16) :CIM-NAME "LabelFormats"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An array of enumerated integers describing the formats of each of the labels on a PhysicalMedia. The Labels themselves are listed in the PhysicalLabels property. Note, each entry of this array is related to the entry in PhysicalLabels that is located at the same index.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Barcode" "Radio Frequency Identification"
                   "OCR (Optical Character Recognition)"
                   "MICR (Magnetic Ink Character Recognition)"
                   "7 Character Barcode" "9 Character Barcode"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE ("CIM_PhysicalMedia.PhysicalLabels")))
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
              (:CIM-NAME "CIM_PhysicalTape")
              (:QUALIFIERS (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::PhysicalMedia")
               (:DESCRIPTION
                "The PhysicalTape class represents additional data for a Tape Media. Information on the tape length and whether it must be unloaded from BOT are properties of this class.")))