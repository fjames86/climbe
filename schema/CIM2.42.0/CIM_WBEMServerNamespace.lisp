
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_WBEMServerNamespace.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_WBEMSERVERNAMESPACE (CIM_MANAGEDELEMENT)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "InstanceID is an optional property that may be used to opaquely and uniquely identify an instance of this class within the scope of the instantiating Namespace. Various subclasses of this class may override this property to make it required, or a key. Such subclasses may also modify the preferred algorithms for ensuring uniqueness that are defined below.
To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> must include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> must not contain a colon (:). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements. If not null and the above \"preferred\" algorithm is not used, the defining entity must assure that the resulting InstanceID is not reused across any InstanceIDs produced by this or other providers for the NameSpace of this instance. 
If not set to null for DMTF-defined instances, the \"preferred\" algorithm must be used with the <OrgID> set to CIM."))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The namespace name. The namespace name shall be unique within the WBEM Server. Note: Namespaces are flat (not hierarchical). If the slash character is used, it is treated as any other character and has no additional meaning."))
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
               (SCHEMAINFORMATION (ARRAY STRING) :CIM-NAME "SchemaInformation"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The information for each schema in this namespace. There should be one instance for each schema in the namespace.")
                 (:EMBEDDED-INSTANCE "CIM_SchemaInformationStructure"))
                :INITFORM NIL))
              (:CIM-NAME "CIM_WBEMServerNamespace")
              (:QUALIFIERS (:VERSION "2.38.0")
               (:UML-PACKAGE-PATH "CIM::Interop::WBEMServer")
               (:DESCRIPTION
                "CIM_WBEMServerNamespace represents a namespace in a WBEM Server. A namespace provides a scope of uniqueness for some types of object. Specifically, the names of class objects and of qualifier type objects shall be unique in a namespace. The compound key of instance objects shall be unique across all instances of the class (not including subclasses) within the namespace.")))