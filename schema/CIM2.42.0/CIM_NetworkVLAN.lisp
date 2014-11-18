
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_NetworkVLAN.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_NETWORKVLAN (CIM_CONNECTIVITYCOLLECTION)
              ((VLANID UINT16 :CIM-NAME "VLANId" :QUALIFIERS
                ((:DESCRIPTION "A 12-bit VLAN ID used in the VLAN Tag header.")
                 (:MIN-VALUE "1") (:MAX-VALUE "4094")
                 (:MAPPING-STRINGS ("MIB.IETF|Q-BRIDGE-MIB.VlanId")))
                :INITFORM NIL)
               (SAIDENTIFIER UINT32 :CIM-NAME "SAIdentifier" :QUALIFIERS
                ((:DESCRIPTION
                  "The value of the 802.10 SAID field which would be used for this VLAN."))
                :INITFORM NIL)
               (TRANSMISSIONSIZE SINT32 :CIM-NAME "TransmissionSize"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The value of this property is set to a positive integer when the value of the MTU for all members (switch endpoints/endstationendpoints of the VLAN is the same, otherwise is set to -1 and the Transmission size is set on each of the individual endpoints."))
                :INITFORM NIL)
               (TYPEOFMEDIA UINT16 :CIM-NAME "TypeOfMedia" :QUALIFIERS
                ((:DESCRIPTION
                  "Defines/restricts the media type of the VLAN. This information is also needed when a VLAN is not yet associated to any end point.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5..16000" ".."))
                 (:VALUES
                  ("Unknown" "Other" "Not Applicable" "Ethernet" "FDDI"
                   "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NetworkVLAN.OtherTypeDescription")))
                :INITFORM NIL)
               (OTHERTYPEDESCRIPTION STRING :CIM-NAME "OtherTypeDescription"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the type of media that is supported by this VLAN, when the value of the Type property is set to 1 (i.e., \"Other\"). This property should be set to NULL when the Type property is any value other than 1.")
                 (:MODEL-CORRESPONDENCE ("CIM_NetworkVLAN.TypeOfMedia")))
                :INITFORM NIL)
               (CONNECTIVITYSTATUS UINT16 :CIM-NAME "ConnectivityStatus"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration describing the current or potential connectivity between endpoints in this collection. Connectivity may be provided or not, or may be in a degraded/partitioned state if one or more endpoints or links have failed. The latter would prevent full connectivity between all elements in the Collection, but would permit connectivity between subsets.")
                 (:VALUE-MAP ("0" "2" "3" "4"))
                 (:VALUES
                  ("Unknown" "Connectivity/Up" "No Connectivity/Down"
                   "Partitioned")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> must include a unique name. It can be a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID. Or, it could be a registered ID that is assigned to the business entity by a recognized global authority.(This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> must not contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity must ensure that the resulting InstanceID is not re-used as any of InstanceIDs produced by this or other providers for the NameSpace of this instance. 
For DMTF-defined instances, the 'preferred' algorithm must be used with the <OrgID> set to 'CIM'."))
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
              (:CIM-NAME "CIM_NetworkVLAN")
              (:QUALIFIERS (:VERSION "2.26.0")
               (:UML-PACKAGE-PATH "CIM::Network::VLAN")
               (:DESCRIPTION
                "An instance of NetworkVLAN represents a collection of VLANSwitchEndpoints and/or VLANEndstationEndpoints which are members of the VLAN. There SHOULD be an instance of NetworkVLAN for every VLAN available in a switch. For example, in a switch with port-based VLANs, if there are 16 VLANs to which ports can be assigned (VLAN 1 through VLAN 16), there SHOULD be an instance of NetworkVLAN for each of VLAN 1 through VLAN 16.")))