
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IKEProposal.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_IKEPROPOSAL (CIM_SAPROPOSAL)
              ((MAXLIFETIMESECONDS UINT64 :CIM-NAME "MaxLifetimeSeconds"
                :QUALIFIERS
                ((:DESCRIPTION
                  "MaxLifetimeSeconds specifies the maximum time the IKE message sender proposes for an SA to be considered valid after it has been created. A value of zero indicates that the default of 8 hours be used. A non-zero value indicates the maximum seconds lifetime.")
                 (NIL "Seconds")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IKEProposal.MaxLifetimeSeconds"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SecurityAssociationEndpoint.LifetimeSeconds"))
                 (:P-UNIT "second"))
                :INITFORM NIL)
               (MAXLIFETIMEKILOBYTES UINT64 :CIM-NAME "MaxLifetimeKilobytes"
                :QUALIFIERS
                ((:DESCRIPTION
                  "MaxLifetimeKilobytes specifies the maximum kilobyte lifetime the IKE message sender proposes for an SA to be considered valid after it has been created. A value of zero (the default) indicates that there should be no maximum kilobyte lifetime. A non-zero value specifies the desired kilobyte lifetime.")
                 (NIL "KiloBytes")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IKEProposal.MaxLifetimeKilobytes"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SecurityAssociationEndpoint.LifetimeKilobytes"))
                 (:P-UNIT "byte * 10^3"))
                :INITFORM NIL)
               (CIPHERALGORITHM UINT16 :CIM-NAME "CipherAlgorithm" :QUALIFIERS
                ((:DESCRIPTION
                  "CipherAlgorithm is an enumeration that specifies the proposed encryption algorithm. The list of algorithms was generated from Appendix A of RFC2409. Note that the enumeration is different than the RFC list and aligns with the values in IKESAEndpoint.CipherAlgorithm.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8..65000" "65001..65535"))
                 (:VALUES
                  ("Other" "DES" "IDEA" "Blowfish" "RC5" "3DES" "CAST"
                   "DMTF/IANA Reserved" "Vendor Reserved"))
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IKEProposal.CipherAlgorithm"
                   "RFC2409.IETF|Appendix A"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IKESAEndpoint.CipherAlgorithm"
                   "CIM_IKEProposal.OtherCipherAlgorithm")))
                :INITFORM NIL)
               (OTHERCIPHERALGORITHM STRING :CIM-NAME "OtherCipherAlgorithm"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Description of the encryption algorithm when the value 1 (\"Other\") is specified for the property, CipherAlgorithm.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IKESAEndpoint.OtherCipherAlgorithm"
                   "CIM_IKEProposal.CipherAlgorithm")))
                :INITFORM NIL)
               (HASHALGORITHM UINT16 :CIM-NAME "HashAlgorithm" :QUALIFIERS
                ((:DESCRIPTION
                  "HashAlgorithm is an enumeration that specifies the proposed hash function. The list of algorithms was generated from Appendix A of RFC2409. Note that the enumeration is different than the RFC list and aligns with the values in IKESAEndpoint.HashAlgorithm.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5..65000" "65001..65535"))
                 (:VALUES
                  ("Other" "MD5" "SHA-1" "Tiger" "DMTF/IANA Reserved"
                   "Vendor Reserved"))
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IKEProposal.HashAlgorithm"
                   "RFC2409.IETF|Appendix A"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IKESAEndpoint.HashAlgorithm"
                   "CIM_IKEProposal.OtherHashAlgorithm")))
                :INITFORM NIL)
               (OTHERHASHALGORITHM STRING :CIM-NAME "OtherHashAlgorithm"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Description of the hash function when the value 1 (\"Other\") is specified for the property, HashAlgorithm.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IKESAEndpoint.OtherHashAlgorithm"
                   "CIM_IKEProposal.HashAlgorithm")))
                :INITFORM NIL)
               (AUTHENTICATIONMETHOD UINT16 :CIM-NAME "AuthenticationMethod"
                :QUALIFIERS
                ((:DESCRIPTION
                  "AuthenticationMethod is an enumeration that specifies the proposed authentication. The list of methods was generated from Appendix A of RFC2409. Note that the enumeration is different than the RFC list and aligns with the values in IKESAEndpoint.AuthenticationMethod. There is one change to the list - the value 65000 has special meaning. It is a special value that indicates that this particular proposal should be repeated once for each authentication method corresponding to credentials installed on the machine. For example, if the system has a pre-shared key and an public-key certificate, a proposal list would be constructed which includes a proposal that specifies a pre-shared key and a proposal for any of the public-key certificates.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7..64999" "65000" "65001..65535"))
                 (:VALUES
                  ("Other" "Pre-shared Key" "DSS Signatures" "RSA Signatures"
                   "Encryption with RSA" "Revised Encryption with RSA"
                   "DMTF/IANA Reserved" "Any" "Vendor Reserved"))
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IKEProposal.AuthenticationMethod"
                   "RFC2409.IETF|Appendix A"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IKESAEndpoint.AuthenticationMethod"
                   "CIM_IKEProposal.OtherAuthenticationMethod")))
                :INITFORM NIL)
               (OTHERAUTHENTICATIONMETHOD STRING :CIM-NAME
                "OtherAuthenticationMethod" :QUALIFIERS
                ((:DESCRIPTION
                  "Description of the method when the value 1 (\"Other\") is specified for the property, AuthenticationMethod.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IKESAEndpoint.OtherAuthenticationMethod"
                   "CIM_IKEProposal.AuthenticationMethod")))
                :INITFORM NIL)
               (GROUPID UINT16 :CIM-NAME "GroupId" :QUALIFIERS
                ((:DESCRIPTION
                  "The property GroupId specifies the proposed phase 1 security association key exchange group. This property is ignored for all aggressive mode exchanges (IKEAction.ExchangeMode = 4). If the GroupID number is from the vendor-specific range (32768-65535), the property VendorID qualifies the group number. Well-known group identifiers from RFC2412, Appendix E, are: Group 1='768 bit prime', Group 2='1024 bit prime', Group 3 ='Elliptic Curve Group with 155 bit field element', Group 4= 'Large Elliptic Curve Group with 185 bit field element', and Group 5='1536 bit prime'.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" ".." "0x8000.."))
                 (:VALUES
                  ("No Group/Non-Diffie-Hellman Exchange" "DH-768 bit prime"
                   "DH-1024 bit prime" "EC2N-155 bit field element"
                   "EC2N-185 bit field element" "DH-1536 bit prime"
                   "Standard Group - Reserved" "Vendor Reserved"))
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IKEProposal.GroupID"
                   "RFC2412.IETF|Appendix E"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IKESAEndpoint.GroupID" "CIM_IKEProposal.VendorID")))
                :INITFORM NIL)
               (VENDORID STRING :CIM-NAME "VendorID" :QUALIFIERS
                ((:DESCRIPTION
                  "VendorID identifies the vendor when the value of GroupID is in the vendor-specific range, 32768 to 65535.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IKESAEndpoint.VendorID" "CIM_IKEProposal.GroupId")))
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
              (:CIM-NAME "CIM_IKEProposal")
              (:QUALIFIERS (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::IPsecPolicy")
               (:DESCRIPTION
                "IKEProposal contains the parameters necessary to drive the phase 1 IKE negotiation.")
               (:MAPPING-STRINGS ("IPSP Policy Model.IETF|IKEProposal"))))