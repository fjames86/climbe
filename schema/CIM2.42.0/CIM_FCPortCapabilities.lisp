
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FCPortCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FCPORTCAPABILITIES (CIM_LOGICALPORTCAPABILITIES)
              ((AUTOSENSESPEEDCONFIGURABLE BOOLEAN :CIM-NAME
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
               (REQUESTEDTYPESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "RequestedTypesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "List of supported port types that can be configured on FCPortSettings.RequestedType. 
RequestedType acts as a filter on the enabled port types that a port may auto-negotiate during port login. 
\"G\" = Port may only act as an expansion port (E), or a fabric port (F). \"GL\" = Port may only act an an expansion port (E), a fabric port (F), or a fabric port supporting FC arbitrated loop (FL). \"E\" = Port may only act as an expansion port (E) connecting fabric elements. \"F\" = Port may only act as a fabric port (F). \"FX\" = Port may only act as a fabric port (F), or a fabric port supporting FC arbitrated loop (FL). \"B\" = Port may only act as a bridge port (B). \"NX\" = Port may only act as a node port (N) or a node port supporting FC arbitrated loop (NL). \"N\" = Port may only act as a Node port. \"NL\" = Port may only act as a Node Port supporting FC arbitrated loop. \"NX\" = Port may only act as a node port (N) or a node port supporting FC arbitrated loop (NL).")
                 (:VALUE-MAP
                  ("2" "3" "4" "5" "6" "7" "8" "9" "10" ".." "16000..65535"))
                 (:VALUES
                  ("G" "GL" "E" "F" "FX" "B" "NX" "N" "NL" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.INCITS-T11|SWAPI_PORT_CONFIG_CAPS_T.ConfigurablePortTypes")))
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
              (:CIM-NAME "CIM_FCPortCapabilities")
              (:QUALIFIERS (:VERSION "2.11.0")
               (:UML-PACKAGE-PATH "CIM::Device::FC")
               (:DESCRIPTION
                "FibreChannel port control and configuration capabilities.")))