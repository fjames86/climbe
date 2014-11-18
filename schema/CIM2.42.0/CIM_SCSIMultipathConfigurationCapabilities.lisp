
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SCSIMultipathConfigurationCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SCSIMULTIPATHCONFIGURATIONCAPABILITIES (CIM_CAPABILITIES)
              ((CANSETTPGACCESS BOOLEAN :CIM-NAME "CanSetTPGAccess" :QUALIFIERS
                ((:DESCRIPTION
                  "The capability of the driver to support the SetTPGAccess method. True if the implementation supports activating target port groups.")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_PLUGIN_PROPERTIES|canSetTPGAccess"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SCSIPathConfigurationService.SetTPGAccess")))
                :INITFORM "false")
               (CANOVERRIDEPATHS BOOLEAN :CIM-NAME "CanOverridePaths"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The capability of the driver to support the SetOverridePath and CancelOverridePaths methods. True if the implementation supports path overrides.")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_PLUGIN_PROPERTIES|canOverridePaths"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SCSIPathConfigurationService.SetOverridePath")))
                :INITFORM "false")
               (EXPOSESPATHDEVICEFILES BOOLEAN :CIM-NAME
                "ExposesPathDeviceFiles" :QUALIFIERS
                ((:DESCRIPTION
                  "False if the MP drivers assure only a single device file name (e.g. /dev/dsk/...) exists for each MP device. True if the implementation exposes (or leaves exposed) device files for the individual paths encapsulated by the multipath device file. This is typically true for MP drivers that sit near the top of the driver stack and false for transport drivers at the bottom of the stack.")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|Plugin Properties|exposesPathDeviceFiles")))
                :INITFORM NIL)
               (DEVICENAMEFILESPACE STRING :CIM-NAME "DeviceNameFilespace"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string representing the primary file names the driver uses for multipath logical units, if those filenames do not match the names in Logical Unit osDeviceName as documented in Appendix A of the SNIA MP API specification. The name is expressing in the following format: 
'*' represents one or more alphanumeric characters 
'#' represents a string of consecutive digits 
'%' represents a string of hexadecimal digits 
backslash is an escape character for literal presentation of *, #, or %. Any other character is interpreted literally. For example, '/dev/vx/dmp/*'. If the multipath driver creates multipath logical unit device file names in the same namespace as the OS then this property should be left null.")
                 (:MAX-LEN "256")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_PLUGIN_PROPERTIES|deviceNameFilespace")))
                :INITFORM NIL)
               (ONLYSUPPORTSSPECIFIEDPRODUCTS BOOLEAN :CIM-NAME
                "OnlySupportsSpecifiedProducts" :QUALIFIERS
                ((:DESCRIPTION
                  "True if the only supported device types are those described in aggregated CIM_Product instances as described in the description of SupportedLoadBalanceTypes.")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_PLUGIN_PROPERTIES|deviceNameFilespace"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SCSIMultipathConfigurationCapabilities.SupportedLoadBalanceTypes")))
                :INITFORM "false")
               (MAXIMUMWEIGHT UINT32 :CIM-NAME "MaximumWeight" :QUALIFIERS
                ((:DESCRIPTION
                  "Describes the range of administer settable path weights supported by the driver. A driver with no path preference capabilities should set this property to zero. A driver with the ability to enable/disable paths should set this property to 1. Drivers with more weight settings can set the property appropriately.")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_PLUGIN_PROPERTIES|maximumWeight")))
                :INITFORM NIL)
               (AUTOFAILBACKSUPPORT UINT16 :CIM-NAME "AutofailbackSupport"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Specifies whether the implementation supports auto-failback (to re-enable paths that revert to a good state) at the plugin level, the multipath logical unit level, both levels or whether auto-failback is unsupported.")
                 (:VALUE-MAP ("0" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "No Autofailback support"
                   "Autofailback support service-wide"
                   "Autofailback support per logical unit"
                   "Autofailback support per service or logical unit"))
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_PLUGIN_PROPERTIES|autofailbackSupport"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SCSIMultipathConfigurationCapabilities.AutofailbackEnabled"
                   "CIM_SCSIMultipathSettings.AutofailbackEnabled")))
                :INITFORM NIL)
               (AUTOFAILBACKENABLED BOOLEAN :CIM-NAME "AutoFailbackEnabled"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A Boolean indicating that autofailback is enabled to all logical units associated to the CIM_SCSIPathConfigurationService associated with this capabilities instance (unless overridden by CIM_SCSIMultipathSettings AutoFailbackEnabled.")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_PLUGIN_PROPERTIES|autoFailbackEnabled"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SCSIMultipathConfigurationCapabilities.AutofailbackSupport"
                   "CIM_SCSIMultipathSettings.AutofailbackEnabled")))
                :INITFORM NIL)
               (POLLINGRATEMAX UINT32 :CIM-NAME "PollingRateMax" :QUALIFIERS
                ((:DESCRIPTION
                  "The maximum polling rate (in seconds) supported by the driver. A value of zero indicates the driver/plugin does not support polling. This maximum applies to both BadPathPollingRate and InactivePathPollingRate.")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_PLUGIN_PROPERTIES|pollingRateMax")))
                :INITFORM NIL)
               (CURRENTPOLLINGRATE UINT32 :CIM-NAME "CurrentPollingRate"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The current rate in seconds. Only valid when pollingRateMax is greater than 0 and canAutoFailback are true.")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_PLUGIN_PROPERTIES|currentPollingRate")))
                :INITFORM NIL)
               (DEFAULTLOADBALANCETYPE UINT16 :CIM-NAME
                "DefaultLoadBalanceType" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The load balance types supported by the driver if not overridden by an administrative action.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6"))
                 (:VALUES
                  ("Unknown" "Other" "No Load Balancing" "Round Robin"
                   "Least Blocks" "Least IO" "Product Specific"))
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_PLUGIN_PROPERTIES|defaultLoadBalanceType")))
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
               (SUPPORTEDLOADBALANCETYPES (ARRAY UINT16) :CIM-NAME
                "SupportedLoadBalanceTypes" :QUALIFIERS
                ((:DESCRIPTION
                  "The load balance types supported by the driver for all logical units on a target device. If 'Product Specified' is included, one or more instances of CIM_Product must be aggregated to the capabilities instance via ConcreteComponent. Each Product instance provides the SCSI Vendor, Product, and Revision ID of a supported product.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7"))
                 (:VALUES
                  ("Unknown" "Other" "No Load Balancing" "Round Robin"
                   "Least Blocks" "Least IO" "LBA Region" "Product Specific"))
                 (:ARRAYTYPE "Indexed")
                 (:MAPPING-STRINGS ("MP_API.SNIA|MP_LOAD_BALANCE_TYPE"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SCSIMultipathConfigurationCapabilities.OtherSupportedLoadBalanceAlgorithmNames"
                   "CIM_SCSIMultipathConfigurationCapabilities.OtherSupportedLoadBalanceVendorNames")))
                :INITFORM NIL)
               (OTHERSUPPORTEDLOADBALANCEALGORITHMNAMES (ARRAY STRING)
                :CIM-NAME "OtherSupportedLoadBalanceAlgorithmNames" :QUALIFIERS
                ((:DESCRIPTION
                  "When the corresponding array entry in SupportedLoadBalanceTypes[] is 'Other', this entry provides a string describing the load balancing algorithm. When the corresponding array entry in SupportedLoadBalanceTypes[] is 'Product Specific', this entry provides a string specifying the SCSI vendor/product/revision and must be formatted as exactly 28 ASCII characters - 8 for vendor, 16 for product, and 4 for revision (see SCSI SPC Inquiry response)")
                 (:ARRAYTYPE "Indexed")
                 (:MAPPING-STRINGS
                  ("SPC.INCITS-T10 |Standard Inquiry Response"
                   "MP_API.SNIA|MP_LOAD_BALANCE_TYPE"
                   "MP_API.SNIA|MP_DEVICE_PRODUCT_PROPERTIES"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SCSIMultipathConfigurationCapabilities.SupportedLoadBalanceTypes"
                   "CIM_SCSIMultipathConfigurationCapabilities.OtherSupportedLoadBalanceVendorNames")))
                :INITFORM NIL)
               (OTHERSUPPORTEDLOADBALANCEVENDORNAMES (ARRAY STRING) :CIM-NAME
                "OtherSupportedLoadBalanceVendorNames" :QUALIFIERS
                ((:DESCRIPTION
                  "When the corresponding array entry in SupportedLoadBalanceTypes[] is 'Other', this entry provides a string describing the vendor associated with the load balancing algorithm.")
                 (:ARRAYTYPE "Indexed")
                 (:MAPPING-STRINGS ("MP_API.SNIA|MP_LOAD_BALANCE_TYPE"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SCSIMultipathConfigurationCapabilities.SupportedLoadBalanceTypes"
                   "CIM_SCSIMultipathConfigurationCapabilities.OtherSupportedLoadBalanceAlgorithmNames")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_SCSIMultipathConfigurationCapabilities")
              (:QUALIFIERS (:VERSION "2.29.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageDevices")
               (:DESCRIPTION
                "A class derived from CIM_Capabilities that models the capabilities of a multipath driver. Note that 'path' in this context refers to end-to-end device paths (for example, SCSI initiator/target) with no understanding of edge paths between interconnect elements such as switches. Load balancing only applies to symmetric multipath devices or to the ports in SCSITargetPortGroups in active access state. 
A driver may support different algorithms for load balancing. A few common algorithms are listed. Algorithms for specific device models and software vendor specific algorithms are also accommodated. 

An instance of this capabilities class MUST be instantiated whenever SCSIPathConfigurationService is instantiated and they MUST be assocaited one to one using ElementCapabilities. Multiple instances of the service/acapabilities pair MAY exist if multiple multipath drivers are installed. Each LogicalDevice subclass served by the underlying multipath driver is associated to the associated Service instance via ServiceAvailableToELement.")))