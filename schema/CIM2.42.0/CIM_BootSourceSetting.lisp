
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BootSourceSetting.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BOOTSOURCESETTING (CIM_SETTINGDATA)
              ((BOOTSTRING STRING :CIM-NAME "BootString" :QUALIFIERS
                ((:DESCRIPTION
                  "A string identifying the boot source. It is typically used by the instrumentation to pass to the boot manager as a selection string. This could be a string identifying the bootable device, such as \"CDROM 1\", or could be an implementation specific address of a bootable partition, such as the following. \"fd(64)unix root=hd(40) swap=hd(41)\", or \"multi(0)disk(0)rdisk(0)partition(1)\\WINDOWS=\"Microsoft Windows XP Professional\"\"."))
                :INITFORM NIL)
               (BIOSBOOTSTRING STRING :CIM-NAME "BIOSBootString" :QUALIFIERS
                ((:DESCRIPTION
                  "A string identifying the boot source which corresponds to the string used by the BIOS to uniquely name the boot source. For example, in systems which implement the BIOS Boot Specification, the string could correspond to the descString string for entries in the IPL Table or BCV Table."))
                :INITFORM NIL)
               (STRUCTUREDBOOTSTRING STRING :CIM-NAME "StructuredBootString"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string identifying the boot source using the format \"<OrgID>:<identifier>:<index>\", in which neither <OrgID>, <identifier> or <index> contains a colon (\":\"). The value of <OrgID> is a copyrighted, trademarked or otherwise unique name that is owned by the entity defining the <identifier>, or is a registered ID that is assigned to the entity by a recognized global authority. For DMTF defined identifiers, the <OrgID> is set to 'CIM'. The <identifiers> are \"Floppy\", \"Hard-Disk\", \"CD/DVD\", \"Network\", \"PCMCIA\", \"USB\". The value of <index> shall be a non-zero integer."))
                :INITFORM NIL)
               (FAILTHROUGHSUPPORTED UINT16 :CIM-NAME "FailThroughSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the behavior when the attempt to boot using the boot source fails (no media, timeout). The current values in the enumeration are: 
0 = Unknown 
1 = Is Supported 
2 = Is Not Supported. 
A value of 1 (Is Supported) indicates that next boot source the boot order is used. A value of 2 (Is Not Supported) indicates that the boot order is terminated and no other boot sources associated to the same CIM_BootConfigSetting are used). The default is 1 (Is Supported)")
                 (:VALUE-MAP ("0" "1" "2"))
                 (:VALUES ("Unknown" "Is Supported" "Not Supported")))
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
              (:CIM-NAME "CIM_BootSourceSetting")
              (:QUALIFIERS (:VERSION "2.19.0")
               (:UML-PACKAGE-PATH "CIM::System::Boot")
               (:DESCRIPTION
                "A class derived from SettingData that provides the information necessary to describe a boot source. This may be optionally associated to a bootable logical device, such as a hard disk partition, or a network device. The information from this class instance is used by the boot manager, such as BIOS/EFI or OS Loader to initiate the boot process, when this instance appears in a BootConfigSetting collection.")))