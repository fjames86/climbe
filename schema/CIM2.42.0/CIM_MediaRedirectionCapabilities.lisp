
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MediaRedirectionCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MEDIAREDIRECTIONCAPABILITIES
              (CIM_REDIRECTIONSERVICECAPABILITIES)
              ((ELEMENTNAMEEDITSUPPORTED BOOLEAN :CIM-NAME
                "ElementNameEditSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether the ElementName can be modified.")
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.INCITS-T11|SWAPI_UNIT_CONFIG_CAPS_T|EditName"))
                 (:MODEL-CORRESPONDENCE ("CIM_ManagedElement.ElementName")))
                :INITFORM NIL)
               (MAXELEMENTNAMELEN UINT16 :CIM-NAME "MaxElementNameLen"
                :QUALIFIERS
                ((:DESCRIPTION "Maximum supported ElementName length.")
                 (:MAX-VALUE "256")
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.INCITS-T11|SWAPI_UNIT_CONFIG_CAPS_T|MaxNameChars"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_FCSwitchCapabilities.ElementNameEditSupported"
                   "CIM_EnabledLogicalElementCapabilities.ElementNameMask")))
                :INITFORM NIL)
               (ELEMENTNAMEMASK STRING :CIM-NAME "ElementNameMask" :QUALIFIERS
                ((:DESCRIPTION
                  "This string expresses the restrictions on ElementName.The mask is expressed as a regular expression.See DMTF standard ABNF with the Management Profile Specification Usage Guide, appendix C for the regular expression syntax permitted. 
Since the ElementNameMask can describe the maximum length of the ElementName,any length defined in the regexp is in addition to the restriction defined in MaxElementNameLen (causing the smaller value to be the maximum length) The ElementName value satisfies the restriction, if and only if it matches the regular expression")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElementCapabilities.MaxElementNameLen")))
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
               (CONNECTIONMODESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "ConnectionModesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "The connection mode used to configure the session. A value set to 2 = \"Listen\" shall indicate that the SAP will listen for a connection request from the remote Media redirection server. A CIM_BindsTo association to a CIM_ProtocolEndoint may be used to represent where the SAP is listening for the connection request. A value set to 3 = \"Connect\" shall indicate that the the SAP shall initiate the connection to the remote Media redirection server. A CIM_RemoteAccessAvailableToElement association to a CIM_RemoteServiceAccessPoint may be used to represent where the SAP shall connect to the remote Media redirection server.")
                 (:VALUE-MAP ("0" "2" "3" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "Listen" "Connect" "DMTF Reserved"
                   "Vendor Specified"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_MediaRedirectionSAP.ConnectionMode")))
                :INITFORM NIL)
               (DEVICESSUPPORTED (ARRAY UINT16) :CIM-NAME "DevicesSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the types of Media Devices which are supported by the Media Redirection Service. Note that each entry of this array is related to the entry in the MaxDevicesSupported array that is located at the same index.")
                 (:VALUE-MAP
                  ("0" "2" "3" "4" "5" "6" "7" "8" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "CIM_CDROMDrive" "CIM_DiskDrive"
                   "CIM_DisketteDrive" "CIM_DVDDrive" "CIM_MagnetoOpticalDrive"
                   "CIM_TapDrive" "CIM_WORMDrive" "DMTF_ Reserved"
                   "Vendor_ Specified"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_MediaRedirectionCapabilities.MaxDevicesSupported")))
                :INITFORM NIL)
               (MAXDEVICESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "MaxDevicesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the number of Media devices which are supported for the devices specified in the DevicesSupported array property. Note that each entry of this array is related to the entry in the DevicesSupported that is located at the same index.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_MediaRedirectionCapabilities.DevicesSupported")))
                :INITFORM NIL)
               (MAXDEVICESPERSAP (ARRAY UINT16) :CIM-NAME "MaxDevicesPerSAP"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the number of Media devices per MediaRedirection Session which are supported for the devices specified in the DevicesSupported array property. Note that each entry of this array is related to the engry in the DevicesSupported array that is located at the same index.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_MediaRedirectionCapabilities.DevicesSupported")))
                :INITFORM NIL)
               (SAPCAPABILITIESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "SAPCapabilitiesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the whether instances of USBRedirectionSAPs already exist and whether whether SAPs can be created. A value set to 2 = \"Modify Timeouts\" shall indicate that the timeout parameters of instances of CIM_USBRedirectionSAP can be modified by applications using 'ModifyInstance'")
                 (:VALUE-MAP ("0" "2" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "Modify SAP" "DMTF Reserved" "Vendor Specified")))
                :INITFORM NIL)
               (INFOFORMATSSUPPORTED (ARRAY UINT16) :CIM-NAME
                "InfoFormatsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating which of the formats for CIM_RemoteServiceAccessPoint.InfoFormat are supported by the Media Redirection Service.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "10" "11" "12" "13" "100" "101"
                   "102" "200" "201" "202" "203" "204" "205" ".."
                   "32768..65535"))
                 (:VALUES
                  ("Other" "Host Name" "IPv4 Address" "IPv6 Address"
                   "IPX Address" "DECnet Address" "SNA Address"
                   "IPv4 Subnet Address" "IPv6 Subnet Address"
                   "IPv4 Address Range" "IPv6 Address Range" "Dial String"
                   "Ethernet Address" "Token Ring Address" "URL" "FQDN"
                   "User FQDN" "DER ASN1 DN" "DER ASN1 GN" "Key ID"
                   "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RemoteServiceAccessPoint.InfoFormat")))
                :INITFORM NIL)
               (SHARINGMODESUPPORTED (ARRAY UINT16) :CIM-NAME
                "SharingModeSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "SharingModeSupported indicates the possible values to which the SharingMode of the associated RedirectionService can be set.")
                 (:VALUE-MAP ("0" "2" "3" ".."))
                 (:VALUES ("Unknown" "Exclusive" "Shared" "DMTF Reserved")))
                :INITFORM NIL)
               (REQUESTEDSTATESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "RequestedStatesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "RequestedStatesSupported indicates the possible states that can be requested when using the method RequestStateChange on the EnabledLogicalElement.")
                 (:VALUE-MAP ("2" "3" "4" "6" "7" "8" "9" "10" "11"))
                 (:VALUES
                  ("Enabled" "Disabled" "Shut Down" "Offline" "Test" "Defer"
                   "Quiesce" "Reboot" "Reset"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.RequestStateChange")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_MediaRedirectionCapabilities")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Network::MediaRedirection")
               (:DESCRIPTION
                "MediaRedirectionCapabilities describes the capabilities of the Media Redirection Service.")))