
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DHCPSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DHCPSETTINGDATA (CIM_IPASSIGNMENTSETTINGDATA)
              ((ADDRESSORIGIN UINT16 :CIM-NAME "AddressOrigin" :QUALIFIERS
                ((:OVERRIDE "AddressOrigin")
                 (:DESCRIPTION
                  "AddressOrigin identifies the method by which the IP Address, Subnet Mask, and Gateway were assigned to the IPProtocolEndpoint. 
A value of 4 indicates that the values will be assigned via DHCP. See RFC 2131 and related. 
A value of 7 \"DHCPv6\" shall indicate the values will be assigned using DHCPv6. See RFC 3315.")
                 (:VALUE-MAP ("4" "7" ".." "32768.."))
                 (:VALUES ("DHCP" "DHCPv6" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IPProtocolEndpoint.AddressOrigin")))
                :INITFORM "4")
               (REQUESTEDIPV4ADDRESS STRING :CIM-NAME "RequestedIPv4Address"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A previously allocated IPv4 address for which the client is requesting re-allocation. This property is used in a client request (DHCPREQUEST) as the value of the ciaddr field. For AddressOrigin other than 4, this property shall be NULL.")
                 (:MAPPING-STRINGS ("RFC1541.IETF|Section 3.2"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IPProtocolEndpoint.IPv4Address")))
                :INITFORM NIL)
               (REQUESTEDLEASETIME UINT32 :CIM-NAME "RequestedLeaseTime"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property is used in a client request (DHCPREQUEST) to allow the client to request a lease time for the IP address. The value shall be specified as an interval at a granularity of seconds. This value corresponds to the value for code 51 as defined in RFC2132.")
                 (NIL "Seconds")
                 (:MAPPING-STRINGS ("RFC2132.IETF|Section 9.2"))
                 (:MODEL-CORRESPONDENCE ("CIM_DHCPProtocolEndpoint.LeaseTime"))
                 (:P-UNIT "second"))
                :INITFORM NIL)
               (CLIENTIDENTIFIER STRING :CIM-NAME "ClientIdentifier"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "This property is used by DHCP clients to specify their unique identifier. DHCP servers use this value to index their database of address bindings. This value is expected to be unique for all clients in an administrative domain. This corresponds to DHCP Option Code 61 as defined in RFC2132. 
While this value is an option and therefore could be expressed using the RequestedOption property, it differs from other properties in that it includes a value when specified from the client.")
                 (:MAPPING-STRINGS ("RFC2132.IETF|Section 9.14")))
                :INITFORM NIL)
               (VENDORCLASSIDENTIFIER STRING :CIM-NAME "VendorClassIdentifier"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "This property is used by DHCP clients to optionally identify the vendor type and configuration of a DHCP client. This corresponds to DHCP Option Code 60 as defined in RFC2132. While this is value is an option and therefore could be expressed using the RequestedOption property, it differs from other properties in that it includes a value when specified from the client.")
                 (:MAPPING-STRINGS ("RFC2132.IETF|Section 9.13")))
                :INITFORM NIL)
               (PROTOCOLIFTYPE UINT16 :CIM-NAME "ProtocolIFType" :QUALIFIERS
                ((:DESCRIPTION "An enumeration that describes the IP version.")
                 (:VALUE-MAP ("0" ".." "4096" "4097" "32768.."))
                 (:VALUES
                  ("Unknown" "DMTF Reserved" "IPv4" "IPv6" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ProtocolEndpoint.ProtocolIFType")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> must include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> must not contain a colon (:). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements. If the above \"preferred\" algorithm is not used, the defining entity must assure that the resulting InstanceID is not reused across any InstanceIDs produced by this or other providers for the NameSpace of this instance. 
For DMTF-defined instances, the \"preferred\" algorithm must be used with the <OrgID> set to CIM."))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "The user-friendly name for this instance of SettingData. In addition, the user-friendly name can be used as an index property for a search or query. (Note: The name does not have to be unique within a namespace.)"))
                :INITFORM NIL)
               (CHANGEABLETYPE UINT16 :CIM-NAME "ChangeableType" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating the type of setting. 0 \"Not Changeable - Persistent\" indicates the instance of SettingData represents primordial settings and shall not be modifiable. 1 \"Changeable - Transient\" indicates the SettingData represents modifiable settings that are not persisted. Establishing persistent settings from transient settings may be supported. 2 \"Changeable - Persistent\" indicates the SettingData represents a persistent configuration that may be modified. 3 \"Not Changeable - Transient\" indicates the SettingData represents a snapshot of the settings of the associated ManagedElement and is not persistent.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES
                  ("Not Changeable - Persistent" "Changeable - Transient"
                   "Changeable - Persistent" "Not Changeable - Transient")))
                :INITFORM NIL)
               (CONFIGURATIONNAME STRING :CIM-NAME "ConfigurationName"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An instance of CIM_SettingData may correspond to a well-known configuration that exists for an associated CIM_ManagedElement. If the ConfigurationName property is non-NULL, the instance of CIM_SettingData shall correspond to a well-known configuration for a Managed Element, the value of the ConfigurationName property shall be the name of the configuration, and the ChangeableType property shall have the value 0 or 2. A value of NULL for the ConfigurationName property shall mean that the instance of CIM_SettingData does not correspond to a well-known configuration for a Managed Element or that this information is unknown."))
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
               (REQUESTEDOPTIONS (ARRAY UINT16) :CIM-NAME "RequestedOptions"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The list of requested DHCP options which the client is capable of interpreting but not necessarily required for the client to operate properly. This list of DHCP options is for IPv4.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25"
                   "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37"
                   "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49"
                   "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61"
                   "62" "63" "64" "65" "66" "67" "68" "69" "70" "71" "72" "73"
                   "74" "75" "76" "77" "78" "79" "80" "81" "82..83" "84"
                   "85..118" "119" "120" "121..122" "123" "124..256" "257"
                   "258..32767" "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "Pad" "Subnet Mask" "Time Offset"
                   "Router Option" "Time Server" "Name Server"
                   "Domain Name Server" "Log Server" "Cookie Server"
                   "LPR Server" "Impress Server" "Resource Location Server"
                   "Host Name" "Boot File Size" "Merit Dump File" "Domain Name"
                   "Swap Server" "Root Path" "Extensions Path"
                   "IP Forwarding Enable/Disable"
                   "Non-Local Source Routing Enable/Disable" "Policy Filter"
                   "Maximum Datagram Reassembly Size" "Default IP Time-to-live"
                   "Path MTU Aging Timeout" "Path MTU Plateau Table"
                   "Interface MTU" "All Subnets are Local" "Broadcast Address"
                   "Perform Subnet Mask Discovery" "Mask Supplier"
                   "Perform Router Discovery" "Router Solicitation Address"
                   "Static Route" "Trailer Encapsulation" "ARP Cache Timeout"
                   "Ethernet Encapsulation" "TCP Default TTL"
                   "TCP Keepalive Interval" "TCP Keepalive Garbage"
                   "Network Information Service Domain"
                   "Network Information Servers"
                   "Network Time Protocol Servers"
                   "Vendor Specific Information"
                   "NetBIOS over TCP/IP Name Server"
                   "NetBIOS over TCP/IP Datagram Distribution Server"
                   "NetBIOS over TCP/IP Node Type" "NetBIOS over TCP/IP Scope"
                   "X Window System Font Server"
                   "X Window System Display Manager" "Requested IP Address"
                   "Lease Time" "Option Overload" "Message Type"
                   "Server Identifier" "Parameter Request List" "Error Message"
                   "Maximum Message Size" "Renewal (T1) Time"
                   "Rebinding (T2) Time" "Vendor Class Identifier"
                   "Client Identifier" "DMTF Reserved" "DMTF Reserved"
                   "Network Information Service+ Domain"
                   "Network Information Service+ Servers" "TFTP Server Name"
                   "Bootfile Name" "Mobile IP Home Agent"
                   "Simple Mail Transport Protocol (SMTP) Server"
                   "Post Office Protocol (POP3) Server"
                   "Network News Transport Protocol (NNTP) Server"
                   "Default World Wide Web (WWW) Server"
                   "Default Finger Server"
                   "Default Internet Relay Chat (IRC) Server"
                   "StreetTalk Server"
                   "StreetTalk Directory Assistance (STDA) Server" "User Class"
                   "SLP Directory Agent" "SLP Service Scope" "DMTF Reserved"
                   "Relay Agent Information" "DMTF Reserved"
                   "Name Service Search" "Subnet Selection" "DMTF Reserved"
                   "Classless Route" "DMTF Reserved" "End" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MAPPING-STRINGS
                  ("RFC2132.IETF" "RFC2937.IETF" "RFC3011.IETF" "RFC3046.IETF"
                   "RFC3004.IETF" "RFC2610.IETF" "RFC3442.IETF"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DHCPProtocolEndpoint.OptionsReceived")))
                :INITFORM NIL)
               (REQUIREDOPTIONS (ARRAY UINT16) :CIM-NAME "RequiredOptions"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The list of DHCP options required for the client to operate properly. This list of DHCP options is for IPv4.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25"
                   "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37"
                   "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49"
                   "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61"
                   "62" "63" "64" "65" "66" "67" "68" "69" "70" "71" "72" "73"
                   "74" "75" "76" "77" "78" "79" "80" "81" "82..83" "84"
                   "85..118" "119" "120" "121..122" "123" "124..256" "257"
                   "258..32767" "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "Pad" "Subnet Mask" "Time Offset"
                   "Router Option" "Time Server" "Name Server"
                   "Domain Name Server" "Log Server" "Cookie Server"
                   "LPR Server" "Impress Server" "Resource Location Server"
                   "Host Name" "Boot File Size" "Merit Dump File" "Domain Name"
                   "Swap Server" "Root Path" "Extensions Path"
                   "IP Forwarding Enable/Disable"
                   "Non-Local Source Routing Enable/Disable" "Policy Filter"
                   "Maximum Datagram Reassembly Size" "Default IP Time-to-live"
                   "Path MTU Aging Timeout" "Path MTU Plateau Table"
                   "Interface MTU" "All Subnets are Local" "Broadcast Address"
                   "Perform Subnet Mask Discovery" "Mask Supplier"
                   "Perform Router Discovery" "Router Solicitation Address"
                   "Static Route" "Trailer Encapsulation" "ARP Cache Timeout"
                   "Ethernet Encapsulation" "TCP Default TTL"
                   "TCP Keepalive Interval" "TCP Keepalive Garbage"
                   "Network Information Service Domain"
                   "Network Information Servers"
                   "Network Time Protocol Servers"
                   "Vendor Specific Information"
                   "NetBIOS over TCP/IP Name Server"
                   "NetBIOS over TCP/IP Datagram Distribution Server"
                   "NetBIOS over TCP/IP Node Type" "NetBIOS over TCP/IP Scope"
                   "X Window System Font Server"
                   "X Window System Display Manager" "Requested IP Address"
                   "Lease Time" "Option Overload" "Message Type"
                   "Server Identifier" "Parameter Request List" "Error Message"
                   "Maximum Message Size" "Renewal (T1) Time"
                   "Rebinding (T2) Time" "Vendor Class Identifier"
                   "Client Identifier" "DMTF Reserved" "DMTF Reserved"
                   "Network Information Service+ Domain"
                   "Network Information Service+ Servers" "TFTP Server Name"
                   "Bootfile Name" "Mobile IP Home Agent"
                   "Simple Mail Transport Protocol (SMTP) Server"
                   "Post Office Protocol (POP3) Server"
                   "Network News Transport Protocol (NNTP) Server"
                   "Default World Wide Web (WWW) Server"
                   "Default Finger Server"
                   "Default Internet Relay Chat (IRC) Server"
                   "StreetTalk Server"
                   "StreetTalk Directory Assistance (STDA) Server" "User Class"
                   "SLP Directory Agent" "SLP Service Scope" "DMTF Reserved"
                   "Relay Agent Information" "DMTF Reserved"
                   "Name Service Search" "Subnet Selection" "DMTF Reserved"
                   "Classless Route" "DMTF Reserved" "End" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MAPPING-STRINGS
                  ("RFC2132.IETF" "RFC2937.IETF" "RFC3011.IETF" "RFC3046.IETF"
                   "RFC3004.IETF" "RFC2610.IETF" "RFC3442.IETF"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DHCPProtocolEndpoint.OptionsReceived")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_DHCPSettingData")
              (:QUALIFIERS (:VERSION "2.32.0")
               (:UML-PACKAGE-PATH "CIM::Network::DHCP")
               (:DESCRIPTION
                "This class represents the desired configuration settings for the DHCPProtocolEndpoint (i.e. DHCP client configuration.")))