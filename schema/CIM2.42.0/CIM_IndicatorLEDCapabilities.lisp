
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IndicatorLEDCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_INDICATORLEDCAPABILITIES
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
               (SUPPORTEDINDICATEDCONDITIONS (ARRAY UINT16) :CIM-NAME
                "SupportedIndicatedConditions" :QUALIFIERS
                ((:DESCRIPTION
                  "The conditions that may be indicated by the LED.See CIM_IndicatorLED.IndicatedConditions for a description of the values.")
                 (:VALUE-MAP ("1" "3" "4" "5" "6" "7" ".." "32768..65535"))
                 (:VALUES
                  ("Other" "Location" "Attention" "Activity" "Powered On"
                   "Fault" "DMTF Reserved" "Vendor Reserved")))
                :INITFORM NIL)
               (OTHERSUPPORTEDINDICATEDCONDITIONDESCRIPTIONS (ARRAY STRING)
                :CIM-NAME "OtherSupportedIndicatedConditionDescriptions"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An array index of this property shall have a value if the corresponding array index of SupportedIndicatedConditions contains the value 1 \"Other\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IndicatorLEDCapabilities.SupportedIndicatedConditions"
                   "CIM_IndicatorLED.OtherIndicatedConditionDescription")))
                :INITFORM NIL)
               (SUPPORTEDCONTROLMODES (ARRAY UINT16) :CIM-NAME
                "SupportedControlModes" :QUALIFIERS
                ((:DESCRIPTION
                  "SupportedControlModes indicates the control modes supported for the LED.See CIM_IndicatorLED.ControlMode for more information.")
                 (:VALUE-MAP ("2" "3" "4" ".." "32768..65535"))
                 (:VALUES
                  ("Automatic" "Manual" "Test" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_IndicatorLED.ControlMode")))
                :INITFORM NIL)
               (SUPPORTEDCOLORS (ARRAY UINT16) :CIM-NAME "SupportedColors"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property indicates the colors supported by the associated instance of CIM_IndicatorLED.")
                 (:VALUE-MAP
                  ("1" "3" "4" "5" "6" "7" "8" "9" ".." "32768..65535"))
                 (:VALUES
                  ("Other" "White" "Red" "Green" "Blue" "Orange" "Yellow"
                   "Black" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IndicatorLED.Color"
                   "CIM_IndicatorLEDCapabilities.OtherSupportedColorDescriptions")))
                :INITFORM NIL)
               (OTHERSUPPORTEDCOLORDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherSupportedColorDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "An array index of this property shall have a value if the corresponding array index of SupportedColors contains the value 1 \"Other\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IndicatorLEDCapabilities.SupportedColors"
                   "CIM_IndicatorLED.OtherColorDescription")))
                :INITFORM NIL)
               (SUPPORTEDCONTROLPATTERNS (ARRAY STRING) :CIM-NAME
                "SupportedControlPatterns" :QUALIFIERS
                ((:DESCRIPTION
                  "SupportedControlPatterns describes the control patterns supported by the associated LED. The values of SupportedControlPatterns may be an exact match for values allowed for CIM_IndicatorLED.ControlPattern or may indicate general categories of behavior. The interpretation of value is specific to the business entity identified by <OrgID>. 
Each value of SupportedControlPatterns shall be constructed using the following \"preferred\" algorithm: <OrgID>::<Pattern> 
Where <OrgID> and < Pattern> are separated by two colons (::), and where <OrgID> shall include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the ControlPattern or that is a registered ID assigned to the business entity by a recognized global authority. <Pattern> is chosen by the business entity and shall not be reused to identify different underlying (real-world) behaviors. If the behavior specified for the LED adheres to a standard or proprietary specification, <Pattern> shall be a uniquely assigned value identifying the behavior. If the behavior for the LED is described using a standard or proprietary grammar, <Pattern> shall be prefixed with a uniquely assigned identifier for the grammar.")
                 (:MODEL-CORRESPONDENCE ("CIM_IndicatorLED.ControlPattern")))
                :INITFORM NIL)
               (SUPPORTEDACTIVATIONSTATES (ARRAY UINT16) :CIM-NAME
                "SupportedActivationStates" :QUALIFIERS
                ((:DESCRIPTION
                  "SupportedActivationStates indicates the supported activation states for the associated IndicatorLED. See CIM_IndicatorLED.ActivationState for descriptions of the values.")
                 (:VALUE-MAP ("2" "3" "4" "5" ".." "32768..65535"))
                 (:VALUES
                  ("Lit" "Blinking" "Off" "Control Pattern" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_IndicatorLED.ActivationState")))
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
              (:CIM-NAME "CIM_IndicatorLEDCapabilities")
              (:QUALIFIERS (:VERSION "2.35.1")
               (:UML-PACKAGE-PATH "CIM::Device::LED")
               (:DESCRIPTION
                "LEDCapabilities describes the capabilities supported for managing the associated LED.")))