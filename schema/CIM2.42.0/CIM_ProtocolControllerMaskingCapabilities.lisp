
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProtocolControllerMaskingCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PROTOCOLCONTROLLERMASKINGCAPABILITIES (CIM_CAPABILITIES)
              ((PORTSPERVIEW UINT16 :CIM-NAME "PortsPerView" :QUALIFIERS
                ((:DESCRIPTION
                  "An integer enumeration indicating the way that ports per view (ProtocolController) are handled by the underlying storage system.")
                 (:VALUE-MAP ("2" "3" "4"))
                 (:VALUES
                  ("One Port per View" "Multiple Ports per View"
                   "All Ports share the same View")))
                :INITFORM "2")
               (CLIENTSELECTABLEDEVICENUMBERS BOOLEAN :CIM-NAME
                "ClientSelectableDeviceNumbers" :QUALIFIERS
                ((:DESCRIPTION
                  "Set to true if this storage system allows the client to specify the DeviceNumber parameter when calling ControllerConfigurationService.AttachDevice() or specify the DeviceNumbers parameter when calling ControllerConfigurationService.ExposePaths(). Set to false if the implementation does not allow unit numbers to vary for a ProtocolController. However, if set to false and a Device is not the Dependent of a ProtocolControllerForUnit association, the client MUST provide a DeviceNumber parameter in ControllerConfigurationService.AttachDevice or ControllerConfigurationService.ExposePaths. If set to false and the Device is already the Dependent of a ProtocolControllerForUnit association, then the client can omit the DeviceNumber parameter (or supply the same value) in subsequent ControllerConfigurationService.AttachDevice calls."))
                :INITFORM "true")
               (ATTACHDEVICESUPPORTED BOOLEAN :CIM-NAME "AttachDeviceSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Set to true if this storage system supports the AttachDevice method."))
                :INITFORM NIL)
               (ONEHARDWAREIDPERVIEW BOOLEAN :CIM-NAME "OneHardwareIDPerView"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Set to true if this storage system limits configurations to a single subject hardware ID per view. Otherwise, multiple hardware ID types can be used. The default is FALSE, that multiple ID types MAY be used in a single view."))
                :INITFORM "false")
               (UNIQUEUNITNUMBERSPERPORT BOOLEAN :CIM-NAME
                "UniqueUnitNumbersPerPort" :QUALIFIERS
                ((:DESCRIPTION
                  "When set to false, different ProtocolContollers attached to a LogicalPort can expose the same unit numbers. If true, then this storage system requires unique unit numbers across all the ProtocolControllers connected to a LogicalPort."))
                :INITFORM "false")
               (PRIVILEGEDENIEDSUPPORTED BOOLEAN :CIM-NAME
                "PrivilegeDeniedSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "Set to true if this storage system allows a client to create a Privilege instance with PrivilegeGranted set to FALSE."))
                :INITFORM "false")
               (PROTOCOLCONTROLLERREQUIRESAUTHORIZEDIDENTITY BOOLEAN :CIM-NAME
                "ProtocolControllerRequiresAuthorizedIdentity" :QUALIFIERS
                ((:DESCRIPTION
                  "If true, this property indicates that a Privilege/Identity pair MUST be specified when CreateProtocolControllerWithPorts() is called. If false, then the Privilege/Identity pair in CreateProtocolControllerWithPorts() MUST NOT be set."))
                :INITFORM "false")
               (PROTOCOLCONTROLLERSUPPORTSCOLLECTIONS BOOLEAN :CIM-NAME
                "ProtocolControllerSupportsCollections" :QUALIFIERS
                ((:DESCRIPTION
                  "If true, this property indicates that the Identity parameter of CreateProtocolConntrollerWithPorts() MUST contain a reference to a CIM_Collection (or subclass) or to a CIM_Identity (or subclass). If ExposePathsSupported is true, this property indicates the storage system supports SystemSpecificCollections of StorageHardwareIDs."))
                :INITFORM "false")
               (EXPOSEPATHSSUPPORTED BOOLEAN :CIM-NAME "ExposePathsSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Set to true if this storage system supports the ExposePaths and HidePaths methods."))
                :INITFORM NIL)
               (CREATEPROTOCOLCONTROLLERSUPPORTED BOOLEAN :CIM-NAME
                "CreateProtocolControllerSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "Set to true if this storage system supports the CreateProtocolControllerWithPorts method."))
                :INITFORM NIL)
               (MAXIMUMMAPCOUNT UINT16 :CIM-NAME "MaximumMapCount" :QUALIFIERS
                ((:DESCRIPTION
                  "The maximum number of ProtocolCOntrollerForUnit associations that can be associated with a single LogicalDevice (for example, StorageVolume). Zero indicates there is no limit."))
                :INITFORM "0")
               (SPCALLOWSNOLUS BOOLEAN :CIM-NAME "SPCAllowsNoLUs" :QUALIFIERS
                ((:DESCRIPTION
                  "Set to true if the instumentation allows a client to create a configuration where an SPC has no LogicalDevices associated via CIM_ProtocolControllerForUnit associations."))
                :INITFORM "false")
               (SPCALLOWSNOTARGETS BOOLEAN :CIM-NAME "SPCAllowsNoTargets"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Set to true if the instumentation allows a client to create a configuration where an SPC has no target SCSIProtocolEndpoints associated via CIM_SAPAvailableForELement associations."))
                :INITFORM "false")
               (SPCALLOWSNOINITIATORS BOOLEAN :CIM-NAME "SPCAllowsNoInitiators"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Set to true if the instumentation allows a client to create a configuration where an SPC has no StorageHardwareIDs associated via CIM_AuthorizedTarget/CIM_AuthorizedPrivilege/CIM_AuthorizedSubject."))
                :INITFORM "false")
               (SPCSUPPORTSDEFAULTVIEWS BOOLEAN :CIM-NAME
                "SPCSupportsDefaultViews" :QUALIFIERS
                ((:DESCRIPTION
                  "Set to true if it the instrumentation supports 'default view' SPCs that exposes logical units to all initiators (so called 'promiscuous LUNs'. Default view SPCs MUST have be associated to a CIM_StorageHardwareID instance with Name set to the null string. A target port MUST NOT be associated with more a single default view SPC. If PortsPerView is 'All Ports share the same View', then at most one default view SPC MAY be associated with the target system. If SPCAllowsNoLUs is true, the instrumentation MAY instantiate a static default view instance or let the client create one as needed using ExposePaths. For other values of PortsPerView, all default view SPC MUST share the same null-Name CIM_StorageHardwareID instance.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ProtocolControllerMaskingCapabilities.PortsPerView")))
                :INITFORM "true")
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
               (VALIDHARDWAREIDTYPES (ARRAY UINT16) :CIM-NAME
                "ValidHardwareIdTypes" :QUALIFIERS
                ((:DESCRIPTION
                  "A list of the valid values for StrorageHardwareID.IDType. iSCSI IDs MAY use one of three iSCSI formats - iqn, eui, or naa. This three letter format is the name prefix; so a single iSCSI type is provided here, the prefix can be used to further refine the format.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Other" "Port WWN" "Node WWN" "Host Name" "iSCSI Name"))
                 (:ARRAYTYPE "Indexed"))
                :INITFORM NIL)
               (OTHERVALIDHARDWAREIDTYPES (ARRAY STRING) :CIM-NAME
                "OtherValidHardwareIDTypes" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of strings describing types for valid StorageHardwareID.IDType. Used when the ValidHardwareIdTypes includes 1 (\"Other\").")
                 (:ARRAYTYPE "Indexed"))
                :INITFORM NIL))
              (:CIM-NAME "CIM_ProtocolControllerMaskingCapabilities")
              (:QUALIFIERS (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::ProtocolController")
               (:DESCRIPTION
                "A subclass of Capabilities that defines the Masking-related capabilities of a ProtocolController.")))