
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_NetworkPortCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_NETWORKPORTCAPABILITIES (CIM_LOGICALPORTCAPABILITIES)
              ((SPEEDCONFIGURABLE BOOLEAN :CIM-NAME "SpeedConfigurable"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean that indicates whether the Speed can be configured.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NetworkPortCapabilities.PortSpeedsSupported")))
                :INITFORM "false")
               (NETWORKIDSCONFIGURABLE BOOLEAN :CIM-NAME
                "NetworkIDsConfigurable" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether the NetworkPort can be configured to connect to specific Networks."))
                :INITFORM NIL)
               (NETWORKIDSFORMAT UINT16 :CIM-NAME "NetworkIDsFormat"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The format that is expected to populate the NetworkIds for the associated NetworkPortSettings.list of supported LinkTechnologies of the NetworkPort is defined in the NetworkPortCapabilities.")
                 (:VALUE-MAP ("2" ".." "32768..65535"))
                 (:VALUES
                  ("Virtual Fabric ID" "DMTF Reserved" "Vendor Reserved")))
                :INITFORM NIL)
               (AUTOSENSESPEEDCONFIGURABLE BOOLEAN :CIM-NAME
                "AutoSenseSpeedConfigurable" :QUALIFIERS
                ((:DESCRIPTION
                  "A boolean indicating whether the value in LogicalPortSettings.AutoSenseSpeed may be changed (TRUE), or may only be viewed (FALSE).")
                 (:MODEL-CORRESPONDENCE ("CIM_NetworkPort.Speed")))
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
               (PORTSPEEDSSUPPORTED (ARRAY UINT64) :CIM-NAME
                "PortSpeedsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "List of supported port speeds that can be configured on NetworkPort.Speed.")
                 (:MODEL-CORRESPONDENCE ("CIM_NetworkPort.Speed")))
                :INITFORM NIL)
               (LINKTECHNOLOGIESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "LinkTechnologiesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "List of the LinkTechnologies supported by the the NetworkPort.")
                 (:VALUE-MAP ("2" "3" "4" "5" "6" "7" "8" "9" "10" "11" ".."))
                 (:VALUES
                  ("Ethernet" "IB" "FC" "FDDI" "ATM" "Token Ring" "Frame Relay"
                   "Infrared" "BlueTooth" "Wireless LAN" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_NetworkPort.LinkTechnology")))
                :INITFORM NIL)
               (REQUESTEDSPEEDSSUPPORTED (ARRAY UINT64) :CIM-NAME
                "RequestedSpeedsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "List of supported port speeds that can be configured on LogicalPortSettings.RequestedSpeed.")
                 (:MODEL-CORRESPONDENCE ("CIM_NetworkPort.Speed")))
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
              (:CIM-NAME "CIM_NetworkPortCapabilities")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Device::Ports")
               (:DESCRIPTION
                "NetworkPortCapabilities describes the capabilities supported for properties that are configurable in NetworkPort.")))