
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OtherGroupInformation.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_OTHERGROUPINFORMATION (CIM_MANAGEDELEMENT)
              ((CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The Name property defines the label by which the object is known. In the case of an LDAP-derived instance, the Name property value may be set to the distinguished name of the LDAP-accessed object instance.")
                 (:MAX-LEN "1024"))
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
               (OBJECTCLASS (ARRAY STRING) :CIM-NAME "ObjectClass" :QUALIFIERS
                ((:DESCRIPTION
                  "In the case of an LDAP-derived instance, the ObjectClass property value(s) may be set to the objectClass attribute values."))
                :INITFORM NIL)
               (BUSINESSCATEGORY (ARRAY STRING) :CIM-NAME "BusinessCategory"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The BusinessCategory property may be used to describe the kind of business activity performed by the members of the group.")
                 (:MAX-LEN "128"))
                :INITFORM NIL)
               (COMMONNAME (ARRAY STRING) :CIM-NAME "CommonName" :QUALIFIERS
                ((:DESCRIPTION
                  "A Common Name is a (possibly ambiguous) name by which the group is commonly known in some limited scope (such as an organization) and conforms to the naming conventions of the country or culture with which it is associated."))
                :INITFORM NIL)
               (DESCRIPTIONS (ARRAY STRING) :CIM-NAME "Descriptions"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The Descriptions property values may contain human-readable descriptions of the object. In the case of an LDAP-derived instance, the description attribute may have multiple values that, therefore, cannot be placed in the inherited Description property.")
                 (:MAX-LEN "1024"))
                :INITFORM NIL)
               (ORGANIZATIONNAME (ARRAY STRING) :CIM-NAME "OrganizationName"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The name of an organization related to the group."))
                :INITFORM NIL)
               (OU (ARRAY STRING) :CIM-NAME "OU" :QUALIFIERS
                ((:DESCRIPTION
                  "The name of an organizational unit related to the group."))
                :INITFORM NIL)
               (OWNER (ARRAY STRING) :CIM-NAME "Owner" :QUALIFIERS
                ((:DESCRIPTION
                  "The Owner property specifies the name of some object that has some responsibility for the group. In the case of an LDAP-derived instance, a property value for Owner may be a distinguished name of owning persons, groups, roles, etc."))
                :INITFORM NIL)
               (SEEALSO (ARRAY STRING) :CIM-NAME "SeeAlso" :QUALIFIERS
                ((:DESCRIPTION
                  "In the case of an LDAP-derived instance, the SeeAlso property specifies distinguished name of other Directory objects which may be other aspects (in some sense) of the same real world object."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_OtherGroupInformation")
              (:QUALIFIERS (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::User::Group")
               (:DESCRIPTION
                "The OtherGroupInformation class provides additional information about an associated Group instance. This class is defined so as to incorporate commonly-used LDAP attributes to permit implementations to easily derive this information from LDAP-accessible directories.")))