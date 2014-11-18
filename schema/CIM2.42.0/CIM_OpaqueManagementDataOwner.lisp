
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OpaqueManagementDataOwner.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_OPAQUEMANAGEMENTDATAOWNER (CIM_ASSOCIATEDPRIVILEGE)
              ((USEKEY STRING :CIM-NAME "UseKey" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "UseKey is used to distinguish instances in case multiple instances of this association exist between the same Subject and Target. This may arise, for example, if separate instances are created for each management domain, or if the Subject has access and authorization rights to the Target.
Within the scope of the instantiating Namespace, UseKey opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of UseKey should be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> shall include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the UseKey, or is a registered ID that is assigned to the business entity by a recognized global authority. (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> shall not contain a colon (':'). When using this algorithm, the first colon to appear in UseKey shall appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity shall assure that the resultant UseKey is not re-used across any UseKeys produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm shall be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (PRIVILEGEGRANTED BOOLEAN :CIM-NAME "PrivilegeGranted"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether the Privilege is granted (TRUE) or denied (FALSE). The default is to grant permission."))
                :INITFORM "true")
               (REPRESENTSAUTHORIZATIONRIGHTS BOOLEAN :CIM-NAME
                "RepresentsAuthorizationRights" :QUALIFIERS
                ((:DESCRIPTION
                  "The RepresentsAuthorizationRights flag indicates whether the rights defined by this instance shall be interpreted as rights of Subjects to access Targets or as rights of Subjects to change those rights on/for Targets."))
                :INITFORM "false")
               (ACTIVITIES (ARRAY UINT16) :CIM-NAME "Activities" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the activities that are granted or denied. These activities apply to all entities specified in the ActivityQualifiers array.
\"Other\" (1): indicates an activity that is not specified in this enumeration.
\"Create\" (2), \"Delete\" (3), \"Detect\" (4), \"Read\" (5), \"Write\" (6), \"Execute\" (7): each of these values indicates that the Subject is permitted to use an operation supported by the Target. They are all straightforward except for one, 4=\"Detect\". This value indicates that the existence or presence of an entity may be determined, but not necessarily specific data (which requires the Read privilege to be true). This activity is exemplified by 'hidden files'- if you list the contents of a directory, you will not see hidden files. However, if you know a specific file name, or know how to expose hidden files, then they can be 'detected'. Another example is the ability to define search privileges in directory implementations.
\"Deny Create\" (8), \"Deny Delete\" (9), \"Deny Detect\" (10), \"Deny Read\" (11), \"Deny Write\" (12), \"Deny Execute\" (13): each of these values indicates that the Subject is expressly denied permission to use an operation supported by the Target.
Authorize to Grant/Deny Authorization (14): this value indicates that the Subject is permitted to add any of the following values to - or remove any of the following values from - the Activities array property in any other instance of CIM_AssociatedPrivilege that references the same Target: \"Authorize to Create\" (15), \"Authorize to Delete\" (16), \"Authorize to Detect\" (17), \"Authorize to Read\" (18), \"Authorize to Write\" (19), \"Authorize to Execute\" (20), \"Authorize to Deny Create\" (21), \"Authorize to Deny Delete\" (22), \"Authorize to Deny Detect\" (23), \"Authorize to Deny Read\" (24), \"Authorize to Deny Write\" (25), and \"Authorize to Deny Execute\" (26).
\"Authorize to Create\" (15), \"Authorize to Delete\" (16), \"Authorize to Detect\" (17), \"Authorize to Read\" (18), \"Authorize to Write\" (19), \"Authorize to Execute\" (20), \"Authorize to Deny Create\" (21), \"Authorize to Deny Delete\" (22), \"Authorize to Deny Detect\" (23), \"Authorize to Deny Read\" (24), \"Authorize to Deny Write\" (25), and \"Authorize to Deny Execute\" (26): each of these values indicates that the Subject is permitted to add value named in the string to - or remove the value from - the Activities array property in any other instance of CIM_AssociatedPrivilege that references the same Target. For example, \"Authorize to Read\" indicates that the Subject is permitted to add or remove the value \"Read\", and \"Authorize to Deny Read\" indicates that the Subject is permitted to add or remove the value \"Deny Read\".")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26"
                   ".." "16000.."))
                 (:VALUES
                  ("Other" "Create" "Delete" "Detect" "Read" "Write" "Execute"
                   "Deny Create" "Deny Delete" "Deny Detect" "Deny Read"
                   "Deny Write" "Deny Execute"
                   "Authorize to Grant/Deny Authorization"
                   "Authorize to Create" "Authorize to Delete"
                   "Authorize to Detect" "Authorize to Read"
                   "Authorize to Write" "Authorize to Execute"
                   "Authorize to Deny Create" "Authorize to Deny Delete"
                   "Authorize to Deny Detect" "Authorize to Deny Read"
                   "Authorize to Deny Write" "Authorize to Deny Execute"
                   "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AssociatedPrivilege.ActivityQualifiers")))
                :INITFORM NIL)
               (ACTIVITYQUALIFIERS (ARRAY STRING) :CIM-NAME
                "ActivityQualifiers" :QUALIFIERS
                ((:DESCRIPTION
                  "The ActivityQualifiers property is an array of string values used to further qualify and specify the privileges granted or denied. For example, it is used to specify a set of files for which 'Read'/'Write' access is permitted or denied. Or, it defines a class' methods that may be 'Executed'. Details on the semantics of the individual entries in ActivityQualifiers are provided by corresponding entries in the QualifierFormats array.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AssociatedPrivilege.Activities"
                   "CIM_AssociatedPrivilege.QualifierFormats")))
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
- 11=Packets. Example: The transmission of packets is permitted or denied by the Privilege for the target (a ComputerSystem, ProtocolEndpoint, Pipe, or other ManagedSystemElement).
- 12=Specification-defined. The semantics are defined in a a specification produced by the DMTF or other organization. The value of the corresponding ActivityQualifiers entry names the specification and the organization that produced it, and includes a label that unambiguously references the semantic definition within the specification. The value of of the corresponding ActivityQualifiers entry should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<SpecID>:<Label>, where <OrgID>, <SpecID>, and <Label> are separated by a colon (:), and where <OrgID> shall include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness both <OrgID> and <SpecID> shall not contain a colon (':'). When using this algorithm, the first colon to appear in the corresponding ActivityQualifiers entry shall appear between <OrgID> and <SpecID> and the second colon to appear in the corresponding ActivityQualifiers entry shall appear between <SpecID> and <Label>. 
<Label> is chosen by the business entity and should not be reused to identify different underlying semantics. If the above \"preferred\" algorithm is not used, the defining entity must assure that the resulting value is not reused to refer to a different specification or different semantics within defined within the same specification.
For DMTF-defined instances, the \"preferred\" algorithm shall be used with the <OrgID> set to \"DMTF\", and the <SpecID> set to \"DSPx\", where x is the number of a DSP published by the DMTF.")
                 (:VALUE-MAP
                  ("2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" ".."
                   "16000.."))
                 (:VALUES
                  ("Class Name" "<Class.>Property" "<Class.>Method"
                   "Object Reference" "Namespace" "URL" "Directory/File Name"
                   "Command Line Instruction" "SCSI Command" "Packets"
                   "Specification-defined" "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AssociatedPrivilege.ActivityQualifiers")))
                :INITFORM NIL)
               (SUBJECT NIL :CIM-NAME "Subject" :QUALIFIERS
                ((:OVERRIDE "Subject")
                 (:DESCRIPTION
                  "The CIM_Identity instance for whom privileges to the Target are granted or denied, and who is the owner of the Target.")
                 :KEY)
                :INITFORM "CIM_ManagedElement")
               (TARGET NIL :CIM-NAME "Target" :QUALIFIERS
                ((:OVERRIDE "Target")
                 (:DESCRIPTION
                  "The opaque management data to which the privileges and ownership apply.")
                 :KEY)
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_OpaqueManagementDataOwner")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::User::OpaqueManagementData")
               (:DESCRIPTION
                "CIM_OpaqueManagementDataOwner describes ownership of opaque data by CIM_Identity instances. The definition of CIM_OpaqueManagementDataOwner as a subclass of CIM_AssociatedPrivilege represents the fact that the owner of opaque management data often has privileges to access it, but additionally is responsible for its existence and may have a storage quota against which it is applied. The definition of a distinct subclass facilitates discovery of the owning CIM_Identity instance.")))