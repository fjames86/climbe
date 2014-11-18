
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DHCPCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DHCPCAPABILITIES (CIM_ENABLEDLOGICALELEMENTCAPABILITIES)
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
               (OPTIONSSUPPORTED (ARRAY UINT16) :CIM-NAME "OptionsSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "One or more DHCP options supported by the DHCP client. These may include: Subnet Mask, Default Router, DNS Server, etc. See RFC2132 for a description of each option.")
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
               (IPV6OPTIONSSUPPORTED (ARRAY UINT16) :CIM-NAME
                "IPv6OptionsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "One or more DHCP option opcodes supported by the DHCP client for IPv6. 
The values of this property shall be the option-codes specified 
in RFC3315, Section 22.")
                 (:MAPPING-STRINGS ("RFC3315.IETF")))
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
              (:CIM-NAME "CIM_DHCPCapabilities")
              (:QUALIFIERS (:VERSION "2.27.0")
               (:UML-PACKAGE-PATH "CIM::Network::DHCP")
               (:DESCRIPTION
                "A class derived from EnabledLogicalElementCapabilities representing the capabilities of a DHCP client.")))