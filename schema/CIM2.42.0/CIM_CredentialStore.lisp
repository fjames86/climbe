
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CredentialStore.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CREDENTIALSTORE (CIM_COLLECTION)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority. (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the organizational entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (USAGE UINT16 :CIM-NAME "Usage" :QUALIFIERS
                ((:DESCRIPTION
                  "Usage of the CIM_CredentialStore. 2 - Owned value means CIM_CredentialStore instance represents a collection of credentials that belong to parties local to the manager of the store. 3 - Trusted value means CIM_CredentialStore instance public credentials that belong to parties trusted by the manager of the store. 4 - Mixed value means CIM_CredentialStore instance represents a collection of both Trusted and Owned credentials.")
                 (:VALUE-MAP ("2" "3" "4" ".." "32768..65535"))
                 (:VALUES
                  ("Owned" "Trusted" "Mixed" "DMTF Reserved"
                   "Vendor Specified")))
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
              (:CIM-NAME "CIM_CredentialStore")
              (:QUALIFIERS (:VERSION "2.29.0")
               (:UML-PACKAGE-PATH "CIM::User::Credential")
               (:DESCRIPTION
                "CIM_CredentialStore class represents a collection of credentials such as certificates and biometric credentials. Credential collection can be used to store the credentials used by the service for validation of served up credentials or for the owned credentials of the service.")))