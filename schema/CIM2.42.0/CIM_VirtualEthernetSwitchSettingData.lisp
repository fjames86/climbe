
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_VirtualEthernetSwitchSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_VIRTUALETHERNETSWITCHSETTINGDATA
              (CIM_VIRTUALSYSTEMSETTINGDATA)
              ((MAXNUMMACADDRESS UINT32 :CIM-NAME "MaxNumMACAddress"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property specifies the number of unique MAC addresses that can be learned by the bridge to support MAC Address Learning, as defined in the IEEE 802.1D standard or in a VLAN-aware bridge this property specifies the number of MAC,VID pairs learned by the bridge to support learning as definded in the IEEE 802.1Q standard."))
                :INITFORM NIL)
               (EVBMODE UINT16 :CIM-NAME "EVBMode" :QUALIFIERS
                ((:DESCRIPTION
                  "Describes the Ethernet virtual bridge mode that this bridge is operating in. The value 2(VEB) indicates that the associated port on the adjacent bridge is not configured for Reflective Relay and 3 (VEPA) indicates that the associated port on the adjacent bridge is configured for Reflective Relay as defined in IEEE 802.1Qbg. The value 4 (Direct) indicates that a bridge is directly connected to or is part of a hardware Ethernet NIC. The value 5 (S-VLAN Component) indicates that this is an S-VLAN component as defined in IEEE 802.1Qbg.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("Unknown" "Other" "VEB" "VEPA" "Direct" "S-VLAN Component"
                   "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_VirtualEthernetSwitchSettingData.OtherEVBMode")))
                :INITFORM NIL)
               (OTHEREVBMODE STRING :CIM-NAME "OtherEVBMode" :QUALIFIERS
                ((:DESCRIPTION
                  "A string that shall describe the EVBMode when a well defined value is not available and EVBMode matches 1 (Other). This property should be set to null when the EVBMode is set to any other value than 1.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_VirtualEthernetSwitchSettingData.EVBMode")))
                :INITFORM NIL)
               (VIRTUALSYSTEMIDENTIFIER STRING :CIM-NAME
                "VirtualSystemIdentifier" :QUALIFIERS
                ((:DESCRIPTION
                  "VirtualSystemIdentifier shall reflect a unique name for the system as it is used within the virtualization platform. Note that the VirtualSystemIdentifier is not the hostname assigned to the operating system instance running within the virtual system, nor is it an IP address or MAC address assigned to any of its network ports. 
On create requests VirtualSystemIdentifier may contain implementation specific rules (like simple patterns or regular expresssion) that may be interpreted by the implementation when assigning a VirtualSystemIdentifier."))
                :INITFORM NIL)
               (VIRTUALSYSTEMTYPE STRING :CIM-NAME "VirtualSystemType"
                :QUALIFIERS
                ((:DESCRIPTION
                  "VirtualSystemType shall reflect a particular type of virtual system.
The property value shall conform to this format (in ABNF): vs-type = dmtf-value / other-org-value / legacy-value; dmtf-value = \"DMTF:\" defining-org \":\" org-vs-type; other-org-value = defining-org \":\" org-vs-type;
Where: 
dmtf-value: is a property value defined by DMTF and is defined in the description of this property. 
other-org-value: is a property value defined by a business entity other than DMTF and is not defined in the description of this property. 
legacy-value: is a property value defined by a business entity other than DMTF and is not defined in the description of this property. These values are permitted but recommended to be deprecated over time. 
defining-org: is an identifier for the business entity that defines the virtual system type. It shall include a copyrighted, trademarked, or otherwise unique name that is owned by that business entity. It shall not be \"DMTF\" and shall not contain a colon (:).
org-vs-type: is an identifier for the virtual system type within the defining business entity. It shall be unique within the defining-org. It may use any character allowed for CIM strings, except for the following: U+0000-U+001F (Unicode C0 controls) U+0020 (space), note that the reason is that OVF allows for multiple space-separated vs-type values in this property. U+007F (Unicode C0 controls) U+0080-U+009F (Unicode C1 controls)

If there is a need to structure the value into segments, the segments should be separated with a single colon (:).
The values of this property shall be processed case sensitively. They are intended to be processed programmatically (instead of being a display name) and should be short.

The following DMTF values are defined: 
DMTF:unknown - the virtual system type is unknown or cannot be determined
DMTF:XEN:PV -- Para Virtualized Machine (tuned for XEN, not able to migrate to another virtualization platform)
DMTF:XEN:HVM -- Hardware Virtualized Machine (able to migrate to another virtualization platform)
DMTF:HP:HPVM -- HP Integrity Virtualization Technology
DMTF:HP:Servers -- Physical servers, including blades
DMTF:Huawei:UVP -- Huawei Unified Virtulization Platform
DMTF:IBM:z/Arch:LPAR:ESA/390 -- IBM z/Architecture capable LPAR in ESA/390 mode
DMTF:IBM:z/Arch:LPAR:ESA/TPFvIBM z/Architecture capable LPAR in ESA/390 TPF mode
DMTF:IBM:z/Arch:LPAR:LINUX -- IBM z/Architecture capable LPAR in LINUX mode
DMTF:IBM:z/Arch:LPAR:VM -- IBM z/Architecture capable LPAR in z/VM mode
DMTF:IBM:z/Arch:LPAR:CF -- IBM z/Architecture capable LPAR in Coupling Facility mode
DMTF:IBM:z/Arch:z/VM:ESA/390 -- IBM z/Architecture capable z/VM guest in ESA/390 virtual config mode
DMTF:IBM:z/Arch:z/VM:LINUX -- IBM z/Architecture capable z/VM guest in LINUX virtual config mode
DMTF:IBM:z/Arch:z/VM:VM -- IBM z/Architecture capable z/VM guest in VM virtual config mode
DMTF:IBM:z/Arch:z/VM:CF -- IBM z/Architecture capable z/VM guest in CF virtual config mode
DMTF:IBM:POWER:AIXLINUX -- IBM POWER LPAR of AIXLINUX typeDMTF:IBM:POWER:VIOS -- IBM POWER LPAR of VIOS type
DMTF:IBM:POWER:i5/OS -- IBM POWER LPAR of i5/OS type
DMTF:KVM -- KVM guest
DMTF:Microsoft:Hyper-V
DMTF:Microsoft:Virtual PC
DMTF:Oracle:X86:OracleVM_Xen:PVM_Linux -- OracleVM capable Linux guest in Xen Para Virtualization mode
DMTF:Oracle:X86:OracleVM_Xen:HVM_Linux -- OracleVM capable Linux guest in Xen Full Virtualization mode
DMTF:Oracle:X86:OracleVM_Xen:Windows -- OracleVM capable Windows guest in Xen Full Virtualization mode
DMTF:Oracle:X86:OracleVM_Xen:Solaris -- OracleVM capable Solaris guest in Xen Full Virtualization mode
DMTF:Oracle:X86:OracleVM_VirtualBox:Linux -- OracleVM capable Linux guest in VirtualBox Full Virtualization mode
DMTF:Oracle:X86:OracleVM_VirtualBox:Windows -- OracleVM capable Windows guest in VirtualBox Full Virtualization mode
DMTF:Oracle:X86:OracleVM_VirtualBox:Solaris -- OracleVM capable Solaris guest in VirtualBox Full Virtualization mode
DMTF:Oracle:Sparc:OracleVM_LDoms:Solaris -- OracleVM capable Solaris guest in LDoms mode
DMTF:Oracle:X86:OracleVM_Xen:PVHVM_Linux -- OracleVM capable Linux guest in Xen Full Virtualization with PV driver mode
DMTF:Oracle:X86:OracleVM_Xen:PVHVM_Windows -- OracleVM capable Windows guest in Xen Full Virtualization with PV driver mode
DMTF:VMware:vmx-04 -- ESX 3.0 and greater, Workstation 5.0 and greater, Server 1.0 and greater
DMTF:VMware:vmx-07 -- ESX 4.0 and greater, Workstation 7.0 and greater, Server 2.0 and greater, Fusion 2.0 and greater
DMTF:VMware:vmx-08 -- vSphere 5.0 and greater, Workstation 8.0 and greater, Fusion 4.0 and greater
DMTF:VMware:vmx-09 -- vSphere 5.1 and greater, Workstation 9.0 and greater, Fusion 5.0 and greater"))
                :INITFORM NIL)
               (CREATIONTIME DATETIME :CIM-NAME "CreationTime" :QUALIFIERS
                ((:DESCRIPTION
                  "Time when the virtual system configuration was created."))
                :INITFORM NIL)
               (CONFIGURATIONID STRING :CIM-NAME "ConfigurationID" :QUALIFIERS
                ((:DESCRIPTION
                  "Unique id of the virtual system configuration. Note that the ConfigurationID is different from the InstanceID as it is assigned by the implementation to a virtual system or a virtual system configuration. It is not a key, and the same value may occur within more than one instance."))
                :INITFORM NIL)
               (CONFIGURATIONDATAROOT STRING :CIM-NAME "ConfigurationDataRoot"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Filepath of a directory where information about the virtual system configuration is stored.Format shall be URI based on RFC 2079."))
                :INITFORM NIL)
               (CONFIGURATIONFILE STRING :CIM-NAME "ConfigurationFile"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Filepath of a file where information about the virtual system configuration is stored. A relative path appends to the value of the ConfigurationDataRoot property.Format shall be URI based on RFC 2079."))
                :INITFORM NIL)
               (SNAPSHOTDATAROOT STRING :CIM-NAME "SnapshotDataRoot"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Filepath of a directory where information about virtual system snapshots is stored. A relative path appends to the value of the ConfigurationDataRoot property.Format shall be URI based on RFC 2079."))
                :INITFORM NIL)
               (SUSPENDDATAROOT STRING :CIM-NAME "SuspendDataRoot" :QUALIFIERS
                ((:DESCRIPTION
                  "Filepath of a directory where suspend related information about the virtual system is stored. A relative path appends to the value of the ConfigurationDataRoot property.Format shall be URI based on RFC 2079."))
                :INITFORM NIL)
               (SWAPFILEDATAROOT STRING :CIM-NAME "SwapFileDataRoot"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Filepath of a directory where swapfiles of the virtual system are stored. A relative path appends to the value of the ConfigurationDataRoot property.Format shall be URI based on RFC 2079."))
                :INITFORM NIL)
               (LOGDATAROOT STRING :CIM-NAME "LogDataRoot" :QUALIFIERS
                ((:DESCRIPTION
                  "Filepath of a directory where log information about the virtual system is stored. A relative path appends to the value of the ConfigurationDataRoot property.Format shall be URI based on RFC 2079."))
                :INITFORM NIL)
               (AUTOMATICSTARTUPACTION UINT16 :CIM-NAME
                "AutomaticStartupAction" :QUALIFIERS
                ((:DESCRIPTION
                  "Action to take for the virtual system when the host is started.")
                 (:VALUE-MAP ("2" "3" "4" ".."))
                 (:VALUES
                  ("None" "Restart if previously active" "Always startup"
                   "DMTF Reserved")))
                :INITFORM NIL)
               (AUTOMATICSTARTUPACTIONDELAY DATETIME :CIM-NAME
                "AutomaticStartupActionDelay" :QUALIFIERS
                ((:DESCRIPTION
                  "Delay applicable to startup action. The value shall be in the interval variant of the datetime datatype."))
                :INITFORM NIL)
               (AUTOMATICSTARTUPACTIONSEQUENCENUMBER UINT16 :CIM-NAME
                "AutomaticStartupActionSequenceNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "Number indicating the relative sequence of virtual system activation when the host system is started. A lower number indicates earlier activation. If one or more configurations show the same value, the sequence is implementation dependent. A value of 0 indicates that the sequence is implementation dependent."))
                :INITFORM NIL)
               (AUTOMATICSHUTDOWNACTION UINT16 :CIM-NAME
                "AutomaticShutdownAction" :QUALIFIERS
                ((:DESCRIPTION
                  "Action to take for the virtual system when the host is shut down.")
                 (:VALUE-MAP ("2" "3" "4" ".."))
                 (:VALUES
                  ("Turn Off" "Save state" "Shutdown" "DMTF Reserved")))
                :INITFORM NIL)
               (AUTOMATICRECOVERYACTION UINT16 :CIM-NAME
                "AutomaticRecoveryAction" :QUALIFIERS
                ((:DESCRIPTION
                  "Action to take for the virtual system when the software executed by the virtual system fails. Failures in this case means a failure that is detectable by the host platform, such as a non-interuptable wait state condition.")
                 (:VALUE-MAP ("2" "3" "4" ".."))
                 (:VALUES
                  ("None" "Restart" "Revert to snapshot" "DMTF Reserved")))
                :INITFORM NIL)
               (RECOVERYFILE STRING :CIM-NAME "RecoveryFile" :QUALIFIERS
                ((:DESCRIPTION
                  "Filepath of a file where recovery relateded information of the virtual system is stored.Format shall be URI based on RFC 2079."))
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
                :INITFORM NIL)
               (VLANCONNECTION (ARRAY STRING) :CIM-NAME "VLANConnection"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A list of VLANs identified by these VIDs that this bridge can access"))
                :INITFORM NIL)
               (ASSOCIATEDRESOURCEPOOL (ARRAY STRING) :CIM-NAME
                "AssociatedResourcePool" :QUALIFIERS
                ((:DESCRIPTION
                  "A list of host resource pools to be associated or that are currently associated with the Ethernet bridge for the purpose of the allocation of Ethernet connections between a virtual system and an Ethernet bridge Each non-Null value of the AssoicatedResourcePool property shall conform to the production WBEM_URI_UntypedInstancePath as defined in DSP0207"))
                :INITFORM NIL)
               (NOTES (ARRAY STRING) :CIM-NAME "Notes" :QUALIFIERS
                ((:DESCRIPTION
                  "End-user supplied notes that are related to the virtual system."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_VirtualEthernetSwitchSettingData")
              (:QUALIFIERS (:VERSION "2.35.0")
               (:UML-PACKAGE-PATH "CIM::Core::Virtualization")
               (:DESCRIPTION
                "CIM_VirtualEthernetSwitchSettingData specializes CIM_VirtualSystemSettingDatato add the specific properties required to define a virtual Ethernet bridge.")))