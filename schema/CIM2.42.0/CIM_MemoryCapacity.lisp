
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MemoryCapacity.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MEMORYCAPACITY (CIM_PHYSICALCAPACITY)
              ((NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:KEY (:OVERRIDE "Name")
                 (:DESCRIPTION
                  "The inherited Name serves as a part of the MemoryCapacity object key.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (MEMORYTYPE UINT16 :CIM-NAME "MemoryType" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The type of memory. This is a part of the object key. Values correspond to the list of possible memory types in the PhysicalMemory class.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25"
                   "26" "27" "28" "29" "30" "31..32567" "32568..65535"))
                 (:VALUES
                  ("Unknown" "Other" "DRAM" "Synchronous DRAM" "Cache DRAM"
                   "EDO" "EDRAM" "VRAM" "SRAM" "RAM" "ROM" "Flash" "EEPROM"
                   "FEPROM" "EPROM" "CDRAM" "3DRAM" "SDRAM" "SGRAM" "RDRAM"
                   "DDR" "DDR2" "BRAM" "FB-DIMM" "DDR3" "FBD2" "DDR4" "LPDDR"
                   "LPDDR2" "LPDDR3" "LPDDR4" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_PhysicalMemory.MemoryType")))
                :INITFORM NIL)
               (MINIMUMMEMORYCAPACITY UINT64 :CIM-NAME "MinimumMemoryCapacity"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Minimum amount of memory, in Kbytes, that is needed for the associated PhysicalElement to operate correctly.")
                 (NIL "KiloBytes") (:P-UNIT "byte * 2^10"))
                :INITFORM NIL)
               (MAXIMUMMEMORYCAPACITY UINT64 :CIM-NAME "MaximumMemoryCapacity"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Maximum amount of memory, in Kbytes, that can be supported by the associated PhysicalElement.")
                 (NIL "KiloBytes") (:P-UNIT "byte * 2^10"))
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
                :INITFORM NIL))
              (:CIM-NAME "CIM_MemoryCapacity")
              (:QUALIFIERS (:VERSION "2.41.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Misc")
               (:DESCRIPTION
                "MemoryCapacity describes the type of Memory that can be installed on a PhysicalElement and its minimum/maximum configurations. Information on what memory is currently 'installed', versus an Element's min/max requirements, is located in instances of the PhysicalMemory class.")))