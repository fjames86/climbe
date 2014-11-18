
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Privilege.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRIVILEGE (CIM_MANAGEDELEMENT)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority. (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (PRIVILEGEGRANTED BOOLEAN :CIM-NAME "PrivilegeGranted"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether the Privilege is granted (TRUE) or denied (FALSE). The default is to grant permission."))
                :INITFORM "true")
               (REPRESENTSAUTHORIZATIONRIGHTS BOOLEAN :CIM-NAME
                "RepresentsAuthorizationRights" :QUALIFIERS
                ((:DESCRIPTION
                  "The RepresentsAuthorizationRights flag indicates whether the rights defined by this instance should be interpreted as rights of Subjects to access Targets or as rights of Subjects to change those rights on/for Targets."))
                :INITFORM "false")
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
               (ACTIVITIES (ARRAY UINT16) :CIM-NAME "Activities" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the activities that are granted or denied. These activities apply to all entities specified in the ActivityQualifiers array. The values in the enumeration are straightforward except for one, 4=\"Detect\". This value indicates that the existence or presence of an entity may be determined, but not necessarily specific data (which requires the Read privilege to be true). This activity is exemplified by 'hidden files'- if you list the contents of a directory, you will not see hidden files. However, if you know a specific file name, or know how to expose hidden files, then they can be 'detected'. Another example is the ability to define search privileges in directory implementations.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" "6" "7" ".." "16000.."))
                 (:VALUES
                  ("Other" "Create" "Delete" "Detect" "Read" "Write" "Execute"
                   "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE ("CIM_Privilege.ActivityQualifiers")))
                :INITFORM NIL)
               (ACTIVITYQUALIFIERS (ARRAY STRING) :CIM-NAME
                "ActivityQualifiers" :QUALIFIERS
                ((:DESCRIPTION
                  "The ActivityQualifiers property is an array of string values used to further qualify and specify the privileges granted or denied. For example, it is used to specify a set of files for which 'Read'/'Write' access is permitted or denied. Or, it defines a class' methods that may be 'Executed'. Details on the semantics of the individual entries in ActivityQualifiers are provided by corresponding entries in the QualifierFormats array.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Privilege.Activities"
                   "CIM_Privilege.QualifierFormats")))
                :INITFORM NIL)
               (QUALIFIERFORMATS (ARRAY UINT16) :CIM-NAME "QualifierFormats"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Defines the semantics of corresponding entries in the ActivityQualifiers array. An example of each of these 'formats' and their use follows: 
- 2=Class Name. Example: If the authorization target is a CIM Service or a Namespace, then the ActivityQualifiers entries can define a list of classes that the authorized subject is able to create or delete. 
- 3=<Class.>Property. Example: If the authorization target is a CIM Service, Namespace or Collection of instances, then the ActivityQualifiers entries can define the class properties that may or may not be accessed. In this case, the class names are specified with the property names to avoid ambiguity - since a CIM Service, Namespace or Collection could manage multiple classes. On the other hand, if the authorization target is an individual instance, then there is no possible ambiguity and the class name may be omitted. To specify ALL properties, the wildcard string \"*\" should be used. 
- 4=<Class.>Method. This example is very similar to the Property one, above. And, as above, the string \"*\" may be specified to select ALL methods. 
- 5=Object Reference. Example: If the authorization target is a CIM Service or Namespace, then the ActivityQualifiers entries can define a list of object references (as strings) that the authorized subject can access. 
- 6=Namespace. Example: If the authorization target is a CIM Service, then the ActivityQualifiers entries can define a list of Namespaces that the authorized subject is able to access. 
- 7=URL. Example: An authorization target may not be defined, but a Privilege could be used to deny access to specific URLs by individual Identities or for specific Roles, such as the 'under 17' Role. 
- 8=Directory/File Name. Example: If the authorization target is a FileSystem, then the ActivityQualifiers entries can define a list of directories and files whose access is protected. 
- 9=Command Line Instruction. Example: If the authorization target is a ComputerSystem or Service, then the ActivityQualifiers entries can define a list of command line instructions that may or may not be 'Executed' by the authorized subjects. 
- 10=SCSI Command, using a format of 'CDB=xx[,Page=pp]'. For example, the ability to select the VPD page of the Inquiry command is encoded as 'CDB=12,Page=83' in the corresponding ActivityQualifiers entry. A '*' may be used to indicate all CDBs or Page numbers. 
- 11=Packets. Example: The transmission of packets is permitted or denied by the Privilege for the target (a ComputerSystem, ProtocolEndpoint, Pipe, or other ManagedSystemElement).")
                 (:VALUE-MAP
                  ("2" "3" "4" "5" "6" "7" "8" "9" "10" "11" ".." "16000.."))
                 (:VALUES
                  ("Class Name" "<Class.>Property" "<Class.>Method"
                   "Object Reference" "Namespace" "URL" "Directory/File Name"
                   "Command Line Instruction" "SCSI Command" "Packets"
                   "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE ("CIM_Privilege.ActivityQualifiers")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_Privilege")
              (:QUALIFIERS (:VERSION "2.20.0")
               (:UML-PACKAGE-PATH "CIM::User::Privilege")
               (:DESCRIPTION
                "Privilege is the base class for all types of activities which are granted or denied by a Role or an Identity. Whether an individual Privilege is granted or denied is defined using the PrivilegeGranted boolean. Any Privileges not specifically granted are assumed to be denied. An explicit deny (Privilege Granted = FALSE) takes precedence over any granted Privileges. 

The association of subjects (Roles and Identities) to Privileges is accomplished using policy or explicitly via the associations on a subclass. The entities that are protected (targets) can be similarly defined. 

Note that Privileges may be inherited through hierarchical Roles, or may overlap. For example, a Privilege denying any instance Writes in a particular CIM Server Namespace would overlap with a Privilege defining specific access rights at an instance level within that Namespace. In this example, the AuthorizedSubjects are either Identities or Roles, and the AuthorizedTargets are a Namespace in the former case, and a particular instance in the latter.")))