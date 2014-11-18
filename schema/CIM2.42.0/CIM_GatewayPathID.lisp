
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_GatewayPathID.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_GATEWAYPATHID (CIM_STORAGEHARDWAREID)
              ((GATEWAYID STRING :CIM-NAME "GatewayID" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The ID representing the Gateway for a path segment from the element identified in the HardwareID property to the Gateway.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_GatewayPathID.GatewayIDType"
                   "CIM_GatewayPathID.OtherGatewayIDType")))
                :INITFORM NIL)
               (GATEWAYIDTYPE UINT16 :CIM-NAME "GatewayIDType" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The type of the ID property. iSCSI GatewayIDs may use one of three iSCSI formats - iqn, eui, or naa. This three letter format is the name prefix; so a single iSCSI type is provided here, the prefix can be used to further refine the format.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Other" "PortWWN" "NodeWWN" "Hostname" "iSCSI Name"))
                 (:MODEL-CORRESPONDENCE ("CIM_GatewayPathID.GatewayID")))
                :INITFORM NIL)
               (OTHERGATEWAYIDTYPE STRING :CIM-NAME "OtherGatewayIDType"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The gateway ID type when Gateway IDType is \"Other\".")
                 (:MODEL-CORRESPONDENCE ("CIM_GatewayPathID.GatewayID")))
                :INITFORM NIL)
               (STORAGEID STRING :CIM-NAME "StorageID" :QUALIFIERS
                (:REQUIRED (:DESCRIPTION "The hardware worldwide unique ID.")
                 (:MAX-LEN "256")
                 (:MODEL-CORRESPONDENCE ("CIM_StorageHardwareID.IDType")))
                :INITFORM NIL)
               (IDTYPE UINT16 :CIM-NAME "IDType" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The type of the ID property. iSCSI IDs may use one of three iSCSI formats - iqn, eui, or naa. This three letter format is the name prefix; so a single iSCSI type is provided here, the prefix can be used to further refine the format.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" "6" "7"))
                 (:VALUES
                  ("Other" "PortWWN" "NodeWWN" "Hostname" "iSCSI Name"
                   "SwitchWWN" "SAS Address"))
                 (:MODEL-CORRESPONDENCE ("CIM_StorageHardwareID.StorageID")))
                :INITFORM NIL)
               (OTHERIDTYPE STRING :CIM-NAME "OtherIDType" :QUALIFIERS
                ((:DESCRIPTION "The ID type when IDType is \"Other\"."))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority. (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (CURRENTLYAUTHENTICATED BOOLEAN :CIM-NAME
                "CurrentlyAuthenticated" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether this Identity has been authenticated, and is currently known within the scope of an AuthenticationService or authority. By default, authenticity SHOULD NOT be assumed. This property is set and cleared by the security infrastructure, and should only be readable within the management infrastructure. Note that its value, alone, may not be sufficient to determine authentication/ authorization, in that properties of an Identity subclass (such as a security token or computer hardware port/ communication details) may be required by the security infrastructure."))
                :INITFORM "false")
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
              (:CIM-NAME "CIM_GatewayPathID")
              (:QUALIFIERS (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::StorageHardwareID")
               (:DESCRIPTION
                "GatewayPathID extends StorageHardwareID to name a path segment defined by the end identities, HardwareID and GatewayID. The purpose is to describe Identity to allow access control to be applied to a particular path segment. Think of the element identified by GatewayPathID as a Gateway between a non-trusted world and a trusted world.")))