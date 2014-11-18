
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BootConfigSetting.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BOOTCONFIGSETTING (CIM_SETTINGDATA)
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
                :INITFORM NIL))
              (:CIM-NAME "CIM_BootConfigSetting")
              (:QUALIFIERS (:VERSION "2.19.0")
               (:UML-PACKAGE-PATH "CIM::System::Boot")
               (:DESCRIPTION
                "A class derived from SettingData that provides the container to arrange all the BootSourceSetting instances in an ordered sequence. There can be one or more of the BootConfigSetting instances associated to a ComputerSystem. For example, one such BootConfigSetting could be a default boot configuration supplied by the manufacturer, a second one could be a configuration recommended by the IT Administrator. A third one could be the one actually to be used on next system boot.")))
(DEFCIM-METHOD CHANGEBOOTORDER
    ((INSTANCE CIM_BOOTCONFIGSETTING)
     (JOB "CIM_ConcreteJob" "Job" :IN :OUT
      (:DESCRIPTION
       "Reference to the job spawned if the operation continues after the method returns. (May be null if the task is completed)."))
     (SOURCE "CIM_BootSourceSetting" "Source" :IN
      (:DESCRIPTION "An ordered array of BootSourceSettings.")))
    ((:CIM-NAME "ChangeBootOrder")
     (:QUALIFIERS
      (:DESCRIPTION
       "This method is called to change the boot order within a boot configuration. An ordered array of BootSourceSetting instances is passed to this method. Each BootSourceSetting instance MUST already be associated with this BootConfigSetting instance via an instance of OrderedComponent. If not, the implementation MUST return a value of \"Invalid Parameter\" Upon execution of this method, the value of the AssignedSequence property on each instance of OrderedComponent will be updated such that the values are monotonically increasing in correlation with the position of the referenced BootSourceSetting instance in the source input parameter. That is, the first position in the array will have the lowest value for AssignedSequence. The second position will have the second lowest value, and so on. For BootSourceSetting instances which are associated with the BootConfigSetting instance via OrderedComponent and not present in the input array, the AssignedSequence property on the OrderedComponent association will be assigned a value of 0.")
      (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7..32767" "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported" "Unknown/Unspecified Error"
        "Busy" "Invalid Reference" "Invalid Parameter" "Access Denied"
        "DMTF Reserved" "Vendor Specified")))))
(DEFCIM-METHOD VALIDATESETTINGS
    ((INSTANCE CIM_BOOTCONFIGSETTING))
    ((:CIM-NAME "ValidateSettings")
     (:QUALIFIERS
      (:DESCRIPTION
       "This method validates all settings associated with the BootConfigSetting. This is to make sure that all the settings of the newly created BootConfigSetting are consistent with the system configuration. This method returns True or False. True would only mean that the instrumentation has made a consistency check based on its current knowledge of the system, and does not actually guarantee the success of boot process.")
      (:VALUE-MAP ("0" "1" "2" "3" "4..32767" "32768..65535"))
      (:VALUES
       ("Settings Validated OK" "Conflicting Settings"
        "Unknown/Unspecified Error" "Busy" "DMTF Reserved"
        "Vendor Specified")))))