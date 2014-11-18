
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Zone.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ZONE (CIM_CONNECTIVITYCOLLECTION)
              ((ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName") :WRITE
                 (:DESCRIPTION
                  "A user-friendly name for the Zone that is unique within the AdminDomain."))
                :INITFORM NIL)
               (ACTIVE BOOLEAN :CIM-NAME "Active" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "Indicates that this Zone is currently active (that is, under enforcement of a fabric). This property can be used to distinguish between a Zone that is currently active and a snapshot of a Zone (with the same InstanceName) that is for \"offline\" editing."))
                :INITFORM NIL)
               (ZONETYPE UINT16 :CIM-NAME "ZoneType" :QUALIFIERS
                (:REQUIRED (:DESCRIPTION "The type of zoning to be enforced.")
                 (:VALUE-MAP ("0" "1" "2" "3" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "Default" "Protocol" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_Zone.OtherZoneTypeDescription")))
                :INITFORM NIL)
               (OTHERZONETYPEDESCRIPTION STRING :CIM-NAME
                "OtherZoneTypeDescription" :QUALIFIERS
                ((:DESCRIPTION
                  "A string that describes the ZoneType when the ZoneType value is 1 \"Other\".")
                 (:MODEL-CORRESPONDENCE ("CIM_Zone.ZoneType")))
                :INITFORM NIL)
               (ZONESUBTYPE UINT16 :CIM-NAME "ZoneSubType" :QUALIFIERS
                ((:DESCRIPTION
                  "Specific clarification to be used when the ProtocolType has an enumeration that requires it. Specifically, if ProtocolType is \"Protocol\", then SubType is the Fibre Channel FC4 type.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "SCSI" "VI" "IP" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Zone.OtherZoneSubTypeDescription")))
                :INITFORM NIL)
               (OTHERZONESUBTYPEDESCRIPTION STRING :CIM-NAME
                "OtherZoneSubTypeDescription" :QUALIFIERS
                ((:DESCRIPTION
                  "A string that describes the ZoneSubType when the ZoneSubType value is 1 \"Other\".")
                 (:MODEL-CORRESPONDENCE ("CIM_Zone.ZoneSubType")))
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
                :INITFORM NIL))
              (:CIM-NAME "CIM_Zone")
              (:QUALIFIERS (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::FC")
               (:DESCRIPTION
                "A Zone is a group of Ports, Endpoints, Nodes, Zones, and NamedAddressCollections that are managed collectively by the same domain. The managing domain is indicated by the HostedCollection association. For Fibre Channel, a Zone indicates a set of members that are participating together in the fabric.")))