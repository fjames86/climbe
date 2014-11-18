
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BootServiceCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BOOTSERVICECAPABILITIES
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
               (BOOTCONFIGCAPABILITIES (ARRAY UINT16) :CIM-NAME
                "BootConfigCapabilities" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the boot related operations that can be applied to a managed element. Since this is an array, multiple values may be specified. The current values in the enumeration are: 
0 = \"Unknown\", indicating that the capabilities are not known at this time. If this value is present in the array, it shall be the only value.
1 = \"Other\", indicating that a capability not described by another value is present. A description of the capability can be found in the OtherBootConfigCapabilities property. \"Other\" can be present more than once in the BootConfigCapabilities array. 
2 = \"Creates Boot Configuration\", indicating that a boot service can create new boot configuration using an existing boot configuration as a template. 
3 = \"Applies Boot Configuration\", indicating that a boot service can apply the boot configuration of a computer system, without requiring a reset of the the computer system.
4 = \"Sets Boot Role\", indicating that a boot service can set the role (Default or Next) of a boot configuration that is associated to a one or more computer systems.
5 = \"Sets Boot Usage\", indicating that a boot service can set or unset the role (Default or Next) of a boot configuration for a specific computer system.
6 = \"Change Boot Order Method Not Supported\", indicating that a boot service cannot change the boot order using the CIM_BootConfigSetting.ChangeBootOrder() method")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6"))
                 (:VALUES
                  ("Unknown" "Other" "Creates Boot Configuration"
                   "Applies Boot Configuration" "Sets Boot Role"
                   "Sets Boot Usage" "Change Boot Order Not Supported"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BootServiceCapabilities.OtherBootConfigCapabilities")))
                :INITFORM NIL)
               (OTHERBOOTCONFIGCAPABILITIES (ARRAY STRING) :CIM-NAME
                "OtherBootConfigCapabilities" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the additional boot configuration capabilities of the element, used when the corresponding BootConfigCapabilities array element is set to the value 1, \"Other\".Each element that corresponds to a BootCapabilitiesSupported array element with a value other than 1 \"Other\" shall have a value of NULL.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BootServiceCapabilities.BootConfigCapabilities")))
                :INITFORM NIL)
               (BOOTSTRINGSSUPPORTED (ARRAY UINT16) :CIM-NAME
                "BootStringsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the boot string properties in the CIM_BootSourceSetting which are supported. If the array contains a value, then all the BootSourceSetting instances managed by the service are guaranteed to have a non-null value for the corresponding property.Since this is an array, multiple values may be specified. The values in the enumeration are: 
2 = BootString property supported 
3 = BIOSBootString property supported 
4 = StructureBootString property supported")
                 (:VALUE-MAP ("2" "3" "4"))
                 (:VALUES
                  ("BootString" "BIOSBootString" "StructuredBootString"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BootSourceSetting.BootString"
                   "CIM_BootSourceSetting.BIOSBootString"
                   "CIM_BootSourceSetting.StructuredBootString")))
                :INITFORM NIL)
               (BOOTCAPABILITIESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "BootCapabilitiesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating boot related capabilities that are not related to showing support for operations of a managed element. Since this is an array, multiple values may be specified. The current values in the enumeration are: 
0 = \"Unknown\", indicating that the capabilities are not known at this time. If this value is present in the array, it shall be the only value.
1 = \"Other\", indicating that a capability not described by another value is present. A description of the capability can be found in the OtherBootConfigCapabilities property. \"Other\" can be present more than once in the BootCapabilitiesSupported array. 
2 = \"State Data Supported\" indicating that real-time boot related state properties of systems are modeled using 'State' BootConfigSetting instances. In this methodology, each system shall be associated to a boot configuration representing the boot related state data via SettingsDefineState. All persistent boot configurations shall be related to the 'State' instance via ElementSettingData associations.")
                 (:VALUE-MAP ("0" "1" "2"))
                 (:VALUES ("Unknown" "Other" "State Data Supported")))
                :INITFORM NIL)
               (OTHERBOOTCAPABILITIESSUPPORTED (ARRAY STRING) :CIM-NAME
                "OtherBootCapabilitiesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the additional boot capabilities of the element, used when the corresponding BootCapabilitiesSupported array element is set to the value 1, \"Other\". Each element that corresponds to a BootCapabilitiesSupported array element with a value other than 1 \"Other\" shall have a value of NULL.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BootServiceCapabilities.BootCapabilitiesSupported")))
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
              (:CIM-NAME "CIM_BootServiceCapabilities")
              (:QUALIFIERS (:VERSION "2.19.0")
               (:UML-PACKAGE-PATH "CIM::System::Boot")
               (:DESCRIPTION
                "A class derived from Capabilities that describes the boot configuration management aspects of a system.")))