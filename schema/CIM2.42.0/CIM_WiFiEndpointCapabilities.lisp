
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_WiFiEndpointCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_WIFIENDPOINTCAPABILITIES
              (CIM_ENABLEDLOGICALELEMENTCAPABILITIES)
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
               (SUPPORTEDENCRYPTIONMETHODS (ARRAY UINT16) :CIM-NAME
                "SupportedEncryptionMethods" :QUALIFIERS
                ((:DESCRIPTION
                  "The set of IEEE 802.11 encryption methods supported by the associated WifiEndpoint. Shall contain one or more of the values below.
	* Other (1): shall indicate that at least one encryption method not specified in the list below is supported. If SupportedEncryptionMethods contains 1, OtherSupportedEncryptionMethods shall not be NULL and shall not be empty.
	* WEP (2): shall indicate that Wired Equivalency Privacy (WEP) is supported. SupportedEncryptionMethods shall contain 2 only if SupportedAuthenticationMethods contains 2 (\"Open System\") or 3 (\"Shared Key\").
	* TKIP (3): shall indicate that the Temporal Key Integrity Protocol (TKIP) is supported. SupportedEncryptionMethods shall contain 3 only if SupportedAuthenticationMethods contains 4 (\"WPA PSK\"), 5 (\"WPA IEEE 802.1x\"), 6 (\"WPA2 PSK\"), or 7 (\"WPA2 IEEE 802.1x\").
	* CCMP (4): shall indicate that the Counter Mode with Cipher Block Chaining Message Authentication Code Protocol (CCMP) is supported. SupportedEncryptionMethods shall contain 4 only if SupportedAuthenticationMethods contains 4 (\"WPA PSK\"), 5 (\"WPA IEEE 802.1x\"), 6 (\"WPA2 PSK\"), or 7 (\"WPA2 IEEE 802.1x\").
	* None (5): shall indicate that the associated WiFiEndpoint supports connecting to a network without encryption. SupportedEncryptionMethods shall contain 5 only if SupportedAuthenticationMethods contains 2 (\"Open System\") or 3 (\"Shared Key\").")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" ".."))
                 (:VALUES ("Other" "WEP" "TKIP" "CCMP" "None" "DMTF Reserved"))
                 (:MAPPING-STRINGS ("IEEE 802.11-2007 | 8"))
                 (:MODEL-CORRESPONDENCE ("CIM_WiFiEndpoint.EncryptionMethod")))
                :INITFORM NIL)
               (OTHERSUPPORTEDENCRYPTIONMETHODS (ARRAY STRING) :CIM-NAME
                "OtherSupportedEncryptionMethods" :QUALIFIERS
                ((:DESCRIPTION
                  "Shall contain additional encryption methods supported by the associated WifiEndpoint, but not listed in the valuemap for SupportedEncryptionMethods. The positions of these strings are the lowest indices of the array, and do not correspond to the positions of the values in SupportedEncryptionMethods.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_WiFiEndpoint.OtherEncryptionMethod")))
                :INITFORM NIL)
               (SUPPORTEDAUTHENTICATIONMETHODS (ARRAY UINT16) :CIM-NAME
                "SupportedAuthenticationMethods" :QUALIFIERS
                ((:DESCRIPTION
                  "The set of IEEE 802.11 authentication methods supported by the associated WifiEndpoint.	* Other (1): shall indicate that at least one authentication method not specified in the list below is supported. If SupportedAuthenticationMethods contains 1, OtherSupportedAuthenticationMethods shall not be NULL and shall not be empty.
	* Open System (2): shall indicate that Open System authentication is supported. SupportedAuthenticationMethods shall contain 2 only if SupportedEncryptionMethods contains 2 (\"WEP\") or 5 (\"None\").
	* Shared Key (3): shall indicate Shared Key authentication is supported. SupportedAuthenticationMethods shall contain 3 only if SupportedEncryptionMethods contains 2 (\"WEP\") or 5 (\"None\").
	* WPA PSK (4): shall indicate that WPA (Wi-Fi Protected Access) PSK (Pre-Shared Key) authentication is supported. SupportedAuthenticationMethods shall contain 4 only if SupportedEncryptionMethods contains 3 (\"TKIP\") or 4 (\"CCMP\").
	* WPA IEEE 802.1x (5): shall indicate that WPA (Wi-Fi Protected Access) IEEE 802.1x authentication is supported. SupportedAuthenticationMethods shall contain 5 only if SupportedEncryptionMethods contains 3 (\"TKIP\") or 4 (\"CCMP\").
	* WPA2 PSK (6): shall indicate that WPA2 (Wi-Fi Protected Access Version 2) PSK (Pre-Shared Key) authentication is supported. SupportedAuthenticationMethods shall contain 6 only if SupportedEncryptionMethods contains 3 (\"TKIP\") or 4 (\"CCMP\").
	* WPA2 IEEE 802.1x (7): shall indicate that WPA2 (Wi-Fi Protected Access Version 2) IEEE 802.1x authentication is supported. SupportedAuthenticationMethods shall contain 7 only if SupportedEncryptionMethods contains 3 (\"TKIP\") or 4 (\"CCMP\").")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" "6" "7" ".."))
                 (:VALUES
                  ("Other" "Open System" "Shared Key" "WPA PSK"
                   "WPA IEEE 802.1x" "WPA2 PSK" "WPA2 IEEE 802.1X"
                   "DMTF Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MAPPING-STRINGS ("IEEE 802.11-2007 | 8"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_WiFiEndpoint.AuthenticationMethod")))
                :INITFORM NIL)
               (OTHERSUPPORTEDAUTHENTICATIONMETHODS (ARRAY STRING) :CIM-NAME
                "OtherSupportedAuthenticationMethods" :QUALIFIERS
                ((:DESCRIPTION
                  "Shall contain additional authentication methods supported by the associated WifiEndpoint, but not listed in the valuemap for SupportedAuthenticationMethods. The positions of these strings are the lowest indices of the array, and do not correspond to the positions of the values in SupportedAuthenticationMethods.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_WiFiEndpoint.OtherAuthenticationMethod")))
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
              (:CIM-NAME "CIM_WiFiEndpointCapabilities")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Network::Wireless")
               (:DESCRIPTION "Describes the capabilities of a WiFiEndpoint.")))