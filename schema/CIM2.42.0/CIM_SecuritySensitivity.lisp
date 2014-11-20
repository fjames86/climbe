
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SecuritySensitivity.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SECURITYSENSITIVITY (CIM_MANAGEDELEMENT)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority. (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (SECURITYLEVEL STRING :CIM-NAME "SecurityLevel" :QUALIFIERS
                ((:DESCRIPTION
                  "A string defining the security sensitivity level. Since individual organizations each may have their own classification systems, the value of this property should include sufficient information to assure that the value is unambiguous. The value of SecurityLevel should be constructed using the following 'preferred' algorithm:
<OrgID>:[<ClassificationScheme>:]<LevelName> 
Where <OrgID> and <ClassificationScheme> and <LevelName> are each separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business or government entity creating/defining the classification scheme or is a registered ID that is assigned to the business or government entity by a recognized global authority. In addition, to ensure uniqueness both <OrgID> and <ClassificationScheme> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in SecurityLevel MUST appear between <OrgID> and <ClassificationScheme> and the second colon to appear in SecurityLevel MUST appear between <ClassificationScheme> and <LevelName>. 
<ClassificationName> is chosen by the business or government entity and SHOULD not be re-used to identify classification schemes. Each classification scheme defines one or more LevelNames that are unique within the classification scheme. An organization may choose to not use a classification scheme. In that case, each <LevelName> must not contain a colon (':') and must be unique within the organization.
Examples: 'Buffalo.edu:Public', 'Buffalo.edu:Internal Use', 'Buffalo.edu:Confidential', 'Buffalo.edu:Restricted Confidential', 'NSI:Confidential', 'NSI:Secret', and 'NSI: Top Secret'"))
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
              (:CIM-NAME "CIM_SecuritySensitivity")
              (:QUALIFIERS (:VERSION "2.19.0")
               (:UML-PACKAGE-PATH "CIM::User::SecurityLevel")
               (:DESCRIPTION
                "An instance of this class defines a security label used to characterize the security clearance necessary to access information in a system that supports mandatory access controls. The labels have two components, one a hierarchical security level and the other a set of non-hierarchical security categories. 

Mandatory access control determines whether to allow certain actions, based on the following rules: - If the security level of a security principal is equal to or greater than the security level of an element, and the security categories the security principal include all of the security categories of the element, then the security principal may read from the element. - If the security label of a security principal is equal to or less than the security label of an element, and the security categories the element include all of the security categories of the security principal, then the security principal may write to the element.

An element is assigned a security level via the association, ElementSecurityLevel. It can be assigned to any ManagedElement, such as Locations, Identities, Roles, Systems, Services and LogicalFiles. 

The clearance of a security principal, represented by an instance of Identity may be specified by associating an instance of this class via IdentitySecurityClearance.

The set of security levels and categories are determined by a business, organization and/or government based on the need to protect data and entities from attack, loss, abuse or unauthorized disclosure, and the ramifications if this protection is not maintained.")))