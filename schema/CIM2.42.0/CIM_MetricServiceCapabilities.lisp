
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MetricServiceCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_METRICSERVICECAPABILITIES
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
               (CONTROLLABLEMETRICS (ARRAY STRING) :CIM-NAME
                "ControllableMetrics" :QUALIFIERS
                ((:DESCRIPTION
                  "ControllableMetrics identifies the instances of CIM_BaseMetricDefinition that can be controlled by the associated CIM_MetricService instance. Each string value shall be formatted as a WBEM URI defined as in accordance with DSP0207 that identifies an instance of CIM_BaseMetricDefinition. An instance of CIM_BaseMetricDefinition shall not be identified by a value of the ControllableMetrics property unless it is associated through CIM_ServiceAffectsElement to the associated instance of CIM_MetricService. If a value corresponding to an instance of CIM_BaseMetricDefinition is included in the ControllableMetrics property, the associated instance of CIM_MetricService shall support enabling and/or disabling at least one metric defined by the CIM_BaseMetricDefinition instance.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_MetricServiceCapabilities.MetricsControlTypes")))
                :INITFORM NIL)
               (METRICSCONTROLTYPES (ARRAY UINT16) :CIM-NAME
                "MetricsControlTypes" :QUALIFIERS
                ((:DESCRIPTION
                  "MetricsControlTypes identifies the type of control supported by the associated CIM_MetricService instance for the CIM_BaseMetricDefinition identified by the value at the same array index in the ControllableMetrics property. A value of 2 \"Discrete\" shall indicate that individual metrics defined by the instance of CIM_BaseMetricDefinition identified at the corresponding array index of ControllableMetrics may be enabled and or disabled by the associated instance of CIM_MetricService.A value of 3 \"Bulk\" shall indicate that all metrics defined by the instance of CIM_BaseMetricDefinition identified by the value at the same array index of ControllableMetrics may be enabled and or disabled with a single operation. A value of 4 \"Both\" shall indicate that all metrics defined by the instance of CIM_BaseMetricDefinition identified by the value at the same array index of ControllableMetrics may be enabled and or disabled individually or as a single operation.")
                 (:VALUE-MAP ("0" "2" "3" "4" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "Discrete" "Bulk" "Both" "DMTF Reserved"
                   "Vendor Specific"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_MetricServiceCapabilities.ControllableMetrics")))
                :INITFORM NIL)
               (CONTROLLABLEMANAGEDELEMENTS (ARRAY STRING) :CIM-NAME
                "ControllableManagedElements" :QUALIFIERS
                ((:DESCRIPTION
                  "ControllableManagedElements identifies the instances of CIM_ManagedElement that can be controlled by the associated CIM_MetricService instance. Each value shall be formatted as a WBEM URI defined according to DSP0207 identifying an instance of CIM_ManagedElement If a value corresponding to an instance of CIM_ManagedElement is included in the ControllableManagedElements property, the associated instance of CIM_MetricService shall support enabling and/or disabling at least one metric defined for the CIM_ManagedElement instance.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_MetricServiceCapabilities.ManagedElementControlTypes")))
                :INITFORM NIL)
               (MANAGEDELEMENTCONTROLTYPES (ARRAY UINT16) :CIM-NAME
                "ManagedElementControlTypes" :QUALIFIERS
                ((:DESCRIPTION
                  "ManagedElementControlTypes identifies the type of control supported by the associated CIM_MetricService instance for the CIM_ManagedElement identified by the value at the same array index in the ControllableManagedElements property. A value of 2 \"Discrete\" shall indicate that individual metrics controlled by the associated instance of CIM_MetricService may be enabled and or disabled for the instance of CIM_ManagedElement identified at the corresponding array index of ControllableManagedElements.A value of 3 \"Bulk\" shall indicate that all metrics controlled by the associated instance of CIM_MetricService may be enabled and or disabled for the instance of CIM_ManagedElement identified at the corresponding array index of ControllableManagedElements. A value of 4 \"Both\" shall indicate that all metrics controlled by the associated instance of CIM_MetricService may be enabled and or disabled with a single operation or individually for the instance of CIM_ManagedElement identified by the value at the same array index of ControllableManagedElements.")
                 (:VALUE-MAP ("0" "2" "3" "4" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "Discrete" "Bulk" "Both" "DMTF Reserved"
                   "Vendor Specific"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_MetricServiceCapabilities.ControllableManagedElements")))
                :INITFORM NIL)
               (SUPPORTEDMETHODS (ARRAY UINT16) :CIM-NAME "SupportedMethods"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Each enumeration corresponds to support for the like-named method of the MetricService.")
                 (:VALUE-MAP ("2" "3" "4" "5" "6" "7" ".." "0x8000.."))
                 (:VALUES
                  ("ControlMetrics" "ControlMetricsByClass" "ShowMetrics"
                   "ShowMetricsByClass" "GetMetricValues" "ControlSampleTimes"
                   "DMTF Reserved" "Vendor Specific")))
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
              (:CIM-NAME "CIM_MetricServiceCapabilities")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Metrics::BaseMetrics")
               (:DESCRIPTION
                "MetricServiceCapabilities describes the capabilities of the associated CIM_BaseMetricService.")))