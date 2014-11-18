
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_TelnetCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_TELNETCAPABILITIES (CIM_PROTOCOLSERVICECAPABILITIES)
              ((MAXCONNECTIONS UINT16 :CIM-NAME "MaxConnections" :QUALIFIERS
                ((:DESCRIPTION
                  "MaxConnections specifies the maximum number of connections supported by the protocol service.")
                 (:MAX-VALUE "65535")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ProtocolService.MaxConnections")))
                :INITFORM "1")
               (MAXLISTENINGPORTS UINT16 :CIM-NAME "MaxListeningPorts"
                :QUALIFIERS
                ((:DESCRIPTION
                  "MaxListeningPorts specifies the maximum number of ports on which a protocol service will listen.")
                 (:MIN-VALUE "1") (:MAX-VALUE "65535")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ProtocolServiceCapabilities.ListeningPortManagementSupported")))
                :INITFORM "1")
               (LISTENINGPORTMANAGEMENTSUPPORTED BOOLEAN :CIM-NAME
                "ListeningPortManagementSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "ListeningPortManagementSupported indicates whether the management of the ports on which the associated ProtocolService listens is supported.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ProtocolServiceCapabilities.MaxListeningPorts")))
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
               (SUPPORTEDTERMINALMODES (ARRAY UINT16) :CIM-NAME
                "SupportedTerminalModes" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of integers indicating the terminal modes that the service supports.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4..32767" "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "VT100" "ANSI" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_TelnetCapabilities.OtherSupportedTerminalMode")))
                :INITFORM NIL)
               (OTHERSUPPORTEDTERMINALMODE (ARRAY STRING) :CIM-NAME
                "OtherSupportedTerminalMode" :QUALIFIERS
                ((:DESCRIPTION
                  "If the SupportedTerminalModes property is set to 1, \"Other\" then free form string providing more information about supported terminal modes. If not set to 1, this string has no meaning.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_TelnetCapabilities.SupportedTerminalModes")))
                :INITFORM NIL)
               (SUPPORTEDCHARACTERDISPLAYMODES (ARRAY UINT16) :CIM-NAME
                "SupportedCharacterDisplayModes" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of integers indicating the Character display modes supported by the service.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4..32767" "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "Console" "Stream" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_TelnetCapabilities.OtherSupportedCharacterDisplayMode")))
                :INITFORM NIL)
               (OTHERSUPPORTEDCHARACTERDISPLAYMODE (ARRAY STRING) :CIM-NAME
                "OtherSupportedCharacterDisplayMode" :QUALIFIERS
                ((:DESCRIPTION
                  "If the SupportedCharacterDisplayModes property is set to 1 \"Other\" then free form string providing more information about the supported modes. If not set to 1, this string has no meaning.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_TelnetCapabilities.SupportedCharacterDisplayModes")))
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
              (:CIM-NAME "CIM_TelnetCapabilities")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Network::ConsoleProtocols")
               (:DESCRIPTION
                "A subclass of ProtocolServiceCapabilities that defines the capabilities of a Telnet Service. An instance of TelnetCapabilities is associated with the ProtocolService using ElementCapabilities.")))