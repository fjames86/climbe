
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_StorageConfigurationCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_STORAGECONFIGURATIONCAPABILITIES (CIM_CAPABILITIES)
              ((INITIALREPLICATIONSTATE UINT16 :CIM-NAME
                "InitialReplicationState" :QUALIFIERS
                ((:DESCRIPTION
                  "InitialReplicationState specifies which initial ReplicationState is supported by a particular provider. Values are: 
Initialized: The replication relationship is known and unsynchronized, but time required to synchronize may be long. 
Prepared: The replication relationship is known and unsynchronized and the time required to synchronize will be short. 
Synchronized: The replicas are synchronized.")
                 (:VALUE-MAP ("2" "3" "4" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("Initialized" "Prepared" "Synchronized" "DMTF Reserved"
                   "Vendor Specific"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageConfigurationService.AttachReplica"
                   "CIM_StorageConfigurationService.CreateReplica")))
                :INITFORM NIL)
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
               (SUPPORTEDASYNCHRONOUSACTIONS (ARRAY UINT16) :CIM-NAME
                "SupportedAsynchronousActions" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating what operations will be executed as asynchronous jobs. If an operation is included in both this and SupportedSynchronousActions then the underlying implementation is indicating that it may or may not create a job.")
                 (:VALUE-MAP ("2" "3" "4" "5" "6" "7" "8" "9" "10"))
                 (:VALUES
                  ("Storage Pool Creation" "Storage Pool Deletion"
                   "Storage Pool Modification" "Storage Element Creation"
                   "Storage Element Return" "Storage Element Modification"
                   "Replica Creation" "Replica Modification"
                   "Replica Attachment"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageConfigurationCapabilities.SupportedSynchronousActions")))
                :INITFORM NIL)
               (SUPPORTEDSYNCHRONOUSACTIONS (ARRAY UINT16) :CIM-NAME
                "SupportedSynchronousActions" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating what operations will be executed without the creation of a job. If an operation is included in both this and SupportedAsynchronousActions then the underlying instrumentation is indicating that it may or may not create a job.")
                 (:VALUE-MAP ("2" "3" "4" "5" "6" "7" "8" "9" "10"))
                 (:VALUES
                  ("Storage Pool Creation" "Storage Pool Deletion"
                   "Storage Pool Modification" "Storage Element Creation"
                   "Storage Element Return" "Storage Element Modification"
                   "Replica Creation" "Replica Modification"
                   "Replica Attachment"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageConfigurationCapabilities.SupportedAsynchronousActions")))
                :INITFORM NIL)
               (SUPPORTEDSTORAGEELEMENTTYPES (ARRAY UINT16) :CIM-NAME
                "SupportedStorageElementTypes" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating the type of storage elements that are supported by the associated StorageConfigurationService.")
                 (:VALUE-MAP ("2" "3" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("StorageVolume" "StorageExtent" "DMTF Reserved"
                   "Vendor Specific"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageConfigurationService.CreateOrModifyElementFromStoragePool(ElementType)")))
                :INITFORM NIL)
               (SUPPORTEDSTORAGEPOOLFEATURES (ARRAY UINT16) :CIM-NAME
                "SupportedStoragePoolFeatures" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating features supported by the StoragePool methods.")
                 (:VALUE-MAP ("2" "3" "4" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("InExtents" "Single InPool" "Multiple InPools"
                   "DMTF Reserved" "Vendor Specific"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageConfigurationService.CreateOrModifyStoragePool(InPools)"
                   "CIM_StorageConfigurationService.CreateOrModifyStoragePool(InExtents)")))
                :INITFORM NIL)
               (SUPPORTEDSTORAGEELEMENTFEATURES (ARRAY UINT16) :CIM-NAME
                "SupportedStorageElementFeatures" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating features supported by the Storage Element methods.")
                 (:VALUE-MAP ("2" "3" "4" "5" "6" "7" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("StorageExtent Creation" "StorageVolume Creation"
                   "StorageExtent Modification" "StorageVolume Modification"
                   "Single InPool" "Multiple InPools" "DMTF Reserved"
                   "Vendor Specific"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageConfigurationService.CreateOrModifyElementFromStoragePool(ElementType)"
                   "CIM_StorageConfigurationService.CreateOrModifyElementFromStoragePool(InPool)")))
                :INITFORM NIL)
               (SUPPORTEDCOPYTYPES (ARRAY UINT16) :CIM-NAME
                "SupportedCopyTypes" :QUALIFIERS
                ((:DESCRIPTION
                  "SupportedCopyTypes describes the replication capabilities supported by the associated StorageConfigurationServices. Values are: 
Async: asynchronous copies may be created and maintained. 
Sync: synchronous copies may be created and maintained. 
UnSyncAssoc: unsynchronized copies may be created and maintained. 
UnSyncUnAssoc: a 'straight copy' may be created.")
                 (:VALUE-MAP ("2" "3" "4" "5" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("Async" "Sync" "UnSyncAssoc" "UnSyncUnAssoc" "DMTF Reserved"
                   "Vendor Specific"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageConfigurationService.CreateReplica(CopyType)")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_StorageConfigurationCapabilities")
              (:QUALIFIERS (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageServices")
               (:DESCRIPTION
                "A subclass of Capabilities that defines the Capabilities of a StorageConfigurationService. An instance of StorageConfigurationCapabilities is associated with a StorageConfigurationService using ElementCapabilities.")))