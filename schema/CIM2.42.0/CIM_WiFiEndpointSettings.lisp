
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_WiFiEndpointSettings.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_WIFIENDPOINTSETTINGS (CIM_SETTINGDATA)
              ((PRIORITY UINT8 :CIM-NAME "Priority" :QUALIFIERS
                ((:DESCRIPTION
                  "Priority shall indicate the priority of the instance among all WiFiEndpointSettings instances."))
                :INITFORM NIL)
               (SSID STRING :CIM-NAME "SSID" :QUALIFIERS
                ((:DESCRIPTION
                  "SSID shall indicate the Service Set Identifier (SSID) that shall be used when the settings are applied to a WiFiEndpoint. An SSID identifies a wireless network.")
                 (:MAPPING-STRINGS ("IEEE 802.11-2007 | 7.3.2.1")))
                :INITFORM NIL)
               (BSSTYPE UINT16 :CIM-NAME "BSSType" :QUALIFIERS
                ((:DESCRIPTION
                  "BSSType shall indicate the Basic Service Set (BSS) Type that shall be used when the settings are applied. A Basic Service Set is a set of stations controlled by a single coordination function.
	* Independent: the WiFiEndpoint is associated directly to another client station.
	* Infrastructure: the WiFiEndpoint is associated to a network via an access point.")
                 (:VALUE-MAP ("0" "2" "3" ".."))
                 (:VALUES
                  ("Unknown" "Independent" "Infrastructure" "DMTF Reserved"))
                 (:MAPPING-STRINGS ("IEEE 802.11-2007 | 3.16")))
                :INITFORM NIL)
               (ENCRYPTIONMETHOD UINT16 :CIM-NAME "EncryptionMethod"
                :QUALIFIERS
                ((:DESCRIPTION
                  "EncryptionMethod shall specify the 802.11 encryption method used when the settings are applied. 	* Other (1): shall indicate that the desired encryption method is not specified in the list below. If this value is used, OtherEncryptionMethod should not be NULL and should not be empty.
	* WEP (2): shall indicate that the desired encryption method is Wired Equivalency Privacy (WEP). This value should be used only if AuthenticationMethod contains 2 (\"Open System\") or 3 (\"Shared Key\").
	* TKIP (3): shall indicate that the desired encryption method is Temporal Key Integrity Protocol (TKIP). This value should be used only if AuthenticationMethod contains 4 (\"WPA PSK\"), 5 (\"WPA IEEE 802.1x\"), 6 (\"WPA2 PSK\"), or 7 (\"WPA2 IEEE 802.1x\").
	* CCMP (4): shall indicate that the desired encryption method is Counter Mode with Cipher Block Chaining Message Authentication Code Protocol (CCMP). This value should be used only if AuthenticationMethod contains 4 (\"WPA PSK\"), 5 (\"WPA IEEE 802.1x\"), 6 (\"WPA2 PSK\"), or 7 (\"WPA2 IEEE 802.1x\").
	* None (5): shall indicate that no encryption is desired. This value should be used only if AuthenticationMethod contains 2 (\"Open System\") or 3 (\"Shared Key\").")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" "6.."))
                 (:VALUES ("Other" "WEP" "TKIP" "CCMP" "None" "DMTF Reserved"))
                 (:MAPPING-STRINGS ("IEEE 802.11-2007 | 8"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_WiFiEndpoint.EncryptionMethod"
                   "CIM_WiFiEndpointSettings.AuthenticationMethod"
                   "CIM_WiFiEndpointSettings.OtherEncryptionMethod")))
                :INITFORM NIL)
               (OTHERENCRYPTIONMETHOD STRING :CIM-NAME "OtherEncryptionMethod"
                :QUALIFIERS
                ((:DESCRIPTION
                  "OtherEncryptionMethod shall specify the 802.11 encryption method used when the settings are applied if and only if EncryptionMethod contains \"Other\". The format of this string shall be vendor-specific.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_WiFiEndpoint.OtherEncryptionMethod"
                   "CIM_WiFiEndpointSettings.EncryptionMethod")))
                :INITFORM NIL)
               (AUTHENTICATIONMETHOD UINT16 :CIM-NAME "AuthenticationMethod"
                :QUALIFIERS
                ((:DESCRIPTION
                  "AuthenticationMethod shall specify the 802.11 authentication method used when the settings are applied. 	* Other (1): shall indicate that the desired authentication method is not specified in the list below. If AuthenticationMethod contains 1, OtherAuthenticationMethod should not be NULL and should not be empty.
	* Open System (2): shall indicate that the desired authentication method is Open System. AuthenticationMethod should contain 2 only if EncryptionMethod contains 2 (\"WEP\") or 5 (\"None\").
	* Shared Key (3): shall indicate that the desired authentication method is Shared Key. AuthenticationMethod should contain 3 only if EncryptionMethod contains 2 (\"WEP\") or 5 (\"None\").
	* WPA PSK (4): shall indicate that the desired authentication method is WPA (Wi-Fi Protected Access) PSK (Pre-Shared Key). AuthenticationMethod should contain 4 only if EncryptionMethod contains 3 (\"TKIP\") or 4 (\"CCMP\").
	* WPA IEEE 802.1x (5): shall indicate that the desired authentication method is WPA (Wi-Fi Protected Access) IEEE 802.1x. AuthenticationMethod should contain 5 only if EncryptionMethod contains 3 (\"TKIP\") or 4 (\"CCMP\").
	* WPA2 PSK (6): shall indicate that the desired authentication method is WPA2 (Wi-Fi Protected Access Version 2) PSK (Pre-Shared Key). AuthenticationMethod should containt 6 only if EncryptionMethod contains 3 (\"TKIP\") or 4 (\"CCMP\").
	* WPA2 IEEE 802.1x (7): shall indicated that the desired authentication method is WPA2 (Wi-Fi Protected Access Version 2) IEEE 802.1x. AuthenticationMethod should contain 7 only if EncryptionMethod contains 3 (\"TKIP\") or 4 (\"CCMP\").")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" "6" "7" "8.."))
                 (:VALUES
                  ("Other" "Open System" "Shared Key" "WPA PSK"
                   "WPA IEEE 802.1x" "WPA2 PSK" "WPA2 IEEE 802.1x"
                   "DMTF Reserved"))
                 (:MAPPING-STRINGS ("IEEE 802.11-2007 | 8"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_WiFiEndpoint.AuthenticationMethod"
                   "CIM_WiFiEndpointSettings.EncryptionMethod"
                   "CIM_WiFiEndpointSettings.OtherAuthenticationMethod")))
                :INITFORM NIL)
               (OTHERAUTHENTICATIONMETHOD STRING :CIM-NAME
                "OtherAuthenticationMethod" :QUALIFIERS
                ((:DESCRIPTION
                  "OtherAuthenticationMethod shall specify the 802.11 authentication method used when the settings are applied if and only if AuthenticationMethod contains \"Other\". The format of this string shall be vendor-specific.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_WiFiEndpoint.OtherAuthenticationMethod"
                   "CIM_WiFiEndpointSettings.AuthenticationMethod")))
                :INITFORM NIL)
               (KEYINDEX UINT8 :CIM-NAME "KeyIndex" :QUALIFIERS
                ((:DESCRIPTION
                  "KeyIndex shall contain the index of the active key in the Keys array property. KeyIndex should be non-NULL if and only Keys is non-NULL.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.11 MIB.dot11WEPDefaultKeyID"))
                 (:MODEL-CORRESPONDENCE ("CIM_WiFiEndpointSettings.Keys")))
                :INITFORM NIL)
               (PSKPASSPHRASE STRING :CIM-NAME "PSKPassPhrase" :QUALIFIERS
                ((:DESCRIPTION
                  "An ASCII alphanumeric string used to generate a PSK (pre-shared key). PSKPassPhrase and PSKValue should not both be non-NULL. PSKPassPhrase should be NULL if AuthenticationMethod does not contain 4 (\"WPA PSK\") or 6 (\"WPA2 PSK\").")
                 (:MIN-LEN "8") (:MAX-LEN "63")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.11 MIB.dot11RSNAConfigPSKPassPhrase"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_WiFiEndpointSettings.PSKValue"
                   "CIM_WiFiEndpointSettings.AuthenticationMethod")))
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
               (KEYS (ARRAY STRING) :CIM-NAME "Keys" :QUALIFIERS
                ((:DESCRIPTION
                  "Keys shall contain the default WEP encryption keys. Keys should be non-NULL if and only if EncryptionMethod contains 2 (\"WEP\").")
                 :OCTET-STRING (:ARRAYTYPE "Indexed")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.11 MIB.dot11WEPDefaultKeys"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_WiFiEndpointSettings.KeyIndex"
                   "CIM_WiFiEndpointSettings.EncryptionMethod")))
                :INITFORM NIL)
               (PSKVALUE (ARRAY UINT8) :CIM-NAME "PSKValue" :QUALIFIERS
                ((:DESCRIPTION
                  "The actual binary value of a PSK (pre-shared key). PSKValue and PSKPassPhrase should not both be non-NULL. PSKValue should be NULL if AuthenticationMethod does not contain 4 (\"WPA PSK\") or 6 (\"WPA2 PSK\").")
                 :OCTET-STRING
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.11 MIB.dot11RSNAConfigPSKValue"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_WiFiEndpointSettings.PSKPassPhrase"
                   "CIM_WiFiEndpointSettings.AuthenticationMethod")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_WiFiEndpointSettings")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Network::Wireless")
               (:DESCRIPTION
                "CIM_WiFiEndpointSettings describes setting data that can be applied to an instance of CIM_WiFiEndpoint to enable it to associate to a particular Wi-Fi network.")))