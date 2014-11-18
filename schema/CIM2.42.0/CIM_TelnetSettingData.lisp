
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_TelnetSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_TELNETSETTINGDATA (CIM_SETTINGDATA)
              ((TERMINALMODE UINT16 :CIM-NAME "TerminalMode" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The terminal mode that will be in use if this SettingData is applied.")
                 (:VALUE-MAP ("1" "2" "3" ".." "32768..65535"))
                 (:VALUES
                  ("Other" "VT100" "ANSI" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_TelnetSettingData.OtherTerminalMode"
                   "CIM_TelnetSettingData.EnabledTerminalModes")))
                :INITFORM NIL)
               (OTHERTERMINALMODE STRING :CIM-NAME "OtherTerminalMode"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "If the TerminalMode property is set to 1, \"Other\" then this is a free form string providing more information about the current terminal mode. If not set to 1, this string has no meaning.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_TelnetSettingData.TerminalMode")))
                :INITFORM NIL)
               (CHARACTERDISPLAYMODE UINT16 :CIM-NAME "CharacterDisplayMode"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The character display mode that will be active if this SettingData is applied.")
                 (:VALUE-MAP ("1" "2" "3" ".." "32768..65535"))
                 (:VALUES
                  ("Other" "Console" "Stream" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_TelnetSettingData.OtherCharacterDisplayMode"
                   "CIM_TelnetProtocolEndpoint.EnabledCharacterDisplayModes")))
                :INITFORM NIL)
               (OTHERCHARACTERDISPLAYMODE STRING :CIM-NAME
                "OtherCharacterDisplayMode" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "When the CharacterDisplayMode property is set to 1, \"Other\" then this is a free form string providing more information about the character display mode. If not set to 1, this string has no meaning.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_TelnetProtocolEndpoint.CharacterDisplayMode"
                   "CIM_TelnetSettingData.OtherEnabledCharacterDisplayMode")))
                :INITFORM NIL)
               (ESCAPECHARACTER STRING :CIM-NAME "EscapeCharacter" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "String indicating the Escape Character that will be in effect if this SettingData is applied.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_TelnetProtocolEndpoint.EscapeCharacter")))
                :INITFORM NIL)
               (IDLETIMEOUT UINT32 :CIM-NAME "IdleTimeout" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "IdleTimeout specifies how long the connection can be idle before it is closed. The default value, 0, indicates that there is no idle timeout period.")
                 (NIL "Seconds") (:P-UNIT "second"))
                :INITFORM "0")
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
               (ENABLEDTERMINALMODES (ARRAY UINT16) :CIM-NAME
                "EnabledTerminalModes" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "An array of integers indicating the terminal modes that will be enabled.")
                 (:VALUE-MAP ("1" "2" "3" ".." "32768..65535"))
                 (:VALUES
                  ("Other" "VT100" "ANSI" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_TelnetSettingData.OtherEnabledTerminalMode")))
                :INITFORM NIL)
               (OTHERENABLEDTERMINALMODE (ARRAY STRING) :CIM-NAME
                "OtherEnabledTerminalMode" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "When the EnabledTerminalModes property contains a value of 1, \"Other\" then free form string providing more information about the enabled terminal mode. If it does not contain 1, this string has no meaning.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_TelnetSettingData.EnabledTerminalModes")))
                :INITFORM NIL)
               (ENABLEDCHARACTERDISPLAYMODES (ARRAY UINT16) :CIM-NAME
                "EnabledCharacterDisplayModes" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "An array of integers indicating the Character display modes enabled for the endpoint.")
                 (:VALUE-MAP ("1" "2" "3" ".." "32768..65535"))
                 (:VALUES
                  ("Other" "Console" "Stream" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_TelnetSettingData.OtherEnabledCharacterDisplayMode")))
                :INITFORM NIL)
               (OTHERENABLEDCHARACTERDISPLAYMODE (ARRAY STRING) :CIM-NAME
                "OtherEnabledCharacterDisplayMode" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "When the EnabledCharacterDisplayModes property contains a value of 1, \"Other\" then this is a free form string providing more information about the enabled modes. If it does not contain 1, this string has no meaning.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_TelnetProtocolEndpoint.EnabledCharacterDisplayModes")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_TelnetSettingData")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Network::ConsoleProtocols")
               (:DESCRIPTION
                "A representation of the settings of a Telnet server connection. The relationship between the SettingData and the TelnetProtocolEndpoint is described by instantiating the ElementSettingData association.")))