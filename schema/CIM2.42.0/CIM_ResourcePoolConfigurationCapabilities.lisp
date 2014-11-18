
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ResourcePoolConfigurationCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_RESOURCEPOOLCONFIGURATIONCAPABILITIES (CIM_CAPABILITIES)
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
               (ASYNCHRONOUSMETHODSSUPPORTED (ARRAY UINT32) :CIM-NAME
                "AsynchronousMethodsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "This property reflects the methods of the associated service class that are supported that may return a Job.")
                 (:VALUE-MAP ("2" "3" "4" "5" "6" "7" ".." "32768..65535"))
                 (:VALUES
                  ("CreateResourcePool is supported"
                   "CreateChild ResourcePool is supported"
                   "DeleteResourcePool is supported"
                   "AddResourcesToResourcePool is supported"
                   "RemoveResourcesFromResourcePool is supported"
                   "ChangeParentResourcePool is supported" "DMTF Reserved"
                   "Vendor Reserved")))
                :INITFORM NIL)
               (SYNCHRONOUSMETHODSSUPPORTED (ARRAY UINT32) :CIM-NAME
                "SynchronousMethodsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "This property reflects the methods of the associated service class that are supported andblock until completed (no Job is returned.)")
                 (:VALUE-MAP ("2" "3" "4" "5" "6" "7" ".." "32768..65535"))
                 (:VALUES
                  ("CreateResourcePool is supported"
                   "CreateChild ResourcePool is supported"
                   "DeleteResourcePool is supported"
                   "AddResourcesToResourcePool is supported"
                   "RemoveResourcesFromResourcePool is supported"
                   "CIM_ChangeParentResourcePool is supported" "DMTF Reserved"
                   "Vendor Reserved")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_ResourcePoolConfigurationCapabilities")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Core::Resource")
               (:DESCRIPTION
                "This class exposes the supported capabilities of a ResourcePoolConfigurationService. Not all implementations will support all methods on the service. Clients may use instances of this class to determine which methods are supported. The same method must not be listed in both lists. Implementations must either be non-blocking and use a Job for long running operations, or always block until the operation completes.")))