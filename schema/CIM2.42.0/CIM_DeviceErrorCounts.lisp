
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DeviceErrorCounts.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DEVICEERRORCOUNTS (CIM_STATISTICALINFORMATION)
              ((SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "The CreationClassName of the scoping System.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_LogicalDevice.SystemCreationClassName"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The Name of the scoping System.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_LogicalDevice.SystemName"))
                :INITFORM NIL)
               (DEVICECREATIONCLASSNAME STRING :CIM-NAME
                "DeviceCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "The CreationClassName of the scoping Device.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_LogicalDevice.CreationClassName"))
                :INITFORM NIL)
               (DEVICEID STRING :CIM-NAME "DeviceID" :QUALIFIERS
                (:KEY (:DESCRIPTION "The ID of the scoping Device.")
                 (:MAX-LEN "64") (:PROPOGATED "CIM_LogicalDevice.DeviceID"))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:KEY (:OVERRIDE "Name")
                 (:DESCRIPTION
                  "The inherited Name serves as part of the key for the DeviceErrorCounts instance. The object is scoped by the LogicalDevice to which the statistics apply.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (INDETERMINATEERRORCOUNT UINT64 :CIM-NAME
                "IndeterminateErrorCount" :QUALIFIERS
                ((:DESCRIPTION "Count of the indeterminate errors.") :COUNTER)
                :INITFORM NIL)
               (CRITICALERRORCOUNT UINT64 :CIM-NAME "CriticalErrorCount"
                :QUALIFIERS
                ((:DESCRIPTION "Count of the critical errors.") :COUNTER
                 (:MAPPING-STRINGS ("MIF.DMTF|Operational State|006.7")))
                :INITFORM NIL)
               (MAJORERRORCOUNT UINT64 :CIM-NAME "MajorErrorCount" :QUALIFIERS
                ((:DESCRIPTION "Count of the major errors.") :COUNTER
                 (:MAPPING-STRINGS ("MIF.DMTF|Operational State|006.8")))
                :INITFORM NIL)
               (MINORERRORCOUNT UINT64 :CIM-NAME "MinorErrorCount" :QUALIFIERS
                ((:DESCRIPTION "Count of the minor errors.") :COUNTER)
                :INITFORM NIL)
               (WARNINGCOUNT UINT64 :CIM-NAME "WarningCount" :QUALIFIERS
                ((:DESCRIPTION "Count of the warnings.") :COUNTER
                 (:MAPPING-STRINGS ("MIF.DMTF|Operational State|006.9")))
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
              (:CIM-NAME "CIM_DeviceErrorCounts")
              (:QUALIFIERS (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::DeviceElements")
               (:DESCRIPTION
                "DeviceErrorCounts is a statistical class containing error- related counters for a LogicalDevice. The types of errors are defined by CCITT (Rec X.733) and ISO (IEC 10164-4). Note that the CIM_DeviceErrorCountData class uses a simplified naming or identity algorithm as compared to this class. DeviceErrorCounts is not deprecated because its naming algorithm is still in use in various implementations.")))
(DEFCIM-METHOD RESETCOUNTER
    ((INSTANCE CIM_DEVICEERRORCOUNTS)
     (SELECTEDCOUNTER UINT16 "SelectedCounter" :IN
      (:DESCRIPTION "The counter to reset.")
      (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
      (:VALUES
       ("All" "Indeterminate Error Counter" "Critical Error Counter"
        "Major Error Counter" "Minor Error Counter" "Warning Counter"))))
    ((:CIM-NAME "ResetCounter")
     (:QUALIFIERS
      (:DESCRIPTION
       "Method to reset the error and warning counters. The method takes one parameter as input, an integer that indicates which counter to reset. For this input parameter, 0 indicates all, 1 indicates a reset of the indeterminate error counter, 2 the critical error counter, 3 the major error counter, 4 the minor error counter, and 5 the warning counter. The method returns 0 if successful, 1 if not supported, and any other value if an error occurred. A method is specified so that the instrumentation of the LogicalDevice, which tabulates the errors and warnings, can also reset its internal processing and counters. 
In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' can also be specified in the subclass as a Values array qualifier."))))