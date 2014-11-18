
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IEEE8021xSettings.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_IEEE8021XSETTINGS (CIM_SETTINGDATA)
              ((AUTHENTICATIONPROTOCOL UINT16 :CIM-NAME
                "AuthenticationProtocol" :QUALIFIERS
                ((:DESCRIPTION
                  "AuthenticationProtocol shall indicate the desired EAP (Extensible Authentication Protocol) type.
	* EAP-TLS (0): shall indicate that the desired EAP type is the Transport Layer Security EAP type specified in RFC 2716. If AuthenticationProtocol contains 0, Username should not be null, ServerCertificateName and ServerCertificateNameComparison may be null or not null, and RoamingIdentity, Password, Domain, ProtectedAccessCredential, PACPassword, and PSK should be null.
	* EAP-TTLS/MSCHAPv2 (1): shall indicate that the desired EAP type is the Tunneled TLS Authentication Protocol EAP type specified in draft-ietf-pppext-eap-ttls, with Microsoft PPP CHAP Extensions, Version 2 (MSCHAPv2) as the inner authentication method. If AuthenticationProtocol contains 1, Username and Password should not be null, RoamingIdentity, ServerCertificateName, ServerCertificateNameComparison, and Domain may be null or not null, and ProtectedAccessCredential, PACPassword, and PSK should be null.
	* PEAPv0/EAP-MSCHAPv2 (2): shall indicate that the desired EAP type is the Protected Extensible Authentication Protocol (PEAP) Version 0 EAP type specified in draft-kamath-pppext-peapv0, with Microsoft PPP CHAP Extensions, Version 2 (MSCHAPv2) as the inner authentication method. If AuthenticationProtocol contains2, Username and Password should not be null, RoamingIdentity, ServerCertificateName, ServerCertificateNameComparison, and Domain may be null or not null, and ProtectedAccessCredential, PACPassword, and PSK should be null.
	* PEAPv1/EAP-GTC (3): shall indicate that the desired EAP type is the Protected Extensible Authentication Protocol (PEAP) Version 1 EAP type specified in draft-josefsson-pppext-eap-tls-eap, with Generic Token Card (GTC) as the inner authentication method. If AuthenticationProtocol contains 3, Username and Password should not be null, RoamingIdentity, ServerCertificateName, ServerCertificateNameComparison, and Domain may be null or not null, and ProtectedAccessCredential, PACPassword, and PSK should be null.
	* EAP-FAST/MSCHAPv2 (4): shall indicate that the desired EAP type is the Flexible Authentication Extensible Authentication Protocol EAP type specified in IETF RFC 4851, with Microsoft PPP CHAP Extensions, Version 2 (MSCHAPv2) as the inner authentication method. If AuthenticationProtocol contains 4, Username and Password should not be null, RoamingIdentity, ServerCertificateName, ServerCertificateNameComparison, Domain, ProtectedAccessCredential, and PACPassword may be null or not null, and PSK should be null.
	* EAP-FAST/GTC (5): shall indicate that the desired EAP type is the Flexible Authentication Extensible Authentication Protocol EAP type specified in IETF RFC 4851, with Generic Token Card (GTC) as the inner authentication method. If AuthenticationProtocol contains 5, Username and Password should not be null, RoamingIdentity, ServerCertificateName, ServerCertificateNameComparison, Domain, ProtectedAccessCredential, and PACPassword may be null or not null, and PSK should be null.
	* EAP-MD5 (6): shall indicate that the desired EAP type is the EAP MD5 authentication method, specified in RFC 3748. If AuthenticationProtocol contains 6, Username and Password should not be null, Domain may be null or not null, and RoamingIdentity, ServerCertificateName, ServerCertificateNameComparison, ProtectedAccessCredential, PACPassword, and PSK should be null.
	* EAP-PSK (7): shall indicate that the desired EAP type is the EAP-PSK (Pre-Shared Key) EAP type specified in RFC 4764. If AuthenticationProtocol contains 7, Username and PSK should not be null, Domain and RoamingIdentity may be null or not null, and Password, ServerCertificateName, ServerCertificateNameComparison, ProtectedAccessCredential, and PACPassword should be null.
	* EAP-SIM (8): shall indicate that the desired EAP type is the Extensible Authentication Protocol Method for Global System for Mobile Communications (GSM) Subscriber Identity Modules (EAP-SIM), specified in RFC 4186. If AuthenticationProtocol contains 8, Username and PSK should not be null, Domain and RoamingIdentity may be null or not null, and Password, ServerCertificateName, ServerCertificateNameComparison, ProtectedAccessCredential, and PACPassword should be null.
	* EAP-AKA (9): shall indicate that the desired EAP type is the EAP Method for 3rd Generation Authentication and Key Agreement (EAP-AKA), specified in RFC 4187. If AuthenticationProtocol contains 9, Username and PSK should not be null, Domain and RoamingIdentity may be null or not null, and Password, ServerCertificateName, ServerCertificateNameComparison, ProtectedAccessCredential, and PACPassword should be null.
	* EAP-FAST/TLS (10): shall indicate that the desired EAP type is the Flexible Authentication EAP type specified in IETF RFC 4851, with TLS as the inner authentication method. If AuthenticationProtocol contains 10, Username and Password should not be null, RoamingIdentity, ServerCertificateName, ServerCertificateNameComparison, Domain, ProtectedAccessCredential, and PACPassword may be null or not null, and PSK should be null.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" ".."))
                 (:VALUES
                  ("EAP-TLS" "EAP-TTLS/MSCHAPv2" "PEAPv0/EAP-MSCHAPv2"
                   "PEAPv1/EAP-GTC" "EAP-FAST/MSCHAPv2" "EAP-FAST/GTC"
                   "EAP-MD5" "EAP-PSK" "EAP-SIM" "EAP-AKA" "EAP-FAST/TLS"
                   "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("RFC4017.IETF" "RFC2716.IETF"
                   "draft-ietf-pppext-eap-ttls.IETF"
                   "draft-kamath-pppext-peapv0.IETF"
                   "draft-josefsson-pppext-eap-tls-eap" "RFC4851.IETF"
                   "RFC3748.IETF" "RFC4764.IETF" "RFC4186.IETF"
                   "RFC4187.IETF")))
                :INITFORM NIL)
               (ROAMINGIDENTITY STRING :CIM-NAME "RoamingIdentity" :QUALIFIERS
                ((:DESCRIPTION
                  "A string presented to the authentication server in 802.1x protocol exchange. The AAA server determines the format of this string. Formats supported by AAA servers include: <domain>\\<username>, <username>@<domain>."))
                :INITFORM NIL)
               (SERVERCERTIFICATENAME STRING :CIM-NAME "ServerCertificateName"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The name that shall be compared against the subject name field in the certificate provided by the AAA server. Shall contain either the fully qualified domain name of the AAA server, in which case ServerCertificateNameComparison shall contain \"FullName\", or the domain suffix of the AAA server, in which case ServerCertificateNameComparison shall contain \"DomainSuffix\".")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IEEE8021xSettings.ServerCertificateNameComparison")))
                :INITFORM NIL)
               (SERVERCERTIFICATENAMECOMPARISON UINT16 :CIM-NAME
                "ServerCertificateNameComparison" :QUALIFIERS
                ((:DESCRIPTION
                  "The comparison algorithm that shall be used by the server to validate the subject name field of the certificate presented by the AAA server against the value of the ServerCertificateName property.")
                 (:VALUE-MAP ("1" "2" "3" ".."))
                 (:VALUES ("Other" "FullName" "DomainSuffix" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IEEE8021xSettings.ServerCertificateName")))
                :INITFORM NIL)
               (USERNAME STRING :CIM-NAME "Username" :QUALIFIERS
                ((:DESCRIPTION
                  "Identifies the user requesting access to the network.")
                 (:MAPPING-STRINGS
                  ("RFC2716.IETF" "draft-ietf-pppext-eap-ttls.IETF"
                   "draft-kamath-pppext-peapv0.IETF"
                   "draft-josefsson-pppext-eap-tls-eap" "RFC4851.IETF"
                   "RFC3748.IETF" "RFC4764.IETF" "RFC4186.IETF"
                   "RFC4187.IETF")))
                :INITFORM NIL)
               (PASSWORD STRING :CIM-NAME "Password" :QUALIFIERS
                ((:DESCRIPTION
                  "A password associated with the user identified by Username within Domain.")
                 (:MAPPING-STRINGS
                  ("draft-ietf-pppext-eap-ttls.IETF"
                   "draft-kamath-pppext-peapv0.IETF"
                   "draft-josefsson-pppext-eap-tls-eap" "RFC4851.IETF"
                   "RFC3748.IETF")))
                :INITFORM NIL)
               (DOMAIN STRING :CIM-NAME "Domain" :QUALIFIERS
                ((:DESCRIPTION
                  "The domain (also known as realm) within which Username is unique.")
                 (:MAPPING-STRINGS
                  ("draft-ietf-pppext-eap-ttls.IETF"
                   "draft-kamath-pppext-peapv0.IETF"
                   "draft-josefsson-pppext-eap-tls-eap" "RFC4851.IETF"
                   "RFC3748.IETF" "RFC4764.IETF" "RFC4186.IETF"
                   "RFC4187.IETF")))
                :INITFORM NIL)
               (PACPASSWORD STRING :CIM-NAME "PACPassword" :QUALIFIERS
                ((:DESCRIPTION
                  "Optional password to extract the PAC (Protected Access Credential) information from the PAC data.")
                 (:MAPPING-STRINGS ("RFC4851.IETF")))
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
               (PROTECTEDACCESSCREDENTIAL (ARRAY UINT8) :CIM-NAME
                "ProtectedAccessCredential" :QUALIFIERS
                ((:DESCRIPTION
                  "A credential used by the supplicant and AAA server to establish a mutually authenticated encrypted tunnel for confidential user authentication.")
                 :OCTET-STRING (:MAPPING-STRINGS ("RFC4851.IETF")))
                :INITFORM NIL)
               (PSK (ARRAY UINT8) :CIM-NAME "PSK" :QUALIFIERS
                ((:DESCRIPTION
                  "A pre-shared key used for pre-shared key EAP types such as EAP-PSK, EAP-SIM, and EAP-AKA.")
                 :OCTET-STRING
                 (:MAPPING-STRINGS
                  ("RFC4764.IETF" "RFC4186.IETF" "RFC4187.IETF")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_IEEE8021xSettings")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Network::IEEE8021x")
               (:DESCRIPTION
                "IEEE8021xSettings specifies a set of IEEE 802.1x Port-Based Network Access Control settings that can be applied to a ISO OSI layer 2 ProtocolEndpoint.")))