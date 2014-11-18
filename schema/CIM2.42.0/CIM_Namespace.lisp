
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Namespace.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_NAMESPACE (CIM_MANAGEDELEMENT)
              ((SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping System's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_ObjectManager.SystemCreationClassName"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping System's Name.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_ObjectManager.SystemName"))
                :INITFORM NIL)
               (OBJECTMANAGERCREATIONCLASSNAME STRING :CIM-NAME
                "ObjectManagerCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The scoping ObjectManager's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_ObjectManager.CreationClassName"))
                :INITFORM NIL)
               (OBJECTMANAGERNAME STRING :CIM-NAME "ObjectManagerName"
                :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping ObjectManager's Name.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_ObjectManager.Name"))
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
                  "A string to uniquely identify the Namespace within the ObjectManager.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (CLASSINFO UINT16 :CIM-NAME "ClassInfo" :QUALIFIERS
                ((:DEPRECATED ("CIM_Namespace.ClassType")) :REQUIRED :WRITE
                 (:DESCRIPTION
                  "Enumeration indicating the organization/schema of the Namespace's objects. For example, they may be instances of classes of a specific CIM version.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "200"
                   "201" "202"))
                 (:VALUES
                  ("Unknown" "Other" "CIM 1.0" "CIM 2.0" "CIM 2.1" "CIM 2.2"
                   "CIM 2.3" "CIM 2.4" "CIM 2.5" "CIM 2.6" "CIM 2.7" "CIM 2.8"
                   "DMI Recast" "SNMP Recast" "CMIP Recast"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Namespace.DescriptionOfClassInfo")))
                :INITFORM NIL)
               (DESCRIPTIONOFCLASSINFO STRING :CIM-NAME
                "DescriptionOfClassInfo" :QUALIFIERS
                ((:DEPRECATED ("CIM_Namespace.DescriptionOfClassType")) :WRITE
                 (:DESCRIPTION
                  "A string providing more detail (beyond the general classification in ClassInfo) for the object hierarchy of the Namespace.")
                 (:MODEL-CORRESPONDENCE ("CIM_Namespace.ClassInfo")))
                :INITFORM NIL)
               (CLASSTYPE UINT16 :CIM-NAME "ClassType" :QUALIFIERS
                ((:DEPRECATED ("CIM_SchemaInformationStructure.Name")) :WRITE
                 (:DESCRIPTION
                  "Enumeration indicating the schema of the Namespace's objects. For example, they may be instances of classes of a specific CIM version or a mapping from another standard, such as SNMP. If 'Other' is selected, the DescriptionOfClassType property MUST be populated.")
                 (:VALUE-MAP ("0" "1" "2" "200" "201" "202"))
                 (:VALUES
                  ("Unknown" "Other" "CIM" "DMI Recast" "SNMP Recast"
                   "CMIP Recast"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Namespace.DescriptionOfClassType"
                   "CIM_Namespace.ClassTypeVersion")))
                :INITFORM NIL)
               (CLASSTYPEVERSION STRING :CIM-NAME "ClassTypeVersion"
                :QUALIFIERS
                ((:DEPRECATED ("CIM_SchemaInformationStructure.Version"))
                 :WRITE
                 (:DESCRIPTION
                  "The version of the objects in this namespace. The string representing the version MUST be in the form: 
M + \".\" + N + \".\" + U 
Where: 
M - The major version (in numeric form) 
N - The minor version (in numeric form) 
U - The update (e.g. errata, patch, ..., in numeric form)")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Namespace.DescriptionOfClassType"
                   "CIM_Namespace.ClassType")))
                :INITFORM NIL)
               (DESCRIPTIONOFCLASSTYPE STRING :CIM-NAME
                "DescriptionOfClassType" :QUALIFIERS
                ((:DEPRECATED ("CIM_SchemaInformationStructure.Description"))
                 :WRITE
                 (:DESCRIPTION
                  "A string providing more detail (beyond the general classification in ClassInfo) for the object hierarchy of the Namespace.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Namespace.ClassType"
                   "CIM_Namespace.ClassTypeVersion")))
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
              (:CIM-NAME "CIM_Namespace")
              (:QUALIFIERS (:DEPRECATED ("CIM_SchemaInformationStructure"))
               (:VERSION "2.39.0") (:UML-PACKAGE-PATH "CIM::Interop")
               (:DESCRIPTION
                "Namespace is deprecated. See CIM_WBEMServerNamespace as the replacement for this class.
Namespace provides a domain (in other words, a container), in which the instances [of a class] are guaranteed to be unique per the KEY qualifier definitions. It is named relative to the CIM_ObjectManager implementation that provides such a domain.")))