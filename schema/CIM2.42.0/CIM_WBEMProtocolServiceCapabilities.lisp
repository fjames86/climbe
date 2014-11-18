
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_WBEMProtocolServiceCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_WBEMPROTOCOLSERVICECAPABILITIES
              (CIM_PROTOCOLSERVICECAPABILITIES)
              ((GENERICOPERATIONCAPABILITIES STRING :CIM-NAME
                "GenericOperationCapabilities" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The generic operations capabilities supported. For more information on generic operations see DSP0223.")
                 (:EMBEDDED-INSTANCE
                  "CIM_GenericOperationCapabilitiesStructure"))
                :INITFORM NIL)
               (MAXCONNECTIONS UINT16 :CIM-NAME "MaxConnections" :QUALIFIERS
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
               (WBEMPROTOCOLVERSIONSSUPPORTED (ARRAY STRING) :CIM-NAME
                "WBEMProtocolVersionsSupported" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "Includes the latest version for each major version supported. For example, 1.3.1, 2.0.0. This property shall not include multiple revisions of the same major version."))
                :INITFORM NIL)
               (AUTHENTICATIONMECHANISMSSUPPORTED (ARRAY SINT16) :CIM-NAME
                "AuthenticationMechanismsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumerated array describing the types of authentication supported by the associated ProtocolService.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" ".."))
                 (:VALUES
                  ("Unknown" "Other" "None" "Basic" "Digest" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_WBEMProtocolServiceCapabilities.AuthenticationMechanismsDescriptions")))
                :INITFORM NIL)
               (AUTHENTICATIONMECHANISMSDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "AuthenticationMechanismsDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "Free-form strings providing descriptions of the supported mechanisms. Entries in this array are correlated with those in the AuthenticationMechanismsSupported array. An entry in this Descriptions array shall be provided when 1, \"Other\", is specified in AuthenticationMechanismsSupported.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_WBEMProtocolServiceCapabilities.AuthenticationMechanismsSupported")))
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
              (:CIM-NAME "CIM_WBEMProtocolServiceCapabilities")
              (:QUALIFIERS (:VERSION "2.38.0")
               (:UML-PACKAGE-PATH "CIM::Interop::WBEMProtocol")
               (:DESCRIPTION
                "CIM_WBEMProtocolServiceCapabilities defines the capabilities for a WBEM Protocol.")))