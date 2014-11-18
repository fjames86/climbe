
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_WiFiEndpoint.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_WIFIENDPOINT (CIM_LANENDPOINT)
              ((LANID STRING :CIM-NAME "LANID" :QUALIFIERS
                ((:OVERRIDE "LANID")
                 (:DESCRIPTION
                  "LANID shall contain the Service Set Identifier (SSID) of the wireless LAN with which the Endpoint is associated, or shall be NULL if the Endpoint is not currently associated or this information is not known.")
                 (:MAPPING-STRINGS ("IEEE 802.11-2007 | 7.3.2.1"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_LANConnectivitySegment.LANID" "CIM_LANSegment.LANID")))
                :INITFORM NIL)
               (PROTOCOLIFTYPE UINT16 :CIM-NAME "ProtocolIFType" :QUALIFIERS
                ((:OVERRIDE "ProtocolIFType")
                 (:DESCRIPTION
                  "ProtocolIFType's enumeration is limited to Wi-Fi and reserved values for this subclass of ProtocolEndpoint.")
                 (:VALUE-MAP ("1" "71" "225..4095" "4301..32767" "32768.."))
                 (:VALUES
                  ("Other" "IEEE 802.11" "IANA Reserved" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MAPPING-STRINGS ("MIB.IETF|IF-MIB.ifType"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ProtocolEndpoint.OtherTypeDescription")))
                :INITFORM "71")
               (ENCRYPTIONMETHOD UINT16 :CIM-NAME "EncryptionMethod"
                :QUALIFIERS
                ((:DESCRIPTION
                  "EncryptionMethod shall specify the encryption method in use to protect the confidentiality of data sent and received by the WiFiEndpoint.
	* Unknown (0): shall indicate that the encryption method is unknown to the server.
	* Other (1): shall indicate that the encryption method is known to the server but not defined in the list below. If EncryptionMethod contains 1, OtherEncryptionMethod shall not be NULL and shall not be empty.
	* WEP (2): shall indicate that the encryption method is Wired Equivalency Privacy (WEP). The value of EncryptionMethod shall be 2 only if the value of AuthenticationMethod is 2 (\"Open System\") or 3 (\"Shared Key\").
	* TKIP (3): shall indicate that the encryption method is Temporal Key Integrity Protocol (TKIP). The value of EncryptionMethod shall be 3 only if the value of AuthenticationMethod is 4 (\"WPA PSK\"), 5 (\"WPA IEEE 802.1x\"), 6 (\"WPA2 PSK\"), or 7 (\"WPA2 IEEE 802.1x\").
	* CCMP (4): shall indicate that the encryption method is Counter Mode with Cipher Block Chaining Message Authentication Code Protocol (CCMP). The value of EncryptionMethod shall be 4 only if the value of AuthenticationMethod is 4 (\"WPA PSK\"), 5 (\"WPA IEEE 802.1x\"), 6 (\"WPA2 PSK\"), or 7 (\"WPA2 IEEE 802.1x\").
	* None (5): shall indicate that no encryption method is in use. The value of EncryptionMethod shall be 5 only if the value of AuthenticationMethod is 2 (\"Open System\") or 3 (\"Shared Key\").")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6.."))
                 (:VALUES
                  ("Unknown" "Other" "WEP" "TKIP" "CCMP" "None"
                   "DMTF Reserved"))
                 (:MAPPING-STRINGS ("IEEE 802.11-2007 | 8"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_WiFiEndpoint.AuthenticationMethod"
                   "CIM_WiFiEndpoint.OtherEncryptionMethod")))
                :INITFORM NIL)
               (OTHERENCRYPTIONMETHOD STRING :CIM-NAME "OtherEncryptionMethod"
                :QUALIFIERS
                ((:DESCRIPTION
                  "OtherEncryptionMethod shall specify the 802.11 encryption method if and only if EncryptionMethod contains \"Other\". The format of this string shall be vendor-specific.")
                 (:MODEL-CORRESPONDENCE ("CIM_WiFiEndpoint.EncryptionMethod")))
                :INITFORM NIL)
               (AUTHENTICATIONMETHOD UINT16 :CIM-NAME "AuthenticationMethod"
                :QUALIFIERS
                ((:DESCRIPTION
                  "AuthenticationMethod shall specify the method used to authenticate the WiFiEndpoint and the network to one another.
	* Unknown (0): shall indicate that the authentication method is unknown to the server.	* Other (1): shall indicate that the authentication method is known to the server but not specified in the list below. If AuthenticationMethod contains 1, OtherAuthenticationMethod shall not be NULL and shall not be empty.
	* Open System (2): shall indicate that the authentication method is Open System. AuthenticationMethod shall contain 2 only if EncryptionMethod contains 2 (\"WEP\").
	* Shared Key (3): shall indicate that the authentication method is Shared Key. AuthenticationMethod shall contain 3 only if EncryptionMethod contains 2 (\"WEP\").
	* WPA PSK (4): shall indicate that the authentication method is WPA (Wi-Fi Protected Access) PSK (Pre-Shared Key). AuthenticationMethod shall contain 4 only if EncryptionMethod contains 3 (\"TKIP\") or 4 (\"CCMP\").
	* WPA IEEE 802.1x (5): shall indicate that the authentication method is WPA (Wi-Fi Protected Access) IEEE 802.1x. AuthenticationMethod shall contain 5 only if EncryptionMethod contains 3 (\"TKIP\") or 4 (\"CCMP\").
	* WPA2 PSK (6): shall indicate that the authentication method is WPA2 (Wi-Fi Protected Access Version 2) PSK (Pre-Shared Key). AuthenticationMethod shall contain 6 only if EncryptionMethod contains 3 (\"TKIP\") or 4 (\"CCMP\").
	* WPA2 IEEE 802.1x (7): shall indicate that the authentication method is WPA2 (Wi-Fi Protected Access Version 2) IEEE 802.1x. AuthenticationMethod shall contain 6 only if EncryptionMethod contains 3 (\"TKIP\") or 4 (\"CCMP\").
	* CCKM IEEE 802.1x (8): CCKM (Cisco Centralized Key Management with LEAP or EAP-FAST)")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9.."))
                 (:VALUES
                  ("Unknown" "Other" "Open System" "Shared Key" "WPA PSK"
                   "WPA IEEE 802.1x" "WPA2 PSK" "WPA2 IEEE 802.1x"
                   "CCKM IEEE 802.1x" "DMTF Reserved"))
                 (:MAPPING-STRINGS ("IEEE 802.11-2007 | 8"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_WiFiEndpoint.EncryptionMethod"
                   "CIM_WiFiEndpoint.IEEE8021xAuthenticationProtocol"
                   "CIM_WiFiEndpoint.OtherAuthenticationMethod")))
                :INITFORM NIL)
               (OTHERAUTHENTICATIONMETHOD STRING :CIM-NAME
                "OtherAuthenticationMethod" :QUALIFIERS
                ((:DESCRIPTION
                  "OtherAuthenticationMethod shall specify the 802.11 authentication method if and only if AuthenticationMethod contains \"Other\". The format of this string shall be vendor-specific.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_WiFiEndpoint.AuthenticationMethod")))
                :INITFORM NIL)
               (IEEE8021XAUTHENTICATIONPROTOCOL UINT16 :CIM-NAME
                "IEEE8021xAuthenticationProtocol" :QUALIFIERS
                ((:DESCRIPTION
                  "IEEE8021xAuthenticationProtocol shall contain the EAP (Extensible Authentication Protocol) type if and only if AuthenticationMethod contains \"WPA IEEE 802.1x\" or \"WPA2 IEEE 802.1x\" or \"CCKM IEEE 802.1x\"
.	* EAP-TLS (0): shall indicate the Transport Layer Security EAP type specified in RFC 2716.
	* EAP-TTLS/MSCHAPv2 (1): shall indicate the Tunneled TLS Authentication Protocol EAP type (specified in draft-ietf-pppext-eap-ttls) with Microsoft PPP CHAP Extensions, Version 2 (MSCHAPv2) as the inner authentication method.
	* PEAPv0/EAP-MSCHAPv2 (2): shall indicate the Protected Extensible Authentication Protocol (PEAP) Version 0 EAP type (specified in draft-kamath-pppext-peapv0), with Microsoft PPP CHAP Extensions, Version 2 (MSCHAPv2) as the inner authentication method.
	* PEAPv1/EAP-GTC (3): shall indicate the Protected Extensible Authentication Protocol (PEAP) Version 1 EAP type (specified in draft-josefsson-pppext-eap-tls-eap), with Generic Token Card (GTC) as the inner authentication method.
	* EAP-FAST/MSCHAPv2 (4): shall indicate the Flexible Authentication Extensible Authentication Protocol EAP type specified in IETF RFC 4851, with Microsoft PPP CHAP Extensions, Version 2 (MSCHAPv2) as the inner authentication method.
	* EAP-FAST/GTC (5): shall indicate the Flexible Authentication Extensible Authentication Protocol EAP type specified in IETF RFC 4851, with Generic Token Card (GTC) as the inner authentication method.
	* EAP-MD5 (6): shall indicate the EAP MD5 authentication method, specified in RFC 3748.
	* EAP-PSK (7): shall indicate the EAP-PSK (Pre-shared Key) Protocol specified in RFC 4764.
	* EAP-SIM (8): shall indicate the Extensible Authentication Protocol Method for Global System for Mobile Communications (GSM) Subscriber Identity Modules (EAP-SIM), specified in RFC 4186.
	* EAP-AKA (9): shall indicate the Extensible Authentication Protocol Method for 3rd Generation Authentication and Key Agreement (EAP-AKA) authentication method, specified in RFC 4187.
	* EAP-FAST/TLS (10): shall indicate the Flexible Authentication Extensible Authentication Protocol EAP type specified in IETF RFC 4851, with TLS as the inner authentication method.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11.."))
                 (:VALUES
                  ("EAP-TLS" "EAP-TTLS/MSCHAPv2" "PEAPv0/EAP-MSCHAPv2"
                   "PEAPv1/EAP-GTC" "EAP-FAST/MSCHAPv2" "EAP-FAST/GTC"
                   "EAP-MD5" "EAP-PSK" "EAP-SIM" "EAP-AKA" "EAP-FAST/TLS"
                   "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("RFC4017.IETF" "RFC2716.IETF"
                   "draft-ietf-pppext-eap-ttls.IETF"
                   "draft-kamath-pppext-peapv0.IETF"
                   "draft-josefsson-pppext-eap-tls-eap" "RFC4851.IETF"
                   "RFC3748.IETF" "RFC4764.IETF" "RFC4186.IETF"
                   "RFC4187.IETF"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_WiFiEndpoint.AuthenticationMethod")))
                :INITFORM NIL)
               (ACCESSPOINTADDRESS STRING :CIM-NAME "AccessPointAddress"
                :QUALIFIERS
                ((:DESCRIPTION
                  "AccessPointAddress shall contain the MAC address of the access point with which the WiFiEndpoint is currently associated. If the WiFiEndpoint is not currently associated, then AccessPointAddress shall be NULL.The MAC address shall be formatted as twelve hexadecimal digits (for example, \"010203040506\"), with each pair representing one of the six octets of the MAC address in \"canonical\" bit order. (Therefore, the Group address bit is found in the low order bit of the first character of the string.)"))
                :INITFORM NIL)
               (BSSTYPE UINT16 :CIM-NAME "BSSType" :QUALIFIERS
                ((:DESCRIPTION
                  "BSSType shall indicate the Basic Service Set (BSS) Type of the network that corresponds to the instance. A Basic Service Set is a set of stations controlled by a single coordination function.
	* Independent: the WiFiEndpoint is associated directly to another client station.
	* Infrastructure: the WiFiEndpoint is associated to a network via an access point.")
                 (:VALUE-MAP ("0" "2" "3" "4.."))
                 (:VALUES
                  ("Unknown" "Independent" "Infrastructure" "DMTF Reserved"))
                 (:MAPPING-STRINGS ("IEEE 802.11-2007 | 3.16")))
                :INITFORM NIL)
               (ASSOCIATED BOOLEAN :CIM-NAME "Associated" :QUALIFIERS
                ((:DESCRIPTION
                  "Associated shall indicate whether or not the WiFiEndpoint is currently associated to an access point or client station."))
                :INITFORM NIL)
               (LANTYPE UINT16 :CIM-NAME "LANType" :QUALIFIERS
                ((:DEPRECATED ("CIM_ProtocolEndpoint.ProtocolType"))
                 (:DESCRIPTION
                  "An indication of the kind of technology used on the LAN. This property is deprecated in lieu of ProtocolType, which is an enumeration inherited from ProtocolEndpoint and which includes the Values specified here.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES ("Unknown" "Other" "Ethernet" "TokenRing" "FDDI"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_LANConnectivitySegment.ConnectivityType"
                   "CIM_LANSegment.LANType")))
                :INITFORM NIL)
               (OTHERLANTYPE STRING :CIM-NAME "OtherLANType" :QUALIFIERS
                ((:DEPRECATED ("CIM_ProtocolEndpoint.OtherTypeDescription"))
                 (:DESCRIPTION
                  "A free-form string that describes the type of technology used on the LAN when the value of the LANType property is equal to 1 (i.e., \"Other\"). This property is deprecated since its purpose overlaps with OtherTypeDescription, which which is inherited from ProtocolEndpoint.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_LANConnectivitySegment.OtherTypeDescription"
                   "CIM_LANEndpoint.LANType")))
                :INITFORM NIL)
               (MACADDRESS STRING :CIM-NAME "MACAddress" :QUALIFIERS
                ((:DESCRIPTION
                  "The principal unicast address used in communication with the LANEndpoint. The MAC address is formatted as twelve hexadecimal digits (e.g., \"010203040506\"), with each pair representing one of the six octets of the MAC address in \"canonical\" bit order according to RFC 2469.")
                 (:MAX-LEN "12"))
                :INITFORM NIL)
               (MAXDATASIZE UINT32 :CIM-NAME "MaxDataSize" :QUALIFIERS
                ((:DESCRIPTION
                  "The largest information field that may be sent or received by the LANEndpoint.")
                 (NIL "Bits"))
                :INITFORM NIL)
               (DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:OVERRIDE "Description")
                 (:MAPPING-STRINGS ("MIB.IETF|IF-MIB.ifDescr"))
                 (:DESCRIPTION
                  "The Description property provides a textual description of the object."))
                :INITFORM NIL)
               (ENABLEDSTATE UINT16 :CIM-NAME "EnabledState" :QUALIFIERS
                ((:OVERRIDE "EnabledState")
                 (:MAPPING-STRINGS ("MIB.IETF|IF-MIB.ifAdminStatus"))
                 (:DESCRIPTION
                  "EnabledState is an integer enumeration that indicates the enabled and disabled states of an element. It can also indicate the transitions between these requested states. For example, shutting down (value=4) and starting (value=10) are transient states between enabled and disabled. The following text briefly summarizes the various enabled and disabled states: 
Enabled (2) indicates that the element is or could be executing commands, will process any queued commands, and queues new requests. 
Disabled (3) indicates that the element will not execute commands and will drop any new requests. 
Shutting Down (4) indicates that the element is in the process of going to a Disabled state. 
Not Applicable (5) indicates the element does not support being enabled or disabled. 
Enabled but Offline (6) indicates that the element might be completing commands, and will drop any new requests. 
Test (7) indicates that the element is in a test state. 
Deferred (8) indicates that the element might be completing commands, but will queue any new requests. 
Quiesce (9) indicates that the element is enabled but in a restricted mode.
Starting (10) indicates that the element is in the process of going to an Enabled state. New requests are queued.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11..32767"
                   "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "Enabled" "Disabled" "Shutting Down"
                   "Not Applicable" "Enabled but Offline" "In Test" "Deferred"
                   "Quiesce" "Starting" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.OtherEnabledState")))
                :INITFORM NIL)
               (TIMEOFLASTSTATECHANGE DATETIME :CIM-NAME
                "TimeOfLastStateChange" :QUALIFIERS
                ((:OVERRIDE "TimeOfLastStateChange")
                 (:MAPPING-STRINGS ("MIB.IETF|IF-MIB.ifLastChange"))
                 (:DESCRIPTION
                  "The date or time when the EnabledState of the element last changed. If the state of the element has not changed and this property is populated, then it must be set to a 0 interval value. If a state change was requested, but rejected or not yet processed, the property must not be updated."))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                ((:OVERRIDE "Name")
                 (:DESCRIPTION
                  "A string that identifies this ProtocolEndpoint with either a port or an interface on a device. To ensure uniqueness, the Name property should be prepended or appended with information from the Type or OtherTypeDescription properties. The method selected is described in the NameFormat property of this class.")
                 (:MAX-LEN "256") :KEY)
                :INITFORM NIL)
               (NAMEFORMAT STRING :CIM-NAME "NameFormat" :QUALIFIERS
                ((:DESCRIPTION
                  "NameFormat contains the naming heuristic that is selected to ensure that the value of the Name property is unique. For example, you might choose to prepend the name of the port or interface with the Type of ProtocolEndpoint (for example, IPv4) of this instance followed by an underscore.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (PROTOCOLTYPE UINT16 :CIM-NAME "ProtocolType" :QUALIFIERS
                ((:DEPRECATED ("CIM_ProtocolEndpoint.ProtocolIFType"))
                 (:DESCRIPTION
                  "Note: This property is deprecated in lieu of the ProtocolIFType enumeration. This deprecation was done to have better alignment between the IF-MIB of the IETF and this CIM class. 
Deprecated description: ProtocolType is an enumeration that provides information to categorize and classify different instances of this class. For most instances, information in this enumeration and the definition of the subclass overlap. However, there are several cases where a specific subclass of ProtocolEndpoint is not required (for example, there is no Fibre Channel subclass of ProtocolEndpoint). Therefore, this property is needed to define the type of Endpoint.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25"
                   "26" "27"))
                 (:VALUES
                  ("Unknown" "Other" "IPv4" "IPv6" "IPX" "AppleTalk" "DECnet"
                   "SNA" "CONP" "CLNP" "VINES" "XNS" "ATM" "Frame Relay"
                   "Ethernet" "TokenRing" "FDDI" "Infiniband" "Fibre Channel"
                   "ISDN BRI Endpoint" "ISDN B Channel Endpoint"
                   "ISDN D Channel Endpoint" "IPv4/v6" "BGP" "OSPF" "MPLS"
                   "UDP" "TCP"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ProtocolEndpoint.OtherTypeDescription")))
                :INITFORM NIL)
               (OTHERTYPEDESCRIPTION STRING :CIM-NAME "OtherTypeDescription"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string that describes the type of ProtocolEndpoint when the Type property of this class (or any of its subclasses) is set to 1 (Other). This property should be set to null when the Type property is any value other than 1.")
                 (:MAX-LEN "64")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ProtocolEndpoint.ProtocolType"
                   "CIM_ProtocolEndpoint.ProtocolIFType")))
                :INITFORM NIL)
               (SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "The CreationClassName of the scoping System.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_System.CreationClassName"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The Name of the scoping System.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_System.Name"))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (OTHERENABLEDSTATE STRING :CIM-NAME "OtherEnabledState"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string that describes the enabled or disabled state of the element when the EnabledState property is set to 1 (\"Other\"). This property must be set to null when EnabledState is any value other than 1.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM NIL)
               (REQUESTEDSTATE UINT16 :CIM-NAME "RequestedState" :QUALIFIERS
                ((:DESCRIPTION
                  "RequestedState is an integer enumeration that indicates the last requested or desired state for the element, irrespective of the mechanism through which it was requested. The actual state of the element is represented by EnabledState. This property is provided to compare the last requested and current enabled or disabled states. Note that when EnabledState is set to 5 (\"Not Applicable\"), then this property has no meaning. Refer to the EnabledState property description for explanations of the values in the RequestedState enumeration. 
\"Unknown\" (0) indicates the last requested state for the element is unknown.
Note that the value \"No Change\" (5) has been deprecated in lieu of indicating the last requested state is \"Unknown\" (0). If the last requested or desired state is unknown, RequestedState should have the value \"Unknown\" (0), but may have the value \"No Change\" (5).Offline (6) indicates that the element has been requested to transition to the Enabled but Offline EnabledState. 
It should be noted that there are two new values in RequestedState that build on the statuses of EnabledState. These are \"Reboot\" (10) and \"Reset\" (11). Reboot refers to doing a \"Shut Down\" and then moving to an \"Enabled\" state. Reset indicates that the element is first \"Disabled\" and then \"Enabled\". The distinction between requesting \"Shut Down\" and \"Disabled\" should also be noted. Shut Down requests an orderly transition to the Disabled state, and might involve removing power, to completely erase any existing state. The Disabled state requests an immediate disabling of the element, such that it will not execute or accept any commands or processing requests. 

This property is set as the result of a method invocation (such as Start or StopService on CIM_Service), or can be overridden and defined as WRITEable in a subclass. The method approach is considered superior to a WRITEable property, because it allows an explicit invocation of the operation and the return of a result code. 

If knowledge of the last RequestedState is not supported for the EnabledLogicalElement, the property shall be NULL or have the value 12 \"Not Applicable\".")
                 (:VALUE-MAP
                  ("0" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" ".."
                   "32768..65535"))
                 (:VALUES
                  ("Unknown" "Enabled" "Disabled" "Shut Down" "No Change"
                   "Offline" "Test" "Deferred" "Quiesce" "Reboot" "Reset"
                   "Not Applicable" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM "12")
               (ENABLEDDEFAULT UINT16 :CIM-NAME "EnabledDefault" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "An enumerated value indicating an administrator's default or startup configuration for the Enabled State of an element. By default, the element is \"Enabled\" (value=2).")
                 (:VALUE-MAP ("2" "3" "5" "6" "7" "9" ".." "32768..65535"))
                 (:VALUES
                  ("Enabled" "Disabled" "Not Applicable" "Enabled but Offline"
                   "No Default" "Quiesce" "DMTF Reserved" "Vendor Reserved")))
                :INITFORM "2")
               (TRANSITIONINGTOSTATE UINT16 :CIM-NAME "TransitioningToState"
                :QUALIFIERS
                ((:DESCRIPTION
                  "TransitioningToState indicates the target state to which the instance is transitioning. 
A value of 5 \"No Change\" shall indicate that no transition is in progress.A value of 12 \"Not Applicable\" shall indicate the implementation does not support representing ongoing transitions. 
A value other than 5 or 12 shall identify the state to which the element is in the process of transitioning.")
                 (:VALUE-MAP
                  ("0" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" ".."))
                 (:VALUES
                  ("Unknown" "Enabled" "Disabled" "Shut Down" "No Change"
                   "Offline" "Test" "Defer" "Quiesce" "Reboot" "Reset"
                   "Not Applicable" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.RequestStateChange"
                   "CIM_EnabledLogicalElement.RequestedState"
                   "CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM "12")
               (INSTALLDATE DATETIME :CIM-NAME "InstallDate" :QUALIFIERS
                ((:DESCRIPTION
                  "A datetime value that indicates when the object was installed. Lack of a value does not indicate that the object is not installed.")
                 (:MAPPING-STRINGS ("MIF.DMTF|ComponentID|001.5")))
                :INITFORM NIL)
               (STATUS STRING :CIM-NAME "Status" :QUALIFIERS
                ((:DEPRECATED ("CIM_ManagedSystemElement.OperationalStatus"))
                 (:DESCRIPTION
                  "A string indicating the current status of the object. Various operational and non-operational statuses are defined. This property is deprecated in lieu of OperationalStatus, which includes the same semantics in its enumeration. This change is made for 3 reasons: 
1) Status is more correctly defined as an array. This definition overcomes the limitation of describing status using a single value, when it is really a multi-valued property (for example, an element might be OK AND Stopped. 
2) A MaxLen of 10 is too restrictive and leads to unclear enumerated values. 
3) The change to a uint16 data type was discussed when CIM V2.0 was defined. However, existing V1.0 implementations used the string property and did not want to modify their code. Therefore, Status was grandfathered into the Schema. Use of the deprecated qualifier allows the maintenance of the existing property, but also permits an improved definition using OperationalStatus.")
                 (:VALUE-MAP
                  ("OK" "Error" "Degraded" "Unknown" "Pred Fail" "Starting"
                   "Stopping" "Service" "Stressed" "NonRecover" "No Contact"
                   "Lost Comm" "Stopped"))
                 (:MAX-LEN "10"))
                :INITFORM NIL)
               (HEALTHSTATE UINT16 :CIM-NAME "HealthState" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the current health of the element. This attribute expresses the health of this element but not necessarily that of its subcomponents. The possible values are 0 to 30, where 5 means the element is entirely healthy and 30 means the element is completely non-functional. The following continuum is defined: 
\"Non-recoverable Error\" (30) - The element has completely failed, and recovery is not possible. All functionality provided by this element has been lost. 
\"Critical Failure\" (25) - The element is non-functional and recovery might not be possible. 
\"Major Failure\" (20) - The element is failing. It is possible that some or all of the functionality of this component is degraded or not working. 
\"Minor Failure\" (15) - All functionality is available but some might be degraded. 
\"Degraded/Warning\" (10) - The element is in working order and all functionality is provided. However, the element is not working to the best of its abilities. For example, the element might not be operating at optimal performance or it might be reporting recoverable errors. 
\"OK\" (5) - The element is fully functional and is operating within normal operational parameters and without error. 
\"Unknown\" (0) - The implementation cannot report on HealthState at this time. 
DMTF has reserved the unused portion of the continuum for additional HealthStates in the future.")
                 (:VALUE-MAP
                  ("0" "5" "10" "15" "20" "25" "30" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "OK" "Degraded/Warning" "Minor failure"
                   "Major failure" "Critical failure" "Non-recoverable error"
                   "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (COMMUNICATIONSTATUS UINT16 :CIM-NAME "CommunicationStatus"
                :QUALIFIERS
                ((:DESCRIPTION
                  "CommunicationStatus indicates the ability of the instrumentation to communicate with the underlying ManagedElement. CommunicationStatus consists of one of the following values: Unknown, None, Communication OK, Lost Communication, or No Contact. 
A Null return indicates the implementation (provider) does not implement this property. 
\"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"Not Available\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"Communication OK \" indicates communication is established with the element, but does not convey any quality of service. 
\"No Contact\" indicates that the monitoring system has knowledge of this element, but has never been able to establish communications with it. 
\"Lost Communication\" indicates that the Managed Element is known to exist and has been contacted successfully in the past, but is currently unreachable.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Not Available" "Communication OK"
                   "Lost Communication" "No Contact" "DMTF Reserved"
                   "Vendor Reserved")))
                :INITFORM NIL)
               (DETAILEDSTATUS UINT16 :CIM-NAME "DetailedStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "DetailedStatus compliments PrimaryStatus with additional status detail. It consists of one of the following values: Not Available, No Additional Information, Stressed, Predictive Failure, Error, Non-Recoverable Error, SupportingEntityInError. Detailed status is used to expand upon the PrimaryStatus of the element. 
A Null return indicates the implementation (provider) does not implement this property. 
\"Not Available\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"No Additional Information\" indicates that the element is functioning normally as indicated by PrimaryStatus = \"OK\". 
\"Stressed\" indicates that the element is functioning, but needs attention. Examples of \"Stressed\" states are overload, overheated, and so on. 
\"Predictive Failure\" indicates that an element is functioning normally but a failure is predicted in the near future. 
\"Non-Recoverable Error \" indicates that this element is in an error condition that requires human intervention. 
\"Supporting Entity in Error\" indicates that this element might be \"OK\" but that another element, on which it is dependent, is in error. An example is a network service or endpoint that cannot function due to lower-layer networking problems.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" ".." "0x8000.."))
                 (:VALUES
                  ("Not Available" "No Additional Information" "Stressed"
                   "Predictive Failure" "Non-Recoverable Error"
                   "Supporting Entity in Error" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.PrimaryStatus"
                   "CIM_ManagedSystemElement.HealthState")))
                :INITFORM NIL)
               (OPERATINGSTATUS UINT16 :CIM-NAME "OperatingStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "OperatingStatus provides a current status value for the operational condition of the element and can be used for providing more detail with respect to the value of EnabledState. It can also provide the transitional states when an element is transitioning from one state to another, such as when an element is transitioning between EnabledState and RequestedState, as well as other transitional conditions.
OperatingStatus consists of one of the following values: Unknown, Not Available, In Service, Starting, Stopping, Stopped, Aborted, Dormant, Completed, Migrating, Emmigrating, Immigrating, Snapshotting. Shutting Down, In Test 
A Null return indicates the implementation (provider) does not implement this property. 
\"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"None\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"Servicing\" describes an element being configured, maintained, cleaned, or otherwise administered. 
\"Starting\" describes an element being initialized. 
\"Stopping\" describes an element being brought to an orderly stop. 
\"Stopped\" and \"Aborted\" are similar, although the former implies a clean and orderly stop, while the latter implies an abrupt stop where the state and configuration of the element might need to be updated. 
\"Dormant\" indicates that the element is inactive or quiesced. 
\"Completed\" indicates that the element has completed its operation. This value should be combined with either OK, Error, or Degraded in the PrimaryStatus so that a client can tell if the complete operation Completed with OK (passed), Completed with Error (failed), or Completed with Degraded (the operation finished, but it did not complete OK or did not report an error). 
\"Migrating\" element is being moved between host elements. 
\"Immigrating\" element is being moved to new host element. 
\"Emigrating\" element is being moved away from host element. 
\"Shutting Down\" describes an element being brought to an abrupt stop. 
\"In Test\" element is performing test functions. 
\"Transitioning\" describes an element that is between states, that is, it is not fully available in either its previous state or its next state. This value should be used if other values indicating a transition to a specific state are not applicable.
\"In Service\" describes an element that is in service and operational.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Not Available" "Servicing" "Starting" "Stopping"
                   "Stopped" "Aborted" "Dormant" "Completed" "Migrating"
                   "Emigrating" "Immigrating" "Snapshotting" "Shutting Down"
                   "In Test" "Transitioning" "In Service" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM NIL)
               (PRIMARYSTATUS UINT16 :CIM-NAME "PrimaryStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "PrimaryStatus provides a high level status value, intended to align with Red-Yellow-Green type representation of status. It should be used in conjunction with DetailedStatus to provide high level and detailed health status of the ManagedElement and its subcomponents. 
PrimaryStatus consists of one of the following values: Unknown, OK, Degraded or Error. \"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"OK\" indicates the ManagedElement is functioning normally. 
\"Degraded\" indicates the ManagedElement is functioning below normal. 
\"Error\" indicates the ManagedElement is in an Error condition.")
                 (:VALUE-MAP ("0" "1" "2" "3" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "OK" "Degraded" "Error" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.DetailedStatus"
                   "CIM_ManagedSystemElement.HealthState")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                ((:DESCRIPTION
                  "InstanceID is an optional property that may be used to opaquely and uniquely identify an instance of this class within the scope of the instantiating Namespace. Various subclasses of this class may override this property to make it required, or a key. Such subclasses may also modify the preferred algorithms for ensuring uniqueness that are defined below.
To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> must include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> must not contain a colon (:). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements. If not null and the above \"preferred\" algorithm is not used, the defining entity must assure that the resulting InstanceID is not reused across any InstanceIDs produced by this or other providers for the NameSpace of this instance. 
If not set to null for DMTF-defined instances, the \"preferred\" algorithm must be used with the <OrgID> set to CIM."))
                :INITFORM NIL)
               (CAPTION STRING :CIM-NAME "Caption" :QUALIFIERS
                ((:DESCRIPTION
                  "The Caption property is a short textual description (one- line string) of the object.")
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                ((:DESCRIPTION
                  "A user-friendly name for the object. This property allows each instance to define a user-friendly name in addition to its key properties, identity data, and description information. 
Note that the Name property of ManagedSystemElement is also defined as a user-friendly name. But, it is often subclassed to be a Key. It is not reasonable that the same property can convey both identity and a user-friendly name, without inconsistencies. Where Name exists and is not a Key (such as for instances of LogicalDevice), the same information can be present in both the Name and ElementName properties. Note that if there is an associated instance of CIM_EnabledLogicalElementCapabilities, restrictions on this properties may exist as defined in ElementNameMask and MaxElementNameLen properties defined in that class."))
                :INITFORM NIL)
               (ALIASADDRESSES (ARRAY STRING) :CIM-NAME "AliasAddresses"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Other unicast addresses that may be used to communicate with the LANEndpoint."))
                :INITFORM NIL)
               (GROUPADDRESSES (ARRAY STRING) :CIM-NAME "GroupAddresses"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Multicast addresses to which the LANEndpoint listens."))
                :INITFORM NIL)
               (OPERATIONALSTATUS (ARRAY UINT16) :CIM-NAME "OperationalStatus"
                :QUALIFIERS
                ((:OVERRIDE "OperationalStatus")
                 (:MAPPING-STRINGS ("MIB.IETF|IF-MIB.ifOperStatus"))
                 (:DESCRIPTION
                  "Indicates the current statuses of the element. Various operational statuses are defined. Many of the enumeration's values are self-explanatory. However, a few are not and are described here in more detail. 
\"Stressed\" indicates that the element is functioning, but needs attention. Examples of \"Stressed\" states are overload, overheated, and so on. 
\"Predictive Failure\" indicates that an element is functioning nominally but predicting a failure in the near future. 
\"In Service\" describes an element being configured, maintained, cleaned, or otherwise administered. 
\"No Contact\" indicates that the monitoring system has knowledge of this element, but has never been able to establish communications with it. 
\"Lost Communication\" indicates that the ManagedSystem Element is known to exist and has been contacted successfully in the past, but is currently unreachable. 
\"Stopped\" and \"Aborted\" are similar, although the former implies a clean and orderly stop, while the latter implies an abrupt stop where the state and configuration of the element might need to be updated. 
\"Dormant\" indicates that the element is inactive or quiesced. 
\"Supporting Entity in Error\" indicates that this element might be \"OK\" but that another element, on which it is dependent, is in error. An example is a network service or endpoint that cannot function due to lower-layer networking problems. 
\"Completed\" indicates that the element has completed its operation. This value should be combined with either OK, Error, or Degraded so that a client can tell if the complete operation Completed with OK (passed), Completed with Error (failed), or Completed with Degraded (the operation finished, but it did not complete OK or did not report an error). 
\"Power Mode\" indicates that the element has additional power model information contained in the Associated PowerManagementService association. 
\"Relocating\" indicates the element is being relocated.
OperationalStatus replaces the Status property on ManagedSystemElement to provide a consistent approach to enumerations, to address implementation needs for an array property, and to provide a migration path from today's environment to the future. This change was not made earlier because it required the deprecated qualifier. Due to the widespread use of the existing Status property in management applications, it is strongly recommended that providers or instrumentation provide both the Status and OperationalStatus properties. Further, the first value of OperationalStatus should contain the primary status for the element. When instrumented, Status (because it is single-valued) should also provide the primary status of the element.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Other" "OK" "Degraded" "Stressed"
                   "Predictive Failure" "Error" "Non-Recoverable Error"
                   "Starting" "Stopping" "Stopped" "In Service" "No Contact"
                   "Lost Communication" "Aborted" "Dormant"
                   "Supporting Entity in Error" "Completed" "Power Mode"
                   "Relocating" "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.StatusDescriptions")))
                :INITFORM NIL)
               (AVAILABLEREQUESTEDSTATES (ARRAY UINT16) :CIM-NAME
                "AvailableRequestedStates" :QUALIFIERS
                ((:DESCRIPTION
                  "AvailableRequestedStates indicates the possible values for the RequestedState parameter of the method RequestStateChange, used to initiate a state change. The values listed shall be a subset of the values contained in the RequestedStatesSupported property of the associated instance of CIM_EnabledLogicalElementCapabilities where the values selected are a function of the current state of the CIM_EnabledLogicalElement. This property may be non-null if an implementation is able to advertise the set of possible values as a function of the current state. This property shall be null if an implementation is unable to determine the set of possible values as a function of the current state.")
                 (:VALUE-MAP ("2" "3" "4" "6" "7" "8" "9" "10" "11" ".."))
                 (:VALUES
                  ("Enabled" "Disabled" "Shut Down" "Offline" "Test" "Defer"
                   "Quiesce" "Reboot" "Reset" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.RequestStateChange"
                   "CIM_EnabledLogicalElementCapabilities.RequestedStatesSupported")))
                :INITFORM NIL)
               (STATUSDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "StatusDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "Strings describing the various OperationalStatus array values. For example, if \"Stopping\" is the value assigned to OperationalStatus, then this property may contain an explanation as to why an object is being stopped. Note that entries in this array are correlated with those at the same array index in OperationalStatus.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.OperationalStatus")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_WiFiEndpoint")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Network::Wireless")
               (:DESCRIPTION
                "A wireless communication endpoint which, when its associated interface device is associated with an IEEE 802.11 wireless LAN, may send and receive data frames.")))
(DEFCIM-METHOD REQUESTSTATECHANGE
    ((INSTANCE CIM_WIFIENDPOINT)
     (REQUESTEDSTATE UINT16 "RequestedState" :IN
      (:DESCRIPTION
       "The state requested for the element. This information will be placed into the RequestedState property of the instance if the return code of the RequestStateChange method is 0 ('Completed with No Error'), or 4096 (0x1000) ('Job Started'). Refer to the description of the EnabledState and RequestedState properties for the detailed explanations of the RequestedState values.")
      (:VALUE-MAP ("2" "3" "4" "6" "7" "8" "9" "10" "11" ".." "32768..65535"))
      (:VALUES
       ("Enabled" "Disabled" "Shut Down" "Offline" "Test" "Defer" "Quiesce"
        "Reboot" "Reset" "DMTF Reserved" "Vendor Reserved"))
      (:MODEL-CORRESPONDENCE ("CIM_EnabledLogicalElement.RequestedState")))
     (TIMEOUTPERIOD DATETIME "TimeoutPeriod" :IN
      (:DESCRIPTION
       "A timeout period that specifies the maximum amount of time that the client expects the transition to the new state to take. The interval format must be used to specify the TimeoutPeriod. A value of 0 or a null parameter indicates that the client has no time requirements for the transition. 
If this property does not contain 0 or null and the implementation does not support this parameter, a return code of 'Use Of Timeout Parameter Not Supported' shall be returned."))
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION
       "May contain a reference to the ConcreteJob created to track the state transition initiated by the method invocation.")))
    ((:CIM-NAME "RequestStateChange")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests that the state of the element be changed to the value specified in the RequestedState parameter. When the requested state change takes place, the EnabledState and RequestedState of the element will be the same. Invoking the RequestStateChange method multiple times could result in earlier requests being overwritten or lost. 
A return code of 0 shall indicate the state change was successfully initiated. 
A return code of 3 shall indicate that the state transition cannot complete within the interval specified by the TimeoutPeriod parameter. 
A return code of 4096 (0x1000) shall indicate the state change was successfully initiated, a ConcreteJob has been created, and its reference returned in the output parameter Job. Any other return code indicates an error condition.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" ".." "4096" "4097" "4098" "4099"
        "4100..32767" "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported"
        "Unknown or Unspecified Error" "Cannot complete within Timeout Period"
        "Failed" "Invalid Parameter" "In Use" "DMTF Reserved"
        "Method Parameters Checked - Job Started" "Invalid State Transition"
        "Use of Timeout Parameter Not Supported" "Busy" "Method Reserved"
        "Vendor Specific"))
      (:MODEL-CORRESPONDENCE ("CIM_EnabledLogicalElement.RequestedState")))))