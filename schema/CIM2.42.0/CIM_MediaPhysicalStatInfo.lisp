
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MediaPhysicalStatInfo.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MEDIAPHYSICALSTATINFO (CIM_PHYSICALSTATISTICALINFORMATION)
              ((SCANSUCCESSES UINT64 :CIM-NAME "ScanSuccesses" :QUALIFIERS
                ((:DEPRECATED ("CIM_MediaPhysicalStatData.ScanSuccesses"))
                 (:DESCRIPTION
                  "The number of successful physical label scans.")
                 :COUNTER)
                :INITFORM NIL)
               (SCANFAILURES UINT64 :CIM-NAME "ScanFailures" :QUALIFIERS
                ((:DEPRECATED ("CIM_MediaPhysicalStatData.ScanFailures"))
                 (:DESCRIPTION "The number of failed physical label scans.")
                 :COUNTER)
                :INITFORM NIL)
               (SCANRETRIES UINT64 :CIM-NAME "ScanRetries" :QUALIFIERS
                ((:DEPRECATED ("CIM_MediaPhysicalStatData.ScanRetries"))
                 (:DESCRIPTION "The number of retried physical label scans.")
                 :COUNTER)
                :INITFORM NIL)
               (PICKSUCCESSES UINT64 :CIM-NAME "PickSuccesses" :QUALIFIERS
                ((:DEPRECATED ("CIM_MediaPhysicalStatData.PickSuccesses"))
                 (:DESCRIPTION "The number of successful picks.") :COUNTER)
                :INITFORM NIL)
               (PICKFAILURES UINT64 :CIM-NAME "PickFailures" :QUALIFIERS
                ((:DEPRECATED ("CIM_MediaPhysicalStatData.PickFailures"))
                 (:DESCRIPTION "The number of failed picks.") :COUNTER)
                :INITFORM NIL)
               (PICKRETRIES UINT64 :CIM-NAME "PickRetries" :QUALIFIERS
                ((:DEPRECATED ("CIM_MediaPhysicalStatData.PickRetries"))
                 (:DESCRIPTION "The number of retried picks.") :COUNTER)
                :INITFORM NIL)
               (PUTSUCCESSES UINT64 :CIM-NAME "PutSuccesses" :QUALIFIERS
                ((:DEPRECATED ("CIM_MediaPhysicalStatData.PutSuccesses"))
                 (:DESCRIPTION "The number of successful puts.") :COUNTER)
                :INITFORM NIL)
               (PUTFAILURES UINT64 :CIM-NAME "PutFailures" :QUALIFIERS
                ((:DEPRECATED ("CIM_MediaPhysicalStatData.PutFailures"))
                 (:DESCRIPTION "The number of failed puts.") :COUNTER)
                :INITFORM NIL)
               (PUTRETRIES UINT64 :CIM-NAME "PutRetries" :QUALIFIERS
                ((:DEPRECATED ("CIM_MediaPhysicalStatData.PutRetries"))
                 (:DESCRIPTION "The number of retried puts.") :COUNTER)
                :INITFORM NIL)
               (PHYSICALCREATIONCLASSNAME STRING :CIM-NAME
                "PhysicalCreationClassName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping Element's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_PhysicalElement.CreationClassName"))
                :INITFORM NIL)
               (TAG STRING :CIM-NAME "Tag" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping Element's identifying Tag.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_PhysicalElement.Tag"))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:KEY (:OVERRIDE "Name")
                 (:DESCRIPTION
                  "The Name property, inherited from StatisticalInformation, serves as part of the object key.")
                 (:MAX-LEN "256"))
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
              (:CIM-NAME "CIM_MediaPhysicalStatInfo")
              (:QUALIFIERS (:DEPRECATED ("CIM_MediaPhysicalStatData"))
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Physical::StoragePackage")
               (:DESCRIPTION
                "Statistics related to reading physical labels and picks/puts at a specific StorageMediaLocation, or for a specific piece of PhysicalMedia. Although the same class is used to represent this data, at the instance level the object holds information for the Location (independent of the Media), OR for the Media (independent of its StorageMediaLocation). This class is deprecated in lieu of MediaPhysicalStatData, to take advantage of the simplified key structure defined there.")))
(DEFCIM-METHOD RESETCOUNTER
    ((INSTANCE CIM_MEDIAPHYSICALSTATINFO)
     (SELECTEDCOUNTER UINT16 "SelectedCounter" :IN
      (:DESCRIPTION "The counter to reset.")
      (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9"))
      (:VALUES
       ("All" "Scan Successes" "Scan Failures" "Scan Retries" "Pick Successes"
        "Pick Failures" "Pick Retries" "Put Successes" "Put Failures"
        "Put Retries"))))
    ((:CIM-NAME "ResetCounter")
     (:QUALIFIERS (:DEPRECATED ("CIM_StatisticalData.ResetSelectedStats"))
      (:DESCRIPTION
       "Method to reset the statistical counters. The method takes one parameter as input - an integer indicating which counter to reset. For this input parameter, 0 indicates all, 1-3 reset the scan-related counters, 4-6 reset the 'pick'-related counters, and 7-9 reset the 'put'-related counters. The method returns 0 if successful, 1 if not supported, and any other value if an error occurred. A method is specified so that the Element's instrumentation can also reset its internal processing and counters. The set of possible return codes should be specified in a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' should be specified as a Values array qualifier on the method."))))