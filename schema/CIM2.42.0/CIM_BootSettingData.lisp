
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BootSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BOOTSETTINGDATA (CIM_SETTINGDATA)
              ((OWNINGENTITY STRING :CIM-NAME "OwningEntity" :QUALIFIERS
                ((:DESCRIPTION
                  "OwningEntity identifies the vendor or organization that defines the contained boot settings. In order to ensure uniqueness, the value of OwningEntity MUST be constructed using the following algorithm: 
<OrgID>[:<LocalID>] 
where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the entity creating/defining the BootSettingData, or is a registered ID that is assigned to the entity by a recognized global authority (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, <OrgID> MUST NOT contain a colon (':'). 
<LocalID> is optional and, when used, MUST be unique within the scope of the <OrgID>. When a <LocalID> is present, a colon MUST appear between <OrgID> and <LocalID>. For DMTF defined instances, the algorithm MUST be used with the <OrgID> set to 'CIM'."))
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
              (:CIM-NAME "CIM_BootSettingData")
              (:QUALIFIERS :ABSTRACT (:VERSION "2.19.0")
               (:UML-PACKAGE-PATH "CIM::System::Boot")
               (:DESCRIPTION
                "BootSettingData is a set of settings that apply to system boot. An example of usage of this class is to hold several BIOS, NVRAM, firmware or system settings, typically seen in the BIOS setup screens. These settings would need to be modified by the system as part of the boot process. Since, it is often not possible to intercept the boot process to apply these settings, users can set these a priori in the instance associated with the selected BootSourceSetting, thereby instructing the system to apply them during the next system reboot.")))