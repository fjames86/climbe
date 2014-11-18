
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Role.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ROLE (CIM_COLLECTION)
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
               (BUSINESSCATEGORY STRING :CIM-NAME "BusinessCategory"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property may be used to describe the kind of business activity performed by the members (role occupants) in the position or set of responsibilities represented by the Role.")
                 (:MAX-LEN "128"))
                :INITFORM NIL)
               (COMMONNAME STRING :CIM-NAME "CommonName" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "A Common Name is a (possibly ambiguous) name by which the role is commonly known in some limited scope (such as an organization) and conforms to the naming conventions of the country or culture with which it is associated."))
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
               (ROLECHARACTERISTICS (ARRAY UINT16) :CIM-NAME
                "RoleCharacteristics" :QUALIFIERS
                ((:DESCRIPTION
                  "RoleCharacteristics provides descriptive information about the intended usage of the Role.
When the value 2 \"Static\" is specified, no modification to the role shall be allowed. Any requests by client to change the privileges or the scope of the role by modifying the associated instances of CIM_Privilege or referencing associations shall fail.
When the value 2 \"Static\" is not specified, the instance of CIM_Role may be modified by a client. The modification may include changing the scope of the role or rights granted. When the value 3 \"Opaque\" is specified, the rights granted by the CIM_Role instance shall not be explicitly modeled through aggregation of instances of CIM_Privilege.
When the value 3 \"Opaque\" is not specified, the rights granted by the instance of CIM_Role shall be explicitly modeled through aggregation of instances of CIM_Privilege.")
                 (:VALUE-MAP ("2" "3" ".." "32000..65535"))
                 (:VALUES
                  ("Static" "Opaque" "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_Role")
              (:QUALIFIERS (:VERSION "2.18.0")
               (:UML-PACKAGE-PATH "CIM::User::Role")
               (:DESCRIPTION
                "The Role object class is used to represent a position or set of responsibilities within an organization, organizational unit or other scope, and MAY be filled by a person or persons (or non-human entities represented by ManagedSystemElement subclasses) - i.e., the 'role occupants'. The latter MAY be explicitly associated to a Role, by associating Identities using MemberOfCollection. The 'position or set of responsibilities' of a Role are represented as a set of rights defined by instances of the Privilege class, and are also associated to the Role via MemberOfCollection. If Identities are not explicitly associated, instances of AuthorizationRule MUST be associated with a Role using AuthorizationRuleAppliesToRole. The rule defines how subject entities are authorized for a Role and to which target entities the Role applies. 

The Role class is defined so as to incorporate commonly-used LDAP attributes to permit implementations to easily derive this information from LDAP-accessible directories. This class's properties are a subset of a related class, OtherRoleInformation, which defines all the group properties and uses arrays for directory compatibility.")))