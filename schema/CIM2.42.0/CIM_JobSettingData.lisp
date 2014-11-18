
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_JobSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_JOBSETTINGDATA (CIM_SETTINGDATA)
              ((DELETEONCOMPLETION BOOLEAN :CIM-NAME "DeleteOnCompletion"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Indicates whether or not the Job should be automatically deleted upon completion. Note that the 'completion' of a recurring job is defined by its JobRunTimes or UntilTime properties, OR when the Job is terminated by manual intervention.")
                 (:MODEL-CORRESPONDENCE ("CIM_Job.DeleteOnCompletion")))
                :INITFORM NIL)
               (RECOVERYACTION UINT16 :CIM-NAME "RecoveryAction" :QUALIFIERS
                ((:DESCRIPTION
                  "Describes the recovery setting if the Job does not successfully complete. The possible values are: 
0 = \"Unknown\", meaning it is unknown as to what recovery action to take 
1 = \"Other\", indicating that the recovery action will be specified in the property, OtherRecoveryAction 
2 = \"Do Not Continue\", meaning stop the execution of the job and appropriately update its status 
3 = \"Continue With Next Job\", meaning continue with the next job in the queue 
4 = \"Re-run Job\", indicating that the job should be re-run 
5 = \"Run Recovery Job\", meaning run the Job associated using the RecoveryJob relationship. Note that the recovery Job MUST already be on the queue from which it will run.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "Other" "Do Not Continue" "Continue With Next Job"
                   "Re-run Job" "Run Recovery Job"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_JobSettingData.OtherRecoveryAction"
                   "CIM_Job.RecoveryAction")))
                :INITFORM NIL)
               (OTHERRECOVERYACTION STRING :CIM-NAME "OtherRecoveryAction"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the recovery action when the instance's RecoveryAction property is 1 (\"Other\").")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_JobSettingData.RecoveryAction"
                   "CIM_Job.OtherRecoveryAction")))
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
              (:CIM-NAME "CIM_JobSettingData")
              (:QUALIFIERS (:VERSION "2.9.0")
               (:UML-PACKAGE-PATH "CIM::System::Processing")
               (:DESCRIPTION
                "JobSettingData represents job characteristics and scheduling information for a CIM_Job. The settings may be applied to a job handling Service, a JobQueue or other destination to which jobs are submitted, and/or to individual CIM_Jobs. The applicability of the settings are defined using the ElementSettingData relationship. Since the Settings may be defined in several contexts and applied to many types of elements, this class is defined as a subclass of SettingData, versus ScopedSettingData.")))