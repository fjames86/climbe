
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_StorageReplicationCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_STORAGEREPLICATIONCAPABILITIES (CIM_CAPABILITIES)
              ((SUPPORTEDSYNCHRONIZATIONTYPE UINT16 :CIM-NAME
                "SupportedSynchronizationType" :QUALIFIERS
                ((:DESCRIPTION
                  "SupportedSynchronizationType describes the type of Synchronization that is characterized by this instance of StorageReplicationCapabilities. Values are:
Async: create a mirror that is nearly always synchronized. Sync: create a mirror that is always synchronized.
UnSyncAssocFull: create a full size snapshot (Point In Time image).
UnSyncAssocDelta: create a delta snapshot (Point In Time image).
UnSyncUnAssoc: create a full size, independent replica.")
                 (:VALUE-MAP ("2" "3" "4" "5" "6" ".." "32768..65535"))
                 (:VALUES
                  ("Async" "Sync" "UnSyncAssoc-Full" "UnSyncAssoc-Delta"
                   "UnSyncUnAssoc" "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (INITIALREPLICATIONSTATE UINT16 :CIM-NAME
                "InitialReplicationState" :QUALIFIERS
                ((:DESCRIPTION
                  "InitialReplicationState specifies which initial ReplicationState is supported by a particular provider. Values are: 
Initialized: The replication relationship is known and unsynchronized, but time required to synchronize may be long. 
Prepared: The replication relationship is known and unsynchronized and the time required to synchronize will be short. 
Synchronized: The replicas are synchronized.Idle: an UnSyncAssoc replica is ready to manage.")
                 (:VALUE-MAP ("2" "3" "4" "5" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("Initialized" "Prepared" "Synchronized" "Idle"
                   "DMTF Reserved" "Vendor Specific"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageConfigurationService.AttachReplica"
                   "CIM_StorageConfigurationService.CreateReplica")))
                :INITFORM NIL)
               (REPLICAHOSTACCESSIBILITY UINT16 :CIM-NAME
                "ReplicaHostAccessibility" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates host access restrictions for replicas with thesecapabilities. Values: 2 = not accessible. 
3 = no restrictions. Any host may access. 4 = only accessible by associated source element hosts. 5 = not accessible by source element hosts. Other hosts OK.")
                 (:VALUE-MAP ("2" "3" "4" "5" ".."))
                 (:VALUES
                  ("Not Accessible" "No Restrictions" "Source Hosts Only"
                   "Source Hosts Excluded" "DMTF Reserved")))
                :INITFORM NIL)
               (SPACELIMITSUPPORTED BOOLEAN :CIM-NAME "SpaceLimitSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "True indicates space limits on allocation from StoragePools may be enforced."))
                :INITFORM NIL)
               (SPACERESERVATIONSUPPORTED BOOLEAN :CIM-NAME
                "SpaceReservationSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "True indicates space reserved for replicas can be from a specialized pool."))
                :INITFORM NIL)
               (LOCALMIRRORSNAPSHOTSUPPORTED BOOLEAN :CIM-NAME
                "LocalMirrorSnapshotSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "True indicates local mirror can be snapshot source."))
                :INITFORM NIL)
               (REMOTEMIRRORSNAPSHOTSUPPORTED BOOLEAN :CIM-NAME
                "RemoteMirrorSnapshotSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "True indicates remote mirror can be snapshot source."))
                :INITFORM NIL)
               (INCREMENTALDELTASSUPPORTED BOOLEAN :CIM-NAME
                "IncrementalDeltasSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "True indicates all delta replicas associated with the same source element can be incrementally dependent. Only the oldest replica in the set may be deleted or resynced."))
                :INITFORM NIL)
               (PERSISTENTREPLICASSUPPORTED BOOLEAN :CIM-NAME
                "PersistentReplicasSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "True indicates replicas can persist during power off or system reset. False indicates replicas lost during these events."))
                :INITFORM NIL)
               (BIDIRECTIONALCONNECTIONSSUPPORTED BOOLEAN :CIM-NAME
                "BidirectionalConnectionsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "True indicates peer-to-peer connections are bi-directional. False indicates connections are uni-directional."))
                :INITFORM NIL)
               (MAXIMUMREPLICASPERSOURCE UINT16 :CIM-NAME
                "MaximumReplicasPerSource" :QUALIFIERS
                ((:DESCRIPTION
                  "Maximum number of replicas that can be associated with one source element."))
                :INITFORM NIL)
               (MAXIMUMPORTSPERCONNECTION UINT16 :CIM-NAME
                "MaximumPortsPerConnection" :QUALIFIERS
                ((:DESCRIPTION
                  "Maximum number of port pairs assigned to a peer-to-peer connection."))
                :INITFORM NIL)
               (MAXIMUMCONNECTIONSPERPORT UINT16 :CIM-NAME
                "MaximumConnectionsPerPort" :QUALIFIERS
                ((:DESCRIPTION
                  "Maximum number of peer-to-peer connections to which a port maybe assigned."))
                :INITFORM NIL)
               (MAXIMUMPEERCONNECTIONS UINT16 :CIM-NAME
                "MaximumPeerConnections" :QUALIFIERS
                ((:DESCRIPTION
                  "Maximum number of peer connections supported by this instance of StorageConfigurationService."))
                :INITFORM NIL)
               (MAXIMUMLOCALREPLICATIONDEPTH UINT16 :CIM-NAME
                "MaximumLocalReplicationDepth" :QUALIFIERS
                ((:DESCRIPTION
                  "Maximum local mirror replication depth allowed by this instance of StorageConfigurationService. Value 1 indicates multi-level replication not supported."))
                :INITFORM "1")
               (MAXIMUMREMOTEREPLICATIONDEPTH UINT16 :CIM-NAME
                "MaximumRemoteReplicationDepth" :QUALIFIERS
                ((:DESCRIPTION
                  "Maximum remote mirror replication depth allowed by this instance of StorageConfigurationService. Value N means that remote replicas can span N linked peer-to-peer connections. Value 1 indicates multi-level replication not supported."))
                :INITFORM "1")
               (INITIALSYNCHRONIZATIONDEFAULT UINT16 :CIM-NAME
                "InitialSynchronizationDefault" :QUALIFIERS
                ((:DESCRIPTION
                  "Start or do not start background copy when replica is created.")
                 (:VALUE-MAP ("0" "1" "2" ".." "0x8000.."))
                 (:VALUES
                  ("Not Managed" "Start" "Do Not Start" "DMTF Reserved"
                   "Vendor Specific")))
                :INITFORM NIL)
               (REPLICATIONPRIORITYDEFAULT UINT16 :CIM-NAME
                "ReplicationPriorityDefault" :QUALIFIERS
                ((:DESCRIPTION
                  "ReplicationPriority allows the priority of background Replication I/O to be managed relative to host I/O. Default applies to initial or deferred background Replication operations. Value can be modified while in Replication-in-progress state. Values: Low: Replication engine I/O lower priority than host I/O. 
Same: Replication engine I/O has the same priority as host I/O. 
High: Replication engine I/O has higher priority than host I/O.")
                 (:VALUE-MAP ("0" "1" "2" "3" ".." "0x8000.."))
                 (:VALUES
                  ("Not Managed" "Low" "Same" "High" "DMTF Reserved"
                   "Vendor Specific")))
                :INITFORM NIL)
               (LOWSPACEWARNINGTHRESHOLDDEFAULT UINT8 :CIM-NAME
                "LowSpaceWarningThresholdDefault" :QUALIFIERS
                ((:DESCRIPTION
                  "Warning threshold for generating an indication for RemainingManagedSpace. Value of zero means no warning generated.Triggered when RemainingManagedSpace <= (TotalManagedSpace*LowSpaceWarningThreshold)/100.")
                 (NIL "Percentage") (:MIN-VALUE "0") (:MAX-VALUE "100")
                 (:P-UNIT "percent"))
                :INITFORM NIL)
               (SPACELIMITWARNINGTHRESHOLDDEFAULT UINT8 :CIM-NAME
                "SpaceLimitWarningThresholdDefault" :QUALIFIERS
                ((:DESCRIPTION
                  "Warning threshold for instance modification indication for SpaceConsumed by a replica element. Value of zero means no warning generated. Triggered when SpaceConsumed >= (SpaceLimit*SpaceLimitWarningThreshold)/100.")
                 (NIL "Percentage") (:MIN-VALUE "0") (:MAX-VALUE "100")
                 (:P-UNIT "percent"))
                :INITFORM NIL)
               (REMOTEREPLICATIONSERVICEPOINTACCESS UINT16 :CIM-NAME
                "RemoteReplicationServicePointAccess" :QUALIFIERS
                ((:DESCRIPTION
                  "Remote replication provides StorageConfigurationService instances for source systems and target systems. A client determines that extrinsic methods of the service should be invoked to one instance or the other based on the value of this property. Values: Not Specified: invoke a method to either system instance. Source: invoke to source element service instance. Target: invoke to target element service instance. Proxy: find and invoke to proxy service instance.")
                 (:VALUE-MAP ("2" "3" "4" "5" ".." "0x8000.."))
                 (:VALUES
                  ("Not Specified" "Source" "Target" "Proxy" "DMTF Reserved"
                   "Vendor Specific")))
                :INITFORM NIL)
               (ALTERNATEREPLICATIONSERVICEPOINTACCESS UINT16 :CIM-NAME
                "AlternateReplicationServicePointAccess" :QUALIFIERS
                ((:DESCRIPTION
                  "Remote replication provides StorageConfigurationService instances for source systems and target systems. A client determines that extrinsic methods of the service should be invoked to one instance or the other based on the value of this property. If the primary instance is unavailable, the provider may indicate an alternate instance. Values: None: no alternate exists. Source: invoke to source element service instance. Target: invoke to target element service instance. Proxy: find and invoke alternate proxy service instance.")
                 (:VALUE-MAP ("2" "3" "4" "5" ".." "0x8000.."))
                 (:VALUES
                  ("None" "Source" "Target" "Proxy" "DMTF Reserved"
                   "Vendor Specific")))
                :INITFORM NIL)
               (DELTAREPLICAPOOLACCESS UINT16 :CIM-NAME
                "DeltaReplicaPoolAccess" :QUALIFIERS
                ((:DESCRIPTION
                  "DeltaReplicaPool indicates that a specialized pool is required as a container for delta replica elements. Values: Any: delta replicas can be created in any pool. Exclusive: one specialized, exclusive pool must be created for each source element that has associated delta replicas. Shared: one specialized, shared pool must be created to be shared by all source elements with associated delta replicas.")
                 (:VALUE-MAP ("2" "3" "4" ".." "0x8000.."))
                 (:VALUES
                  ("Any" "Exclusive" "Shared" "DMTF Reserved"
                   "Vendor Specific")))
                :INITFORM NIL)
               (REMOTEBUFFERELEMENTTYPE UINT16 :CIM-NAME
                "RemoteBufferElementType" :QUALIFIERS
                ((:DESCRIPTION
                  "Remote replication buffer elements are instances of CIM_Memory. A buffer element may be created from a component extent with a BasedOn association or in a storage pool with an AllocatedFromStoragePool association. The provider can also make the size and element type opaque to a client. Values: 
Not specified: client allows provider to determine size and container element type. 
InExtent: buffer must be created from passed component extent. 
InPool: buffer must be created in passed pool.")
                 (:VALUE-MAP ("0" "2" "3" ".." "0x8000.."))
                 (:VALUES
                  ("Not specified" "InExtent" "InPool" "DMTF Reserved"
                   "Vendor Specific")))
                :INITFORM NIL)
               (REMOTEBUFFERHOST UINT16 :CIM-NAME "RemoteBufferHost"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Array provider may require multiple buffer elements per array instance as indicated by this property. Values: 
Array: one buffer element for the entire array. 
ComponentCS: one buffer element per ComputerSystem element in a clustered array. 
Pipe: one or two buffer elements per replication pipe.")
                 (:VALUE-MAP ("2" "3" "4" ".." "0x8000.."))
                 (:VALUES
                  ("Array" "ComponentCS" "Pipe" "DMTF Reserved"
                   "Vendor Specific")))
                :INITFORM NIL)
               (REMOTEBUFFERLOCATION UINT16 :CIM-NAME "RemoteBufferLocation"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property allows the provider to indicate the required location for remote buffer elements. Values: 
Source: buffer needed only on platforms hosting source elements. 
Target: buffer needed only on platforms hosting target elements. 
Both: buffers needed for both source and target platforms.")
                 (:VALUE-MAP ("2" "3" "4" ".." "0x8000.."))
                 (:VALUES
                  ("Source" "Target" "Both" "DMTF Reserved"
                   "Vendor Specific")))
                :INITFORM NIL)
               (REMOTEBUFFERSUPPORTED UINT16 :CIM-NAME "RemoteBufferSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Peer may require a write buffer for remote replica elements with async I/O buffering. Typically used to increase remote mirror replication engine performance while maintaining high availability. Values: 
Required: must have buffer if any Async remote replicas are created. 
Optional: may have buffer if any Async remote replicas are created.")
                 (:VALUE-MAP ("0" "2" "3" ".." "0x8000.."))
                 (:VALUES
                  ("Not Supported" "Required" "Optional" "DMTF Reserved"
                   "Vendor Specific")))
                :INITFORM NIL)
               (USEREPLICATIONBUFFERDEFAULT UINT16 :CIM-NAME
                "UseReplicationBufferDefault" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicate if an async remote replica pair is allowed to use a write buffer for asynchronous write buffering. - Not Managed: use or not of the buffer is up to the implementation. - Use Buffer: use of a buffer is required. - Do Not Use Buffer: a buffer shall not be used.")
                 (:VALUE-MAP ("0" "1" "2" ".." "0x8000.."))
                 (:VALUES
                  ("Not Managed" "Use Buffer" "Do Not Use Buffer"
                   "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (PEERCONNECTIONPROTOCOL STRING :CIM-NAME
                "PeerConnectionProtocol" :QUALIFIERS
                ((:DESCRIPTION
                  "Peer connection protocol is a private, vendor-specific protocol for replication data transport. A client verifies that two peers support the same protocol before establishing a peer-to-peer connection."))
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
                 (:VALUE-MAP ("2" "3" "4" "5" "6" "7" "8" ".."))
                 (:VALUES
                  ("Local Replica Creation" "Remote Replica Creation"
                   "Local Replica Modification" "Remote Replica Modification"
                   "Local Replica Attachment" "Remote Replica Attachment"
                   "Buffer Creation" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageReplicationCapabilities.SupportedSynchronousActions")))
                :INITFORM NIL)
               (SUPPORTEDSYNCHRONOUSACTIONS (ARRAY UINT16) :CIM-NAME
                "SupportedSynchronousActions" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating what operations will be executed without the creation of a job. If an operation is included in both this and SupportedAsynchronousActions then the underlying instrumentation is indicating that it may or may not create a job.")
                 (:VALUE-MAP ("2" "3" "4" "5" "6" "7" "8" "9" ".."))
                 (:VALUES
                  ("Local Replica Creation" "Remote Replica Creation"
                   "Local Replica Modification" "Remote Replica Modification"
                   "Local Replica Attachment" "Remote Replica Attachment"
                   "Buffer Creation" "NetworkPipe Creation" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageReplicationCapabilities.SupportedAsynchronousActions")))
                :INITFORM NIL)
               (SUPPORTEDSPECIALIZEDELEMENTS (ARRAY UINT16) :CIM-NAME
                "SupportedSpecializedElements" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating which specialized storage element types are supported by this instance of StorageReplicationCapabilities. Specialized types are indicated by the value of the IntendedUsage in StorageSetting.")
                 (:VALUE-MAP
                  ("2" "3" "4" "5" "6" "7" "8" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("Delta Pool" "Delta Pool Component" "Remote Mirror"
                   "Local Mirror" "Full Snapshot" "Delta Snapshot"
                   "Replication Buffer" "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (SUPPORTEDMODIFYOPERATIONS (ARRAY UINT16) :CIM-NAME
                "SupportedModifyOperations" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating which ModifySynchronization operations are supported by this instance of StorageReplicationCapabilities.")
                 (:VALUE-MAP
                  ("2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" ".."
                   "0x8000..0xFFFF"))
                 (:VALUES
                  ("Detach" "Fracture" "Resync" "Restore" "Prepare" "Unprepare"
                   "Quiesce" "Unquiesce" "Reset To Sync" "Reset To Async"
                   "Start Copy" "Stop Copy" "DMTF Reserved" "Vendor Specific"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageConfigurationService.ModifySynchronization")))
                :INITFORM NIL)
               (HOSTACCESSIBLESTATE (ARRAY UINT16) :CIM-NAME
                "HostAccessibleState" :QUALIFIERS
                ((:DESCRIPTION
                  "Lists the replica synchronization states in which the provider allows host access to replicas. Accessibility does not guarantee replica contents are valid or consistent.")
                 (:VALUE-MAP
                  ("2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" ".." "0x8000.."))
                 (:VALUES
                  ("Initialized" "Prepare In Progress" "Prepared"
                   "Resync In Progress" "Synchronized" "Fracture In Progress"
                   "Quiesce In Progress" "Quiesced" "Restore In Progress"
                   "Idle" "Broken" "Fractured" "Frozen" "Copy In Progress"
                   "DMTF Reserved" "Vendor Specific"))
                 (:MODEL-CORRESPONDENCE ("CIM_StorageSynchronized.SyncState")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_StorageReplicationCapabilities")
              (:QUALIFIERS (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageServices")
               (:DESCRIPTION
                "This subclass defines the replication capabilities of a StorageConfigurationService. Multiple instances of StorageReplicationCapabilities may be associated with a StorageConfigurationService using ElementCapabilities. A provider should create one instance for each supported SynchronizationType.")))