
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_WiFiNetworkDetectionSettings.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_WIFINETWORKDETECTIONSETTINGS (CIM_SETTINGDATA)
              ((TARGETNETWORKCATEGORIES UINT16 :CIM-NAME
                "TargetNetworkCategories" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating the type of wireless networks that will be searched for.
A value of 2 \"Any\" shall indicate that no restrictions are enforced on the SSIDs searched for.
A value of 3 \"Preferred\" shall indicate that only networks listed in the PreferredNetworks property are searced for.")
                 (:VALUE-MAP ("2" "3" ".." "16384..32767"))
                 (:VALUES
                  ("Any" "Preferred" "DMTF Reserved" "Vendor Reserved")))
                :INITFORM NIL)
               (MINIMUMSIGNALSTRENGTH UINT16 :CIM-NAME "MinimumSignalStrength"
                :QUALIFIERS
                ((:DESCRIPTION
                  "MinimumSignalStrength specifies the minimum signal strength required to be received by the wireless LAN endpoint in order for it to attempt to connect to the wireless network.")
                 (:P-UNIT "decibel(m) * -1"))
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
               (PREFERREDNETWORKS (ARRAY STRING) :CIM-NAME "PreferredNetworks"
                :QUALIFIERS
                ((:DESCRIPTION
                  "PreferredNetworks lists the SSIDs of preferred wireless LAN networks. Each value contained shall also be contained in the KnownNetworks property."))
                :INITFORM NIL)
               (KNOWNNETWORKS (ARRAY STRING) :CIM-NAME "KnownNetworks"
                :QUALIFIERS
                ((:DESCRIPTION
                  "KnownNetworks lists the SSIDs of networks that have been previously identified to or by the wireless LAN endpoint on the platform."))
                :INITFORM NIL)
               (PORTTYPES (ARRAY UINT16) :CIM-NAME "PortTypes" :QUALIFIERS
                ((:DESCRIPTION
                  "ProtocolTypes lists the different 802.11 variations that a network may support in order to for the wireless catcher to attempt a connection to the network. The enumeration values are selected to align with CIM_ProtocolEndpoint.ProtocolIFType's enumeration.")
                 (:VALUE-MAP ("0" "1" "70" "71" "72" "73" ".." "16000..65535"))
                 (:VALUES
                  ("Unknown" "Other" "802.11a" "802.11b" "802.11g" "802.11n"
                   "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_LogicalPort.PortType")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_WiFiNetworkDetectionSettings")
              (:QUALIFIERS (:VERSION "2.23.0")
               (:UML-PACKAGE-PATH "CIM::Network::Wireless")
               (:DESCRIPTION
                "CIM_WiFiNetworkDetectionSettings describes setting data that control the behavior of the network detection and selection logic in a Wi-Fi Port.")))