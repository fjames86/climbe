
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_VirtualSystemSnapshotServiceCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_VIRTUALSYSTEMSNAPSHOTSERVICECAPABILITIES (CIM_CAPABILITIES)
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
               (SYNCHRONOUSMETHODSSUPPORTED (ARRAY UINT16) :CIM-NAME
                "SynchronousMethodsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration of method identifiers each identifying a method of class CIM_VirtualSystemSnapshotService that is supported synchronously by the implementation.")
                 (:VALUE-MAP ("2" "3" "4" ".."))
                 (:VALUES
                  ("CreateSnapshotSupported" "DestroySnapshotSupported"
                   "ApplySnapshotSupported" "DMTF Reserved")))
                :INITFORM NIL)
               (AYNCHRONOUSMETHODSSUPPORTED (ARRAY UINT16) :CIM-NAME
                "AynchronousMethodsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration of method identifiers each identifying a method of class CIM_VirtualSystemSnapshotService that is supported synchronously and asynchronously by the implementation.")
                 (:VALUE-MAP ("2" "3" "4" ".."))
                 (:VALUES
                  ("CreateSnapshotSupported" "DestroySnapshotSupported"
                   "ApplySnapshotSupported" "DMTF Reserved")))
                :INITFORM NIL)
               (SNAPSHOTTYPESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "SnapshotTypesSupported" :QUALIFIERS
                ((:DESCRIPTION "Supported snapshot types:
Full Snapshot: Complete snapshot of the virtual system.
Disk Snapshot: Snapshot of virtual system disks.")
                 (:VALUE-MAP ("2" "3" ".." "32768..65535"))
                 (:VALUES
                  ("Full Snapshot" "Disk Snapshot" "DMTF Reserved"
                   "Vendor Specific"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_VirtualSystemSnapshotService.CreateSnapshot(SnapshotType)"
                   "CIM_VirtualSystemSnapshotCapabilities.SnapshotTypesEnabled")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_VirtualSystemSnapshotServiceCapabilities")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Core::Virtualization")
               (:DESCRIPTION
                "The CIM_VirtualSystemSnapshotServiceCapabilities class defines the properties that describe the capabilities of a virtual system snapshot service, like for example which snapshot operations are implemented.")))