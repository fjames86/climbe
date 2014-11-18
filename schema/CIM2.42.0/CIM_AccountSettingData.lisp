
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AccountSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ACCOUNTSETTINGDATA (CIM_SETTINGDATA)
              ((INACTIVITYTIMEOUT DATETIME :CIM-NAME "InactivityTimeout"
                :QUALIFIERS
                ((:DESCRIPTION
                  "InactivityTimeout specifies the interval after which if an account has been inactive, it shall be Disabled. The value shall be expressed in interval format or shall be NULL. A value of NULL shall indicate that the Account will not be disabled due to inactivity."))
                :INITFORM NIL)
               (MAXIMUMPASSWORDEXPIRATION DATETIME :CIM-NAME
                "MaximumPasswordExpiration" :QUALIFIERS
                ((:DESCRIPTION
                  "MaximumPasswordExpiration indicates the maximum password age enforced for the Account. The value shall be expressed in interval format or shall be NULL. A value of NULL shall indicate that the password aging is not enforced."))
                :INITFORM NIL)
               (MAXIMUMSUCCESSIVELOGINFAILURES UINT16 :CIM-NAME
                "MaximumSuccessiveLoginFailures" :QUALIFIERS
                ((:DESCRIPTION
                  "MaximumSuccessiveLoginFailures indicates the number of successive failed login attempts that shall result in the Account being disabled. A value of zero shall indicate that the Account will not be disabled due to successive failed login attempts."))
                :INITFORM NIL)
               (PASSWORDHISTORYDEPTH UINT16 :CIM-NAME "PasswordHistoryDepth"
                :QUALIFIERS
                ((:DESCRIPTION
                  "PasswordHistoryDepth indicates the number of previous passwords that shall be maintained for the Account. The Account shall preclude the selection of a password if it occurs in the password history. A value of zero shall indicate that a password history is not maintained."))
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
               (COMPLEXPASSWORDRULESENFORCED (ARRAY UINT16) :CIM-NAME
                "ComplexPasswordRulesEnforced" :QUALIFIERS
                ((:DESCRIPTION
                  "ComplexPasswordRulesEnforced indicates the rules for constructing a complex password enforced by the Account.
Minimum Length a minimum length is enforced for passwords for the account.
Preclude User ID inclusion precluding the password from including the user ID is supported. 
Maximum Repeating Characters a limit will be enforced on the number of times a character can occur consecutively. 
Lower Case Alpha at least one lower case alpha character is required. 
Upper Case Alpha at least one upper case alpha character is required. 
Numeric Character at least one numeric character is required. 
Special Character at least one special character is required.")
                 (:VALUE-MAP
                  ("2" "3" "4" "5" "6" "7" "8" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("Minimum Length" "Preclude User ID Inclusion"
                   "Maximum Repeating Characters" "Lower Case Alpha"
                   "Upper Case Alpha" "Numeric Character" "Special Character"
                   "DMTF Reserved" "Vendor Reserved")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_AccountSettingData")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::User::Account")
               (:DESCRIPTION
                "CIM_AccountSettingData provides the ability to manage the desired configuration for an instance of CIM_Account. When associated with an instance of CIM_AccountManagementService, this class may be used to constrain the properties of instances of CIM_Accountcreated using the service. When associated with an instance of CIM_Account, this class may be used to manage the configuration of the CIM_Acount instance.")))