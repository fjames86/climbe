
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ZoneCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ZONECAPABILITIES (CIM_CAPABILITIES)
              ((ZONENAMEMAXLEN UINT32 :CIM-NAME "ZoneNameMaxLen" :QUALIFIERS
                ((:DESCRIPTION
                  "The maximum length for the Zone Name that the AdminDomain is capable of supporting."))
                :INITFORM NIL)
               (ZONENAMEFORMAT UINT16 :CIM-NAME "ZoneNameFormat" :QUALIFIERS
                ((:DESCRIPTION
                  "The ZoneNameFormat supported by the AdminDomain.")
                 (:VALUE-MAP ("0" "2" "3" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Numeric" "Alpha Numeric" "DMTF Reserved"
                   "Vendor Reserved")))
                :INITFORM NIL)
               (MAXNUMZONESETS UINT32 :CIM-NAME "MaxNumZoneSets" :QUALIFIERS
                ((:DESCRIPTION
                  "The maximum number of ZoneSets that the AdminDomain is capable of supporting."))
                :INITFORM NIL)
               (MAXNUMZONE UINT32 :CIM-NAME "MaxNumZone" :QUALIFIERS
                ((:DESCRIPTION
                  "The maximum number of Zones that the AdminDomain is capable of supporting."))
                :INITFORM NIL)
               (MAXNUMZONEMEMBERS UINT32 :CIM-NAME "MaxNumZoneMembers"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The maximum number of ZoneMembers that the AdminDomain is capable of supporting."))
                :INITFORM NIL)
               (MAXNUMZONESPERZONESET UINT32 :CIM-NAME "MaxNumZonesPerZoneSet"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The maximum number of Zones per ZoneSet that the AdminDomain is capable of supporting."))
                :INITFORM NIL)
               (MAXNUMZONEALIASES UINT32 :CIM-NAME "MaxNumZoneAliases"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The maximum number of ZoneAliases that the AdminDomain is capable of supporting."))
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
               (OTHERSUPPORTEDCONNECTIVITYMEMBERTYPES (ARRAY STRING) :CIM-NAME
                "OtherSupportedConnectivityMemberTypes" :QUALIFIERS
                ((:DESCRIPTION
                  "In case one of the array elements for SupportedConnectivityMemberTypes has a value of 1, i.e Other, then this array lists the Other Supported Connectivity Member Types."))
                :INITFORM NIL)
               (SUPPORTEDCONNECTIVITYMEMBERTYPES (ARRAY UINT16) :CIM-NAME
                "SupportedConnectivityMemberTypes" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of enumerated integers that describe the supported Zone Member Types. For example, a vendor supporting only Permanent Address and Network Address as Zone Member Types would need to return an array of 2 elements, with the values 2 & 3.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Other" "Permanent Address" "Network Address"
                   "Switch Port ID" "Logical Port Group"
                   "Connectivity Collection" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed"))
                :INITFORM NIL))
              (:CIM-NAME "CIM_ZoneCapabilities")
              (:QUALIFIERS (:VERSION "2.23.0")
               (:UML-PACKAGE-PATH "CIM::Device::FC")
               (:DESCRIPTION
                "ZoneCapabilities exposes the capabilities for zoning of an AdminDomain.")))