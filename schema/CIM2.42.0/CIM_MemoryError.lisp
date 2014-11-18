
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MemoryError.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MEMORYERROR (CIM_STORAGEERROR)
              ((STARTINGADDRESS UINT64 :CIM-NAME "StartingAddress" :QUALIFIERS
                ((:OVERRIDE "StartingAddress")
                 (:DESCRIPTION
                  "Specifies the address of the memory error. The type of error is described by the ErrorInfo property. If the ErrorInfo property is equal to 3, \"OK\", then this property has no meaning.")
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Memory Device|005.19"
                   "MIF.DMTF|Physical Memory Array|001.14"))
                 :KEY)
                :INITFORM NIL)
               (ERRORINFO UINT16 :CIM-NAME "ErrorInfo" :QUALIFIERS
                ((:DESCRIPTION
                  "An integer enumeration describing the type of error that occurred most recently. For example, single (value=6) or double bit errors (7) can be specified using this property. The values, 12-14, are undefined in the CIM Schema since in DMI, they mix the semantics of the type of error and whether it was correctable or not. The latter is indicated in the property, CorrectableError.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10"))
                 (:VALUES
                  ("Unknown" "Other" "OK" "Bad Read" "Parity Error"
                   "Single-Bit Error" "Double-Bit Error" "Multi-Bit Error"
                   "Nibble Error" "Checksum Error" "CRC Error"))
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Memory Device|005.12"
                   "MIF.DMTF|Physical Memory Array|001.8"))
                 (:MODEL-CORRESPONDENCE ("CIM_Memory.OtherErrorDescription")))
                :INITFORM NIL)
               (OTHERERRORDESCRIPTION STRING :CIM-NAME "OtherErrorDescription"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Free form string providing more information if the Error Type property is set to 1, \"Other\". If not set to 1, this string has no meaning.")
                 (:MODEL-CORRESPONDENCE ("CIM_Memory.ErrorInfo")))
                :INITFORM NIL)
               (CORRECTABLEERROR BOOLEAN :CIM-NAME "CorrectableError"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating that the most recent error was correctable. If the ErrorInfo property is equal to 3, \"OK\", then this property has no meaning.")
                 (:MAPPING-STRINGS ("MIF.DMTF|Physical Memory Array|001.8")))
                :INITFORM NIL)
               (ERRORTIME DATETIME :CIM-NAME "ErrorTime" :QUALIFIERS
                ((:DESCRIPTION
                  "The time that the last memory error occurred. The type of error is described by the ErrorInfo property. If the Error Info property is equal to 3, \"OK\", then this property has no meaning."))
                :INITFORM NIL)
               (ERRORACCESS UINT16 :CIM-NAME "ErrorAccess" :QUALIFIERS
                ((:DESCRIPTION
                  "An integer enumeration indicating the memory access operation that caused the last error. The type of error MUST be described by the ErrorInfo property. If the ErrorInfo property is equal to 3, \"OK\", then this property has no meaning.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES ("Unknown" "Other" "Read" "Write" "Partial Write"))
                 (:MAPPING-STRINGS ("MIF.DMTF|Physical Memory Array|001.10")))
                :INITFORM NIL)
               (ERRORTRANSFERSIZE UINT32 :CIM-NAME "ErrorTransferSize"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The size of the data transfer in bits that caused the last error. 0 indicates no error. If the ErrorInfo property is equal to 3, \"OK\", then this property should be set to 0.")
                 (NIL "Bits")
                 (:MAPPING-STRINGS ("MIF.DMTF|Physical Memory Array|001.11"))
                 (:P-UNIT "bit"))
                :INITFORM NIL)
               (ERRORDATAORDER UINT16 :CIM-NAME "ErrorDataOrder" :QUALIFIERS
                ((:DESCRIPTION
                  "The ordering for data stored in the ErrorData property. \"Least Significant Byte First\" (value=1) or \"Most Significant Byte First\" (2) can be specified. If ErrorTransferSize is 0, then this property has no meaning.")
                 (:VALUE-MAP ("0" "1" "2"))
                 (:VALUES
                  ("Unknown" "Least Significant Byte First"
                   "Most Significant Byte First")))
                :INITFORM NIL)
               (SYSTEMLEVELADDRESS BOOLEAN :CIM-NAME "SystemLevelAddress"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether the address information in the property, ErrorAddress, is a system-level address (TRUE) or a physical address (FALSE). If the ErrorInfo property is equal to 3, \"OK\", then this property has no meaning."))
                :INITFORM NIL)
               (ERRORRESOLUTION UINT64 :CIM-NAME "ErrorResolution" :QUALIFIERS
                ((:DESCRIPTION
                  "Specifies the range, in bytes, to which the last error can be resolved. For example, if error addresses are resolved to bit 11 (ie, on a typical page basis), then errors can be resolved to 4K boundaries and this property is set to 4000. If the ErrorInfo property is equal to 3, \"OK\", then this property has no meaning.")
                 (NIL "Bytes")
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Memory Device|005.21"
                   "MIF.DMTF|Physical Memory Array|001.15"))
                 (:P-UNIT "byte"))
                :INITFORM NIL)
               (SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping System's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_StorageExtent.SystemCreationClassName"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping System's Name.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_StorageExtent.SystemName"))
                :INITFORM NIL)
               (DEVICECREATIONCLASSNAME STRING :CIM-NAME
                "DeviceCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The scoping StorageExtent's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_StorageExtent.CreationClassName"))
                :INITFORM NIL)
               (DEVICEID STRING :CIM-NAME "DeviceID" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping StorageExtent's DeviceID.")
                 (:MAX-LEN "64") (:PROPOGATED "CIM_StorageExtent.DeviceID"))
                :INITFORM NIL)
               (ENDINGADDRESS UINT64 :CIM-NAME "EndingAddress" :QUALIFIERS
                ((:DESCRIPTION "The ending address of the bytes in error."))
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
               (ERRORDATA (ARRAY UINT8) :CIM-NAME "ErrorData" :QUALIFIERS
                ((:DESCRIPTION
                  "Data captured during the last erroneous mebmory access. The data occupies the first n octets of the array necessary to hold the number of bits specified by the ErrorTransferSize property. If ErrorTransferSize is 0, then this property has no meaning.")
                 :OCTET-STRING (:ARRAYTYPE "Indexed")
                 (:MAPPING-STRINGS ("MIF.DMTF|Physical Memory Array|001.12")))
                :INITFORM NIL)
               (ADDITIONALERRORDATA (ARRAY UINT8) :CIM-NAME
                "AdditionalErrorData" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of octets holding additional error information. An example is ECC Syndrome or the return of the check bits if a CRC-based ErrorMethodology is used. In the latter case, if a single bit error is recognized and the CRC algorithm is known, it is possible to determine the exact bit that failed. This type of data (ECC Syndrome, Check Bit or Parity Bit data, or other vendor supplied information) is included in this field. If the ErrorInfo property is equal to 3, \"OK\", then AdditionalErrorData has no meaning.")
                 :OCTET-STRING
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|Memory Device|005.18"
                   "MIF.DMTF|Physical Memory Array|001.13")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_MemoryError")
              (:QUALIFIERS (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Device::Memory")
               (:DESCRIPTION
                "MemoryError defines a memory space that has errors. The Key of the class is the StartingAddress of the bytes in error.")))