
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_StorageClientSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_STORAGECLIENTSETTINGDATA (CIM_SETTINGDATA)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
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
               (CLIENTTYPES (ARRAY UINT16) :CIM-NAME "ClientTypes" :QUALIFIERS
                ((:DESCRIPTION
                  "This enumeration defines operating system, version, driver, and other host environment factors that influence the behavior exposed by storage systems. Values in this array are combined with data from the OtherClientTypeDescriptions property to provide complete information on the host environment. 
\"Microsoft Windows\" indicates generic Windows operating system. To utilize features of a specific Windows operating system, use the corresponding value for that Windows operating system, for example, \"Microsoft Windows Server 2008\".")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" "22" "23..32767"
                   "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "Standard" "Solaris" "HPUX" "OpenVMS"
                   "Tru64" "Netware" "Sequent" "AIX" "DGUX" "Dynix" "Irix"
                   "Cisco iSCSI Storage Router" "Linux" "Microsoft Windows"
                   "OS400" "TRESPASS" "HI-UX" "VMware ESXi"
                   "Microsoft Windows Server 2008"
                   "Microsoft Windows Server 2003"
                   "Microsoft Windows Server 2012" "DMTF Reserved"
                   "Vendor Specific"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageClientSettingData.OtherClientTypeDescriptions")))
                :INITFORM NIL)
               (OTHERCLIENTTYPEDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherClientTypeDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "When the the corresponding array entry in ClientTypes[] is \"Other\", this entry provides a string describing the manufacturer and OS/Environment. When the corresponding ClientTypes[] entry is not \"Other\", this entry allows variations or qualifications of ClientTypes - for example, different versions of Solaris.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_StorageClientSettingData.ClientTypes")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_StorageClientSettingData")
              (:QUALIFIERS (:VERSION "2.37.0")
               (:UML-PACKAGE-PATH "CIM::User::StorageHardwareID")
               (:DESCRIPTION
                "This class models host environment factors that influence the behavior of Storage Systems. For example, a disk array has different SCSI responses for clients (initiators) configured as AIX verses HPUX. Instances of this setting class can be associated via ElementSettingData to a storage system's LogicalPort, ProtocolController, or Volume instances when these elements have host awareness. These associations are created by the management instrumentation provider to reflect the current configuration. A client deletes/creates these associations to request changes in element host-awareness. This settings class can also be associated with StorageHardwareID instances when that HW ID is configured with host information. An instance of this setting may include several ClientType values if the storage system treats them identically. The storage system exposes all supported setting instances to a WBEM Enumerate request; the client uses the returned settings to determine which types are available.")))