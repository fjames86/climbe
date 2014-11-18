
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CommonDatabaseCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COMMONDATABASECAPABILITIES (CIM_CAPABILITIES)
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
               (RECOVERABILITYOPTIONS (ARRAY UINT16) :CIM-NAME
                "RecoverabilityOptions" :QUALIFIERS
                ((:DESCRIPTION
                  "This property identifies the supported recoverability modes for the associated CommonDatabase.")
                 (:VALUE-MAP ("1" "2" "3" "4"))
                 (:VALUES
                  ("Other" "Recoverable" "Non-Recoverable" "Rebuildable"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_CommonDatabaseCapabilities.OtherRecoverabilityOptions")))
                :INITFORM NIL)
               (OTHERRECOVERABILITYOPTIONS (ARRAY STRING) :CIM-NAME
                "OtherRecoverabilityOptions" :QUALIFIERS
                ((:DESCRIPTION
                  "This property contains additional recovery information for the CommonDatabase. This property must be specified when the Recoverability property is \"Other\".")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_CommonDatabaseCapabilities.RecoverabilityOptions")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_CommonDatabaseCapabilities")
              (:QUALIFIERS (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Database::Storage")
               (:DESCRIPTION
                "Properties in this class represent general, high-level database capabilities that may be supported by a common database. For example, the ability for a database to support recoverability, replication, parallelism, or clustering would be specified in this class. Detailed settings, such as the minimum and maximum number of parallel servers for a database that supports parallelism, would be defined in the CIM_DatabaseParameter class. 
This information is tied to the CommonDatabase using the ElementCapabilities association.")))