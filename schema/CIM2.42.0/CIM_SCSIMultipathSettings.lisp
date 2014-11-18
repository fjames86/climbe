
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SCSIMultipathSettings.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SCSIMULTIPATHSETTINGS (CIM_SETTINGDATA)
              ((ASYMMETRIC BOOLEAN :CIM-NAME "Asymmetric" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "A boolean indicating whether the associated logical unit has asymmetric multipath access. If Asymmetric is true, then there MUST be a SCSITargetPortGroup instance associated to the LogicalDevice.")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_MULTIPATH_LOGICAL_UNIT_PROPERTIES|asymmetric")))
                :INITFORM "false")
               (CURRENTLOADBALANCETYPE UINT16 :CIM-NAME
                "CurrentLoadBalanceType" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The load balance type for the associated logical unit.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7"))
                 (:VALUES
                  ("Unknown" "Other" "No Load Balancing" "Round Robin"
                   "Least Blocks" "Least IO" "Product Specific"
                   "Service Wide Default"))
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_MULTIPATH_LOGICAL_UNIT_PROPERTIES|currentLoadBalanceType"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SCSIMultipathSettings.OtherCurrentLoadBalanceType")))
                :INITFORM "7")
               (OTHERCURRENTLOADBALANCETYPE STRING :CIM-NAME
                "OtherCurrentLoadBalanceType" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "A string describing the current load balance algorithm if CurrentLoadBalanceType is 1 ('Other'). This string MUST be identical to one of the strings from CIM_SCSIMultipathConfigurationCapabilities OtherSupportedLoadBalanceAlgorithmNames.")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_MULTIPATH_LOGICAL_UNIT_PROPERTIES|currentLoadBalanceType"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SCSIMultipathConfigurationCapabilities.OtherSupportedLoadBalanceAlgorithmNames"
                   "CIM_SCSIMultipathSettings.CurrentLoadBalanceType")))
                :INITFORM NIL)
               (AUTOFAILBACKENABLED UINT16 :CIM-NAME "AutoFailbackEnabled"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The auto-failback setting for the associated logical units. Either enabled, disabled, or all associated logical units follow the service-wide setting from the capabilities class associated with the appropriate service.")
                 (:VALUE-MAP ("2" "3" "4"))
                 (:VALUES
                  ("Enabled for the associated logical units"
                   "Disabled for the associated logical units"
                   "The associated logical units use the service-wide setting"))
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_MULTIPATH_LOGICAL_UNIT_PROPERTIES|autoFailbackEnabled"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SCSIMultipathConfigurationCapabilities.AutoFailbackEnabled")))
                :INITFORM "4")
               (POLLINGRATEMAX UINT32 :CIM-NAME "PollingRateMax" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The maximum polling rate (in seconds) supported by the driver if different from the service-wide max from the capabilities instance. Zero (0) indicates the driver either does not poll for autofailback or has not provided an interface to set the polling rate for multipath logical units. If this property and the service PollingRateMax are non-zero, this value has precedence for the associate logical units. The instrumentation should not instantiate this property if the value from CIM_SCSIMultipathConfigurationCapabilities is used for the associated logical units.")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_MULTIPATH_LOGICAL_UNIT_PROPERTIES|pollingRateMax"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SCSIMultipathConfigurationCapabilities.PollingRateMax")))
                :INITFORM NIL)
               (CURRENTPOLLINGRATE UINT32 :CIM-NAME "CurrentPollingRate"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The current polling rate (in seconds) for auto-failback. This cannot exceed PollingRateMax. If this property and the service-wide Capabilities instance CurrentPollingRate are non-zero, this value has precedence for the associated logical units. The instrumentation should not instantiate this property if the value from CIM_SCSIMultipathConfigurationCapabilities is used for the associated logical units.")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_MULTIPATH_LOGICAL_UNIT_PROPERTIES|currentPollingRate"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SCSIMultipathConfigurationCapabilities.CurrentPollingRate")))
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
                :INITFORM NIL))
              (:CIM-NAME "CIM_SCSIMultipathSettings")
              (:QUALIFIERS (:VERSION "2.29.0")
               (:UML-PACKAGE-PATH "CIM::Device::SCSI")
               (:DESCRIPTION
                "A class derived from CIM_SettingData describing settings related to management of multiple paths to SCSI devices. It is associated to one of more instances of subclasses of LogicalDevice that represent SCSI logical units. If a LogicalDevice instance is associated to an instance of SCSIPathConfigurationService and is not associated to an instance of this class, the the default values for properties below and the polling values from the associated CIM_SCSIMultipathConfigurationCapabilities instance apply.")))