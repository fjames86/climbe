
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_USBRedirectionCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_USBREDIRECTIONCAPABILITIES
              (CIM_REDIRECTIONSERVICECAPABILITIES)
              ((SINGLECLASSPERSAP BOOLEAN :CIM-NAME "SingleClassPerSAP"
                :QUALIFIERS
                ((:DESCRIPTION
                  "SingleClassPerSAP indicates that only instances of CIM_USBDevice whose ClassCode property have the same value as each other shall be associated with the instances of CIM_USBRedirectionSAP.")
                 (:MODEL-CORRESPONDENCE ("CIM_USBDevice.ClassCode")))
                :INITFORM NIL)
               (ELEMENTNAMEEDITSUPPORTED BOOLEAN :CIM-NAME
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
                  "The connection mode used to configure the session. A value set to 2 = \"Listen\" shall indicate that the SAP will listen for a connection request from the remote USB redirection server. A CIM_BindsTo association to a CIM_ProtocolEndoint may be used to represent where the SAP is listening for the connection request. A value set to 3 = \"Connect\" shall indicate that the the SAP shall initiate the connection to the remote USB redirection server. A CIM_RemoteAccessAvailableToElement association to a CIM_RemoteServiceAccessPoint may be used to represent where the SAP shall connect to the remote USB redirection server.")
                 (:VALUE-MAP ("0" "2" "3" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "Listen" "Connect" "DMTF Reserved"
                   "Vendor Specified"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_USBRedirectionSAP.ConnectionMode")))
                :INITFORM NIL)
               (USBVERSIONSSUPPORTED (ARRAY UINT16) :CIM-NAME
                "USBVersionsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the USB specification versions which are supported. The property is expressed as a Binary-Coded Decimal (BCD) where a decimal point is implied between the 2nd and 3rd digits. For example, a value of 0x0201 indicates that version 2.01 is supported. Note that each entry of this array is related to the entries of the ClassesSupported, SubClassesSupported, MaxDevicesSupported and MaxDevicesPerSAP arrays that are located at the same index.")
                 (:ARRAYTYPE "Indexed")
                 (:MAPPING-STRINGS
                  ("Universal Serial Bus Specification.USB-IF|Standard Device Descriptor|bcdUSB"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_USBDevice.USBVersion"
                   "CIM_USBRedirectionCapabilities.ClassesSupported"
                   "CIM_USBRedirectionCapabilities.SubClassesSupported"
                   "CIM_USBRedirectionCapabilities.MaxDevicesSupported"
                   "CIM_USBRedirectionCapabilities.MaxDevicesPerSAP")))
                :INITFORM NIL)
               (CLASSESSUPPORTED (ARRAY UINT8) :CIM-NAME "ClassesSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the USB Device Classes which are supported. Note that each entry of this array is related to the entries of the USBVersionsSupported, SubClassesSupported, MaxDevicesSupported, and MaxDevicesPerSAP arrays that are located at the same index.")
                 (:ARRAYTYPE "Indexed")
                 (:MAPPING-STRINGS
                  ("Universal Serial Bus Specification.USB-IF|Standard Device Descriptor|bDeviceClass"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_USBDevice.ClassCode"
                   "CIM_USBRedirectionCapabilities.USBVersionsSupported"
                   "CIM_USBRedirectionCapabilities.SubClassesSupported"
                   "CIM_USBRedirectionCapabilities.MaxDevicesSupported"
                   "CIM_USBRedirectionCapabilities.MaxDevicesPerSAP")))
                :INITFORM NIL)
               (SUBCLASSESSUPPORTED (ARRAY UINT8) :CIM-NAME
                "SubClassesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the USB Device SubClasses which are supported. Note that each entry of this array is related to the entries of the USBVersionsSupported, ClassesSupproted, MaxDevicesSupported, and MaxDevicesPerSAP arrays that are located at the same index.")
                 (:ARRAYTYPE "Indexed")
                 (:MAPPING-STRINGS
                  ("Universal Serial Bus Specification.USB-IF|Standard Device Descriptor|bDeviceSubClass"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_USBDevice.SubclassCode"
                   "CIM_USBRedirectionCapabilities.USBVersionsSupported"
                   "CIM_USBRedirectionCapabilities.ClassesSupported"
                   "CIM_USBRedirectionCapabilities.MaxDevicesSupported"
                   "CIM_USBRedirectionCapabilities.MaxDevicesPerSAP")))
                :INITFORM NIL)
               (MAXDEVICESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "MaxDevicesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the number of USB devices which are supported for the devices specified in the USBVersionsSupported, ClassesSupported, and SubClassesSupported array properties. Note that each entry of this array is related to the entries in the USBVersionsSupported, ClassesSupported, and SubClassesSupported arrays that are located at the same index.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_USBRedirectionCapabilities.ClassesSupported"
                   "CIM_USBRedirectionCapabilities.USBVersionsSupported"
                   "CIM_USBRedirectionCapabilities.SubClassesSupported"
                   "CIM_USBRedirectionCapabilities.MaxDevicesPerSAP")))
                :INITFORM NIL)
               (MAXDEVICESPERSAP (ARRAY UINT16) :CIM-NAME "MaxDevicesPerSAP"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the number of USB devices per USB Redirection Session which are supported for the devices specified in the USBVersionsSupported, ClassesSupported, and SubClassesSupported array properties. Note that each entry of this array is related to the entries in the USBVersionsSupported, ClassesSupported, and SubClassesSupported arrays that are located at the same index.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_USBRedirectionCapabilities.MaxDevicesSupported"
                   "CIM_USBRedirectionCapabilities.USBVersionsSupported"
                   "CIM_USBRedirectionCapabilities.SubClassesSupported"
                   "CIM_USBRedirectionCapabilities.ClassesSupported")))
                :INITFORM NIL)
               (SAPCAPABILITIESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "SAPCapabilitiesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the whether instances of USBRedirectionSAPs already exist and whether whether SAPs can be created. A value set to 2 = \"Pre-Configured SAPs\" shall indicate that instances of CIM_USBRedirectionSAP exists which can be enabled. A value set to 3 = \"Create SAPs\" shall indicate that instances of CIM_USBRedirectionSAP can be created with the CreateDevice() and CreateSession() methods. A value set to 4 = \"Modify Timeouts\" shall indicate that the timeout parameters of instances of CIM_USBRedirectionSAP can be modified by applications using 'ModifyInstance'")
                 (:VALUE-MAP ("0" "2" "3" "4" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "Pre-Configured SAPs" "Create SAPs" "Modify SAP"
                   "DMTF Reserved" "Vendor Specified")))
                :INITFORM NIL)
               (REQUESTEDSTATESSUPPORTEDFORCREATEDSAP (ARRAY UINT16) :CIM-NAME
                "RequestedStatesSupportedForCreatedSAP" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the RequestedStatesSupported capabilities that may be used when creating a new SAP, if SAPCapabilitiesSupported has a value of 3, 'Create SAPs', otherwise ignored")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElementCapabilities.RequestedStatesSupported"
                   "CIM_USBRedirectionCapabilities.SAPCapabilitiesSupported")))
                :INITFORM NIL)
               (INFOFORMATSSUPPORTED (ARRAY UINT16) :CIM-NAME
                "InfoFormatsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating which of the formats for CIM_RemoteServiceAcccessPoint.InfoFormat are supported by the USB Redirection Service. When a USB Redirection Session is configured with ConnectionMode = 3 'Connect' the USB Redirection SAP needs to know the remote service access point to connect to. The CIM_RemoteServiceAccessPoint class is used to model this information. InfoFormat describes the address format for CIM_RemoteServiceAccessPoint.AccessInfo. which tells the local SAP where to find the USB redirection remote access point modeled by CIM_RemoteServiceAccessPoint. InfoFormatsSupported describes the AccessInfo formats that are supported by the local USB Redirection Service.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "100" "101" "102" "103" "104" "200" "201" "202" "203" "204"
                   "205" ".." "32768..65535"))
                 (:VALUES
                  ("Other" "Host Name" "IPv4 Address" "IPv6 Address"
                   "IPX Address" "DECnet Address" "SNA Address"
                   "Autonomous System Number" "MPLS Label"
                   "IPv4 Subnet Address" "IPv6 Subnet Address"
                   "IPv4 Address Range" "IPv6 Address Range" "Dial String"
                   "Ethernet Address" "Token Ring Address" "ATM Address"
                   "Frame Relay Address" "URL" "FQDN" "User FQDN" "DER ASN1 DN"
                   "DER ASN1 GN" "Key ID" "DMTF Reserved" "Vendor Reserved"))
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
              (:CIM-NAME "CIM_USBRedirectionCapabilities")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Network::USBRedirection")
               (:DESCRIPTION
                "USBRedirectionCapabilities describes the capabilities of the USB Redirection Service.")))