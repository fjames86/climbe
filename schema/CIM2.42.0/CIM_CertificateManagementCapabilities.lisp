
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CertificateManagementCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CERTIFICATEMANAGEMENTCAPABILITIES
              (CIM_CREDENTIALMANAGEMENTCAPABILITIES)
              ((ASYMMETRICKEYGENERATION BOOLEAN :CIM-NAME
                "AsymmetricKeyGeneration" :QUALIFIERS
                ((:DESCRIPTION
                  "AsymmetricKeyGeneration property represents the capability of the instrumentation to generate asymmetric public/private key pair."))
                :INITFORM NIL)
               (CUMULATIVEPRIVILEGEMETHODOLOGY UINT16 :CIM-NAME
                "CumulativePrivilegeMethodology" :QUALIFIERS
                ((:DESCRIPTION
                  "Defines the methodology used by the implementation to accumulate the user's privileges for credentials or credential stores that are directly or indirectly associated with the CIM_CredentialManagementService that this instace represents the capability of. 
This methodology is applicable to the credentials and credential stores that are members of another credential store.
The methodology describes how the same user's privilges for a credential gets reconciled with that user's privileges for the credential store that the credential belongs to. The methodology is also applicable for multi-level credential stores where one credential store is a member of another credential store.
2 - Collection Privileges Override - the user's privileges on the instance of CIM_CredentialStore that is referenced by the Collection property of CIM_MemberOfCollection association, overrides the same user's privileges on the CIM_Credential and/or CIM_CredentialStore referenced by the Member property of the same CIM_MemberOfCollection asscociation.
3 - Member Privileges Override - the user's privileges on the instance of CIM_Credential and/or CIM_CredentialStore that is referenced by the Member property of CIM_MemberOfCollection association, overrides the same user's privileges on the CIM_CredentialStore referenced by the Collection property of the same CIM_MemberOfCollection asscociation.
4 - Collection-Member Privileges Union - the user's privileges on the instance of CIM_Credential and/or CIM_CredentialStore that is referenced by the Member property of CIM_MemberOfCollection association, are added to the same user's privileges on the CIM_CredentialStore referenced by the Collection property of the same CIM_MemberOfCollection asscociation.
5 - Collection-Member Privileges Intersection - the user's privileges on the instance of CIM_Credential and/or CIM_CredentialStore that is referenced by the Member property of CIM_MemberOfCollection association, are valid only if the privileges are mirrored with the same user's privileges on the CIM_CredentialStore referenced by the Collection property of the same CIM_MemberOfCollection asscociation.")
                 (:VALUE-MAP ("2" "3" "4" "5"))
                 (:VALUES
                  ("Collection Privileges Override"
                   "Member Privileges Override"
                   "Collection-Member Privileges Union"
                   "Collection-Member Privileges Intersection")))
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
               (SUPPORTEDMETHODS (ARRAY UINT16) :CIM-NAME "SupportedMethods"
                :QUALIFIERS
                ((:OVERRIDE "SupportedMethods")
                 (:DESCRIPTION
                  "Each enumeration corresponds to support for the like-named method of the associated CIM_CertificateManagementService instance(s) for the exception of \"DeleteCredentialInstance\" that refers to the capability of executing delete operation on the instances of the CIM_Credential subclasses.")
                 (:VALUE-MAP
                  ("2" "3" "4" "101" "102" "103" "104" "105" "106" "107" ".."
                   "0x8000.."))
                 (:VALUES
                  ("ImportPublicPrivateKeyPair" "CreateKeystore"
                   "DeleteCredentialInstance" "CreatCertificateSigningRequest"
                   "CreateSelfSignedCertificate" "ImportEncodedCertificates"
                   "ImportCertificates" "ExportEncodedCertificate" "ApplyCRL"
                   "ApplyDecodedCRL" "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (KEYALGORITHMSUPPORTED (ARRAY UINT16) :CIM-NAME
                "KeyAlgorithmSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "If the AsymmetricKeyGeneration is TRUE, this property specifies the possible key algorithms that are supported by the methods that generate public/private key pairs in the associated CIM_CertificateManagementService instance(s).")
                 (:VALUE-MAP ("2" "3" "4" ".." "32768..65535"))
                 (:VALUES
                  ("RSA" "DSA" "ECDSA" "DMTF Rserved" "Vendor Reserved")))
                :INITFORM NIL)
               (INPUTFORMATSSUPPORTED (ARRAY UINT16) :CIM-NAME
                "InputFormatsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "The InputFormatsSupported represents the supported input formats for the certificate(s) and Certificate Revocation List by the methods in the associated CIM_CertificateManagementService instance(s).")
                 (:VALUE-MAP ("2" "3" "4" "5" ".." "32768..65535"))
                 (:VALUES
                  ("DER" "PEM" "PKCS7" "PKCS12" "DMTF Rserved"
                   "Vendor Reserved")))
                :INITFORM NIL)
               (OUTPUTFORMATSSUPPORTED (ARRAY UINT16) :CIM-NAME
                "OutputFormatsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "The OutputFormatsSupported represents the supported output formats for the certificate(s) and Certificate Revocation List by the methods in the associated CIM_CertificateManagementService instance(s).")
                 (:VALUE-MAP ("2" "3" "4" "5" ".." "32768..65535"))
                 (:VALUES
                  ("DER" "PEM" "PKCS7" "PKCS12" "DMTF Rserved"
                   "Vendor Reserved")))
                :INITFORM NIL)
               (SUPPORTEDSIGNATUREALGORITHMS (ARRAY UINT16) :CIM-NAME
                "SupportedSignatureAlgorithms" :QUALIFIERS
                ((:DESCRIPTION
                  "The SupportedSignatureAlgorithms represents the supported signature algorithms for the certificate(s) and Certificate Revocation List by the methods in the associated CIM_CertificateManagementService instance(s). This property covers the algorithms specified in the RFC3279.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "1920..32767" "32768..65535"))
                 (:VALUES
                  ("Other" "SHA1withDSA" "SHA1withECDSA" "SHA224withECDSA"
                   "SHA256withECDSA" "SHA384withECDSA" "SHA512withECDSA"
                   "GOST3411withGOST3410" "GOST3411withECGOST3410" "MD2withRSA"
                   "MD5withRSA" "SHA1withRSA" "SHA224withRSA" "SHA256withRSA"
                   "SHA384withRSA" "SHA512withRSA" "RIPEMD160withRSA"
                   "RIPEMD128withRSA" "RIPEMD256withRSA" "DMTF Reserved"
                   "Vendor Reserved")))
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
              (:CIM-NAME "CIM_CertificateManagementCapabilities")
              (:QUALIFIERS (:VERSION "2.29.0")
               (:UML-PACKAGE-PATH "CIM::User::SecurityServices")
               (:DESCRIPTION
                "CIM_CertificateManagementCapabilities describes the capabilities of the associated CIM_CertificateManagementService instance(s).")))