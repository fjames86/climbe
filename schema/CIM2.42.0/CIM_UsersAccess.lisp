
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_UsersAccess.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_USERSACCESS (CIM_USERENTITY)
              ((CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                ((:DEPRECATED ("No value")) :KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                ((:DEPRECATED ("CIM_Identity.ElementName")) :KEY
                 (:DESCRIPTION
                  "The Name property defines the label by which the object is known.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (ELEMENTID STRING :CIM-NAME "ElementID" :QUALIFIERS
                ((:DEPRECATED ("CIM_Identity.InstanceID")) :KEY
                 (:DESCRIPTION
                  "The ElementID property uniquely specifies the ManagedElement object instance that is the user represented by the UsersAccess object instance. The ElementID is formatted similarly to a model path except that the property-value pairs are ordered in alphabetical order (US ASCII lexical order)."))
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
               (BIOMETRIC (ARRAY UINT16) :CIM-NAME "Biometric" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Biometric information used to identify a person. The property value is left null or set to 'N/A' for non-human user or a user not using biometric information for authentication. This property is deprecated as it represents required Credential information and is more correctly modeled as a specific biometric credential.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7" "8"))
                 (:VALUES
                  ("N/A" "Other" "Facial" "Retina" "Mark" "Finger" "Voice"
                   "DNA-RNA" "EEG")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_UsersAccess")
              (:QUALIFIERS (:DEPRECATED ("CIM_Identity")) (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::UsersAccess")
               (:DESCRIPTION
                "The UsersAccess object class is used to specify a 'user' that is permitted access to resources. The ManagedElement that has access to the resources (represented in the model using the ElementAsUser association) may be a person, a service, a service access point or any collection thereof. 

This class is deprecated in lieu of the simpler CIM_Identity abstraction. The UsersAccess class combines credential requirements (in the form of biometric requirements) with the concepts of organizational information (via its position in the inheritance hierarchy), and identity management. These concepts need to be separated to be better understood and managed - hence, the deprecation.")))