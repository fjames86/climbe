
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CLPCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CLPCAPABILITIES (CIM_PROTOCOLSERVICECAPABILITIES)
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
               (CLPVERSIONS (ARRAY STRING) :CIM-NAME "CLPVersions" :QUALIFIERS
                ((:DESCRIPTION
                  "CLPVersion is an array of strings that specifies the versions of the SM CLP Specification, DMTF document DSP0214, that the CLP service supports. The format of the version string follows the conventions noted in DMTF document DSP4004 in current and historical versions of the document. Thus the version string format is \"m.n.ud s\" where m is the string value of the major version identifier in numeric form, n is the string value of the minor version identifier in numeric form , u is the optional string value of the update (errata or coordination changes) in numeric form, d is the optional draft in alphabetic form and s is one of the following string values in alphabetic form: \"Work In Progress\", \"Draft Standard\", \"DMTF Standard\", \"Preliminary Standard\" or \"Final Standard\"."))
                :INITFORM NIL)
               (SMMEADDRESSVERSIONS (ARRAY STRING) :CIM-NAME
                "SMMEAddressVersions" :QUALIFIERS
                ((:DESCRIPTION
                  "SMMEAddressVersion is an array of strings that specify the versions of the Server Management Managed Element Address Specification, DMTF document DSP0215, that the CLP service supports. The format of the version string follows the conventions noted in DMTF document DSP4004 in current and historical versions of the document. Thus the version string format is \"m.n.ud s\" where m is the string value of the major version identifier in numeric form, n is the string value of the minor version identifier in numeric form , u is the optional string value of the update (errata or coordination changes) in numeric form, d is the optional draft in alphabetic form and s is one of the following string values in alphabetic form: \"Work In Progress\", \"Draft Standard\", \"Preliminary Standard\" or \"Final Standard\"."))
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
              (:CIM-NAME "CIM_CLPCapabilities")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Network::ProtocolEndpoints")
               (:DESCRIPTION
                "A subclass of ProtocolServiceCapabilities that defines the capabilities of a CLPService. An instance of CLPCapabilities is associated with a ProtocolService using ElementCapabilities.")))