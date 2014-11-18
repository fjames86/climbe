
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SystemIdentification.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SYSTEMIDENTIFICATION (CIM_MANAGEDELEMENT)
              ((SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping System's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_Namespace.SystemCreationClassName"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping System's Name.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_Namespace.SystemName"))
                :INITFORM NIL)
               (OBJECTMANAGERCREATIONCLASSNAME STRING :CIM-NAME
                "ObjectManagerCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The scoping ObjectManager's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_Namespace.ObjectManagerCreationClassName"))
                :INITFORM NIL)
               (OBJECTMANAGERNAME STRING :CIM-NAME "ObjectManagerName"
                :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping ObjectManager's Name.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_Namespace.ObjectManagerName"))
                :INITFORM NIL)
               (NAMESPACECREATIONCLASSNAME STRING :CIM-NAME
                "NamespaceCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "The scoping Namespace's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_Namespace.CreationClassName"))
                :INITFORM NIL)
               (NAMESPACENAME STRING :CIM-NAME "NamespaceName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping Namespace's Name.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_Namespace.Name"))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "A string uniquely identifying the name of the system represented in the Namespace.")
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
                :INITFORM NIL)
               (IDENTIFICATIONFORMATS (ARRAY UINT16) :CIM-NAME
                "IdentificationFormats" :QUALIFIERS
                (:REQUIRED :WRITE
                 (:DESCRIPTION
                  "Enumeration indicating the format of the system identification and/or addressing information.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11"))
                 (:VALUES
                  ("Unknown" "Other" "Short DNS Name"
                   "Fully qualified DNS Name" "Windows Domain Name"
                   "NetWare Server Name" "Unix Hostname"
                   "Globally Unique System Identifier" "IP Address"
                   "Modem Dialup String" "MAC Address" "IPMI Address"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SystemIdentification.IdentificationData"
                   "CIM_SystemIdentification.FormatDescriptions")))
                :INITFORM NIL)
               (FORMATDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "FormatDescriptions" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Strings further describing the format of the system identification information.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SystemIdentification.IdentificationFormats"
                   "CIM_SystemIdentification.IdentificationData")))
                :INITFORM NIL)
               (IDENTIFICATIONDATA (ARRAY STRING) :CIM-NAME
                "IdentificationData" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Strings containing the system identification information. The format is described by the corresponding array item in IdentificationFormats.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SystemIdentification.IdentificationFormats"
                   "CIM_SystemIdentification.FormatDescriptions")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_SystemIdentification")
              (:QUALIFIERS (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Interop")
               (:DESCRIPTION
                "A Namespace may represent data for one or many systems, that are local, remote (different than the system on which the ObjectManager is running) or aggregated. The System Identification class provides enough data to identify the system(s) represented in the Namespace. It is weak to the Namespace.")))