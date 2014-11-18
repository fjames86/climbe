
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AccountManagementCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ACCOUNTMANAGEMENTCAPABILITIES
              (CIM_ENABLEDLOGICALELEMENTCAPABILITIES)
              ((USERPASSWORDENCRYPTIONSALT STRING :CIM-NAME
                "UserPasswordEncryptionSalt" :QUALIFIERS
                ((:DESCRIPTION
                  "A value unique to the specific WBEM server that may be used in the selected UserPassword encryption algorithm to ensure a value that is unique among all WBEM servers even if a user uses the same password on multiple WBEM servers.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Account.UserPasswordEncryptionAlgorithm")))
                :INITFORM NIL)
               (MAXIMUMACCOUNTSSUPPORTED UINT16 :CIM-NAME
                "MaximumAccountsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "MaximumAccountsSupported shall indicate the maximum number of accounts that may be managed by the associated instance of CIM_AccountManagementService. Note that if multiple instances of CIM_AccountManagementService manage the accounts of a system, the total maximum number of accounts supported on the system is the sum of MaximumAccountsSupported for all of the instances of CIM_AccountManagementService. A value of zero shall indicate that the maximum number of accounts is unknown or that a maximum number of accounts is not enforced."))
                :INITFORM NIL)
               (ELEMENTNAMEEDITSUPPORTED BOOLEAN :CIM-NAME
                "ElementNameEditSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether the ElementName can be modified.")
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.INCITS-T11|SWAPI_UNIT_CONFIG_CAPS_T|EditName"))
                 (:MODEL-CORRESPONDENCE ("CIM_ManagedElement.ElementName")))
                :INITFORM NIL)
               (MAXELEMENTNAMELEN UINT16 :CIM-NAME "MaxElementNameLen"
                :QUALIFIERS
                ((:DESCRIPTION "Maximum supported ElementName length.")
                 (:MAX-VALUE "256")
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.INCITS-T11|SWAPI_UNIT_CONFIG_CAPS_T|MaxNameChars"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_FCSwitchCapabilities.ElementNameEditSupported"
                   "CIM_EnabledLogicalElementCapabilities.ElementNameMask")))
                :INITFORM NIL)
               (ELEMENTNAMEMASK STRING :CIM-NAME "ElementNameMask" :QUALIFIERS
                ((:DESCRIPTION
                  "This string expresses the restrictions on ElementName.The mask is expressed as a regular expression.See DMTF standard ABNF with the Management Profile Specification Usage Guide, appendix C for the regular expression syntax permitted. 
Since the ElementNameMask can describe the maximum length of the ElementName,any length defined in the regexp is in addition to the restriction defined in MaxElementNameLen (causing the smaller value to be the maximum length) The ElementName value satisfies the restriction, if and only if it matches the regular expression")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElementCapabilities.MaxElementNameLen")))
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
               (OPERATIONSSUPPORTED (ARRAY UINT16) :CIM-NAME
                "OperationsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "OperationsSupported describes the type of operations that are supported for an Account associated with the AccountManagementService.
\"Create\" indicates the AccountManagementService may be used to create new accounts.
\"Modify\" indicates that the associated Accounts may be modified.
\"Delete\" indicates that associated Accounts may be deleted.")
                 (:VALUE-MAP
                  ("2" "3" "4" "5" "6" "7" "8" "9" "10" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("Create" "Modify" "Delete" "CreateUserContact"
                   "CreateUserContactByIdentity" "ModifyUserContact"
                   "DeleteUserContact" "GetAccount" "GetUserContact"
                   "DMTF Reserved" "Vendor Reserved")))
                :INITFORM NIL)
               (OTHERSUPPORTEDUSERPASSWORDENCRYPTIONALGORITHMS (ARRAY STRING)
                :CIM-NAME "OtherSupportedUserPasswordEncryptionAlgorithms"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Additional implementation-specific algorithms that a client may use to encrypt a value in the UserPassword property when creating or modifying an instance of CIM_Account. If this property is non-NULL, a client may select an algorithm in it by setting CIM_Account.UserPasswordEncryptionAlgorithm to 1 (\"Other\") and setting CIM_Account.OtherUserPasswordEncryptionAlgorithm to the value of the selected algorithm string.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Account.OtherUserPasswordEncryptionAlgorithm"
                   "CIM_AccountManagementCapabilities.SupportedUserPasswordEncryptionAlgorithms")))
                :INITFORM NIL)
               (SUPPORTEDUSERPASSWORDENCRYPTIONALGORITHMS (ARRAY UINT16)
                :CIM-NAME "SupportedUserPasswordEncryptionAlgorithms"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property enumerates encryption algorithms that a client may use to encrypt a value in the UserPassword property when creating or modifying an instance of CIM_Account. This capability is aimed at ensuring some measure of confidentiality when the password is transferred over an unencrypted transport protocol. An implementation may elect to accept only encrypted passwords, without regard to whether the transport protocol is encrypted. Similarly, a a client may elect to always provide encrypted passwords to implementations that accept either unencrypted or encrypted passwords, even if the underlying transport protocol is encrypted.
See CIM_Account property UserPasswordEncryptionAlgorithm for a description of each enum value.")
                 (:VALUE-MAP ("0" "1" "2" ".."))
                 (:VALUES
                  ("None" "Other" "HTTP Digest MD5(A1)" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Account.UserPasswordEncryptionAlgorithm"
                   "CIM_AccountManagementCapabilities.OtherSupportedUserPasswordEncryptionAlgorithms")))
                :INITFORM NIL)
               (SUPPORTEDUSERPASSWORDENCODINGS (ARRAY UINT32) :CIM-NAME
                "SupportedUserPasswordEncodings" :QUALIFIERS
                ((:DESCRIPTION
                  "This property enumerates encoding algorithms that a client may use to encode the UserPassword property when creating or modifying an instance of CIM_Account. See CIM_Account property UserPasswordEncoding for a description of each enum value.")
                 (:VALUE-MAP
                  ("2" "3" "4" "5" "6" "7" "8" "9" "10" "11" ".."
                   "65536..4294967295"))
                 (:VALUES
                  ("ascii" "kbd" "pin" "UTF-8" "UTF-16" "UTF-16LE" "UTF-16BE"
                   "UCS-2" "UCS-2LE" "UCS-2BE" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_Account.UserPasswordEncoding")))
                :INITFORM NIL)
               (REQUESTEDSTATESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "RequestedStatesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "RequestedStatesSupported indicates the possible states that can be requested when using the method RequestStateChange on the EnabledLogicalElement.")
                 (:VALUE-MAP ("2" "3" "4" "6" "7" "8" "9" "10" "11"))
                 (:VALUES
                  ("Enabled" "Disabled" "Shut Down" "Offline" "Test" "Defer"
                   "Quiesce" "Reboot" "Reset"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.RequestStateChange")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_AccountManagementCapabilities")
              (:QUALIFIERS (:VERSION "2.35.0")
               (:UML-PACKAGE-PATH "CIM::User::Account")
               (:DESCRIPTION
                "AccountManagementCapabilities describes the capabilities supported for managing Accounts associated with an instance of AccountManagementService. AccountManagementCapabilities is associated with an instance of AccountManagementService through the ElementCapabilities association.")))