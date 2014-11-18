
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RoleBasedManagementCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ROLEBASEDMANAGEMENTCAPABILITIES
              (CIM_PRIVILEGEMANAGEMENTCAPABILITIES)
              ((SHAREDPRIVILEGESUPPORTED BOOLEAN :CIM-NAME
                "SharedPrivilegeSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "Set to TRUE if this PrivilegeManagementService supports association of multiple subjects or targets to a particular Privilege. If False, the AssignAccess method supports at most one entry each in the Subjects and Targets parameters."))
                :INITFORM "false")
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "The user friendly name for this instance of Capabilities. In addition, the user friendly name can be used as a index property for a search of query. (Note: Name does not have to be unique within a namespace.)"))
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
               (SUPPORTEDMETHODS (ARRAY UINT16) :CIM-NAME "SupportedMethods"
                :QUALIFIERS
                ((:OVERRIDE "SupportedMethods")
                 (:DESCRIPTION
                  "The enumeration values \"ChangeAccess\", \"ShowAccess\", \"AssignAccess\", \"RevokeAccess\", \"CreateRole\", \"ModifyRole\", \"AssignRoles\", \"ShowRoles\", and \"DeleteRole\" corresponds to support for the like-named method of the RoleBasedAuthorizationService. 
The value \"ModifyPrivilege\" corresponds to support for directly modifying an instance of CIM_Privilege using an intrinsic operation.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" ".."
                   "32768..65535"))
                 (:VALUES
                  ("ChangeAccess" "ShowAccess" "AssignAccess" "RevokeAccess"
                   "CreateRole" "ModifyRole" "AssignRoles" "ShowRoles"
                   "ModifyPrivilege" "DeleteRole" "DMTF Reserved"
                   "Vendor Reserved")))
                :INITFORM NIL)
               (ACTIVITIESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "ActivitiesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "A super set of activities that could be granted or denied to a role or an identity by the associated privileges. The Activities property of the instances of CIM_Privilege that are associated to the role or the identity MUST contain only the values enumerated in the ActivitiesSupported array property. The supported activities apply to all entities specified in the ActivityQualifiersSupported array. Refer to the CIM_Privilege.Activities property for the detailed description of values.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" "6" "7" ".." "16000.."))
                 (:VALUES
                  ("Other" "Create" "Delete" "Detect" "Read" "Write" "Execute"
                   "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PrivilegeManagementCapabilities.ActivityQualifiersSupported")))
                :INITFORM NIL)
               (ACTIVITYQUALIFIERSSUPPORTED (ARRAY STRING) :CIM-NAME
                "ActivityQualifiersSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "The ActivityQualifiersSupported property is an array of string values used to further qualify and specify the supported activities of privileges. The ActivityQualifiers property of the instances of CIM_Privilege that are associated to the role or the identity MUST contain only the values enumerated in the ActivityQualifiersSupported array property. Details on the semantics of the individual entries in ActivityQualifiersSupported are provided by corresponding entries in the QualifierFormatsSupported array. Refer to the CIM_Privilege.ActivityQualifiers property for the detailed description of values.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PrivilegeManagementCapabilities.ActivitiesSupported"
                   "CIM_Privilege.QualifierFormats")))
                :INITFORM NIL)
               (QUALIFIERFORMATSSUPPORTED (ARRAY UINT16) :CIM-NAME
                "QualifierFormatsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "Defines the semantics of corresponding entries in the ActivityQualifierSupported array. The QualifierSupported property of the instances of CIM_Privilege that are associated to the role or the identity MUST contain only the values enumerated in the QualifierSupported array property. Refer to the CIM_Privilege.QualifierSupported property for the detailed description of values.")
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
              (:CIM-NAME "CIM_RoleBasedManagementCapabilities")
              (:QUALIFIERS (:VERSION "2.18.0")
               (:UML-PACKAGE-PATH "CIM::User::Privilege")
               (:DESCRIPTION
                "A subclass that extends the capabilities of the CIM_RoleBasedAuthorizationService.")))