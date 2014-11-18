
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SCSITargetPortGroup.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SCSITARGETPORTGROUP (CIM_SYSTEMSPECIFICCOLLECTION)
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
               (ACCESSSTATE UINT16 :CIM-NAME "AccessState" :QUALIFIERS
                ((:DESCRIPTION
                  "Access to all associated logical units through all aggregated ports share this access state. Access to the Logical Units through other ports is specified by the access state of those port's target port group.")
                 (:VALUE-MAP ("2" "3" "4" "5" "6"))
                 (:VALUES
                  ("Active/Optimized" "Active/Non-optimized" "StandBy"
                   "Unavailable" "Transitioning"))
                 (:MAPPING-STRINGS
                  ("SPC.INCITS-T10 |Asymmetric Access State"
                   "MP_API.SNIA|MP_ACCESS_STATE_TYPE")))
                :INITFORM NIL)
               (EXPLICITFAILOVER BOOLEAN :CIM-NAME "ExplicitFailover"
                :QUALIFIERS
                ((:DESCRIPTION
                  "True indicates that the underlying implementation provides an interface allowing drivers to explicitly request activation of a target port group - either through the SCSI SET TARGET PORT GROUP or a proprietary command.")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_TARGET_PORT_PROPERTIES|explicitFailover")))
                :INITFORM NIL)
               (IDENTIFIER UINT16 :CIM-NAME "Identifier" :QUALIFIERS
                ((:DESCRIPTION
                  "An integer identifier for the target port group. This corresponds to the TARGET PORT GROUP field in the REPORT TARGET PORT GROUPS response and the TARGET PORT GROUP field in an INQUIRY VPD page 85 response, type 5h identifier.")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_TARGET_PORT_PROPERTIES|tpgID"
                   "SPC.INCITS-T10 | Target Port Group Descriptor | Target Port Group"
                   "SPC.INCITS-T10 | Inquiry VPD page 0x85 | Target Port Group")))
                :INITFORM NIL)
               (PREFERRED BOOLEAN :CIM-NAME "Preferred" :QUALIFIERS
                ((:DESCRIPTION
                  "True indicates that the target device indicates that access to the associated logical units through the ports in this target port group is preferred over access through other ports. This may correspond to the PREF bit in the SCSI TARGET PORT GROUP descriptor or an equivalent vendor-specific interface.")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_TARGET_PORT_PROPERTIES|preferredLUPath"
                   "SPC.INCITS-T10 | Target Port Group Descriptor | PREF")))
                :INITFORM NIL)
               (SUPPORTSLUASSIGNMENT BOOLEAN :CIM-NAME "SupportsLuAssignment"
                :QUALIFIERS
                ((:DESCRIPTION
                  "True indicates that the underlying implementation provides an interface allowing the administrator to reassign logical units to target port groups.")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_TARGET_PORT_PROPERTIES|supportsLuAssignment")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> must include a unique name. It can be a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID. Or, it could be a registered ID that is assigned to the business entity by a recognized global authority.(This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> must not contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity must ensure that the resulting InstanceID is not re-used as any of InstanceIDs produced by this or other providers for the NameSpace of this instance. 
For DMTF-defined instances, the 'preferred' algorithm must be used with the <OrgID> set to 'CIM'."))
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
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                ((:DESCRIPTION
                  "A user-friendly name for the object. This property allows each instance to define a user-friendly name in addition to its key properties, identity data, and description information. 
Note that the Name property of ManagedSystemElement is also defined as a user-friendly name. But, it is often subclassed to be a Key. It is not reasonable that the same property can convey both identity and a user-friendly name, without inconsistencies. Where Name exists and is not a Key (such as for instances of LogicalDevice), the same information can be present in both the Name and ElementName properties. Note that if there is an associated instance of CIM_EnabledLogicalElementCapabilities, restrictions on this properties may exist as defined in ElementNameMask and MaxElementNameLen properties defined in that class."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_SCSITargetPortGroup")
              (:QUALIFIERS (:VERSION "2.29.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageDevices")
               (:DESCRIPTION
                "A class derived from SystemSpecificCollection that models SCSI Target Port Groups. SCSITargetPortGroup is part of the model for devices with asymmetric access to logical units - access is optimized for a subset of target ports. SCSITargetPortGroup is aggregated to SCSIProtocolEndpoints that expose a common ValueMap { 2, 3, 4, 5, 6 }, Values { Active/Optimized, Active/Non-optimized, StandBy, Unavailable, Transitioning }, access state for a set of associated logical Units (modeled by various subclasses of LogicalDevice). SCSITargetPortGroups only apply to target devices with asymmetric multipath access and not to devices with symmetric (or single path) access.")))