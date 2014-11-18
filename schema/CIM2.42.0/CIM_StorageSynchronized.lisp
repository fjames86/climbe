
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_StorageSynchronized.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_STORAGESYNCHRONIZED (CIM_SYNCHRONIZED)
              ((COPYTYPE UINT16 :CIM-NAME "CopyType" :QUALIFIERS
                ((:DESCRIPTION
                  "CopyType describes the Replication Policy. Values are: 
Async: create and maintain an asynchronous copy of the source. 
Sync: create and maintain a synchronized copy of the source. 
UnSyncAssoc: create an unsynchronized copy and maintain an association to the source.")
                 (:VALUE-MAP ("2" "3" "4" ".." "0x8000.."))
                 (:VALUES
                  ("Async" "Sync" "UnSyncAssoc" "DMTF Reserved"
                   "Vendor Specific")))
                :INITFORM NIL)
               (REPLICATYPE UINT16 :CIM-NAME "ReplicaType" :QUALIFIERS
                ((:DESCRIPTION
                  "ReplicaType provides information on how the Replica is being maintained. Values are: 
Full Copy: This indicates that a full copy of the source object is (or will be) generated . 
Before Delta: This indicates that the source object will be maintained as a delta data from the replica. 
After Delta: This indicates that the replica will be maintained as delta data from the source object. 
Log: This indicates that the replica object is being maintained as a log of changes to the source. 
Not Specified: The method of maintaining the copy is not specified.")
                 (:VALUE-MAP ("0" "2" "3" "4" "5" ".." "0x8000.."))
                 (:VALUES
                  ("Not Specified" "Full Copy" "Before Delta" "After Delta"
                   "Log" "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (SYNCSTATE UINT16 :CIM-NAME "SyncState" :QUALIFIERS
                ((:DESCRIPTION
                  "SyncState describes the state of the association with respect to Replication activity. Values are: 
Initialized: The link to enable replication is established. 
PrepareInProgress: Preparation for Replication is in progress. 
Prepared: All necessary preparation has completed. 
ResyncInProgress: Synchronization or Resynchronization is in progress. 
This may be the initial 'copy' or subsequent changes being copied. 
Synchronized: An Async or Sync replication is currently synchronized. When this value is set, SyncMaintained will be true. 
FractureInProgress: An operation to fracture an Async or Sync replication is in progress. 
Fractured: An Async or Sync replication is fractured. 
QuiesceInProgress: A quiesce operation is in progress. 
Quiesced: The replication has been quiesced and is ready for a change. 
RestoreInProgress: An operation is in progress to copy the Synced object to the System object. 
Idle: The 'normal' state for an UnSyncAssoc replica. 
Broken: The relationship is non-functional due to errors in the source, the target, the path between the two or space constraints.")
                 (:VALUE-MAP
                  ("2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" ".."
                   "0x8000.."))
                 (:VALUES
                  ("Initialized" "PrepareInProgress" "Prepared"
                   "ResyncInProgress" "Synchronized" "Fracture In Progress"
                   "QuiesceInProgress" "Quiesced" "Restore In Progresss" "Idle"
                   "Broken" "Fractured" "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (WHENSYNCED DATETIME :CIM-NAME "WhenSynced" :QUALIFIERS
                ((:DESCRIPTION
                  "The point in time that the Elements were synchronized."))
                :INITFORM NIL)
               (SYNCMAINTAINED BOOLEAN :CIM-NAME "SyncMaintained" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether synchronization is maintained."))
                :INITFORM NIL)
               (SYSTEMELEMENT NIL :CIM-NAME "SystemElement" :QUALIFIERS
                ((:OVERRIDE "SystemElement")
                 (:DESCRIPTION
                  "SystemElement represents the Storage that is the source of the replication.")
                 :KEY)
                :INITFORM "CIM_ManagedElement")
               (SYNCEDELEMENT NIL :CIM-NAME "SyncedElement" :QUALIFIERS
                ((:OVERRIDE "SyncedElement")
                 (:DESCRIPTION
                  "SyncedElement represents the Storage that is the target of the replication.")
                 :KEY)
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_StorageSynchronized")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageServices")
               (:DESCRIPTION
                "Indicates that two Storage objects were replicated at the specified point in time. If the CopyType property is set to 'Sync' (=3), then synchronization of the Storage objects is preserved.")))