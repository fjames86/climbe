
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FileSystemCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FILESYSTEMCAPABILITIES (CIM_CAPABILITIES)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
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
               (SUPPORTEDPERSISTENCETYPES (ARRAY UINT16) :CIM-NAME
                "SupportedPersistenceTypes" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of enumerated values representing the persistence capabilities of the FileSystem. A value of \"Persistent\" indicates that the FileSystem supports persistence, can be preserved through an orderly shutdown and could be protected. A value of \"Temporary\" indicates that the FileSystem supports non-persistence, may not be protected and may not survive a shutdown. A value of \"External\" indicates that the FileSystem could controlled outside of the operating environment and may need to be protected by specialized means. A value of \"Other\" is provided to allow for additional persistence types, to be described in the OtherPersistenceType attribute, and is expected to be rarely, if ever, used.")
                 (:VALUE-MAP ("1" "2" "3" "4"))
                 (:VALUES ("Other" "Persistent" "Temporary" "External"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_FileSystemCapabilities.SupportedPersistenceTypes"
                   "CIM_FileSystem.PersistenceType")))
                :INITFORM NIL)
               (SUPPORTEDOTHERPERSISTENCETYPES (ARRAY STRING) :CIM-NAME
                "SupportedOtherPersistenceTypes" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of strings describing the persistence capabilities where the corresponding entry in SupportedPersistenceTypes has a value of \"Other\". This value is ignored in all other cases.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_FileSystemCapabilities.SupportedPersistenceTypes"
                   "CIM_FileSystem.OtherPersistenceType")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_FileSystemCapabilities")
              (:QUALIFIERS (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::System::FilesystemServices")
               (:DESCRIPTION
                "This class defines the abilities for persistence and recoverability of a FileSystem. This information is tied to the FileSystem using the ElementCapabilities association.")))