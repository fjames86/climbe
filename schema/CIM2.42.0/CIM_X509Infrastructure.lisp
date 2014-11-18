
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_X509Infrastructure.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_X509INFRASTRUCTURE (CIM_SIGNEDCREDENTIAL)
              ((VERSION UINT16 :CIM-NAME "Version" :QUALIFIERS
                ((:DESCRIPTION "Version of X.509.")
                 (:VALUE-MAP ("0" "2" "3" "4" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "v1" "v2" "v3" "DMTF Reserved"
                   "Vendor Specified"))
                 (:MAPPING-STRINGS
                  ("RFC3280.IETF|Section 4.1.2.1"
                   "RFC3280.IETF|Section 5.1.2.1")))
                :INITFORM NIL)
               (ISSUERNAME STRING :CIM-NAME "IssuerName" :QUALIFIERS
                ((:OVERRIDE "IssuerName")
                 (:DESCRIPTION
                  "Issuer represents the information about the issuer of the CRL. The Issuer property shall contain information as required by section 4.1.2.4 of RFC 3280 and shall be formatted based on RFC 4514. An example of the value of the Subject parameter could be \"CN=Marshall T. Rose, O=Dover Beach Consulting, OU=Sales, L=Santa Clara, ST=California, C=US\".")
                 :DN
                 (:MAPPING-STRINGS
                  ("RFC3280.IETF|Section 4.1.2.4"
                   "RFC3280.IETF|Section 5.1.2.3")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority. (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the organizational entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (SIGNATUREALGORITHM UINT16 :CIM-NAME "SignatureAlgorithm"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Algorithm used to generate the signature. The algorithms specified are described in RFC3279. If the value of this property is 1, \"Other\", then the OtherSignatureAlgorithm shall be non NULL, non blank string")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "20..32767" "32768..65535"))
                 (:VALUES
                  ("Other" "SHA1withDSA" "SHA1withECDSA" "SHA224withECDSA"
                   "SHA256withECDSA" "SHA384withECDSA" "SHA512withECDSA"
                   "GOST3411withGOST3410" "GOST3411withECGOST3410" "MD2withRSA"
                   "MD5withRSA" "SHA1withRSA" "SHA224withRSA" "SHA256withRSA"
                   "SHA384withRSA" "SHA512withRSA" "RIPEMD160withRSA"
                   "RIPEMD128withRSA" "RIPEMD256withRSA" "DMTF Reserved"
                   "Vendor Reserved")))
                :INITFORM NIL)
               (OTHERSIGNATUREALGORITHM STRING :CIM-NAME
                "OtherSignatureAlgorithm" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the signature algorithm when the SignatureAlgorithm property has the value 1, \"Other\"."))
                :INITFORM NIL)
               (SIGNATUREALGORITHMOID STRING :CIM-NAME "SignatureAlgorithmOID"
                :QUALIFIERS
                ((:DESCRIPTION "Object ID of the signature algorithm."))
                :INITFORM NIL)
               (ISSUED DATETIME :CIM-NAME "Issued" :QUALIFIERS
                ((:DESCRIPTION
                  "The date and time when the credential was issued. Use a value of all '00000101000000.000000+000', (midnight, January 1, 1 BCE at coordinated universal time +0 minutes), if this information is not applicable. On CreateInstance, if this property is unspecified, or set to NULL, then current time is assumed."))
                :INITFORM NIL)
               (EXPIRES DATETIME :CIM-NAME "Expires" :QUALIFIERS
                ((:DESCRIPTION
                  "The date and time when the credential expires (and is not appropriate for use for authentication/ authorization). If this information is not applicable, Use a value of '99991231235959.999999+999', (1 microsecond before midnight, December 31, 9999 CE, at coordinated universal time + 999 minutes). 
On CreateInstance, if this property is unspecified, or set to NULL, then a value of '99991231235959.999999+999' is assumed. Note that this property does not define how the expiration is set - but that there IS an expiration. The property may be set to either a specific date/time or an interval (calculated from the Issued datetime). For example, for Certificate Authority-signed public key, the expiration is determined by the CA. Another example is a voice mail password that expires 60 days after it is set/issued."))
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
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                ((:DESCRIPTION
                  "A user-friendly name for the object. This property allows each instance to define a user-friendly name in addition to its key properties, identity data, and description information. 
Note that the Name property of ManagedSystemElement is also defined as a user-friendly name. But, it is often subclassed to be a Key. It is not reasonable that the same property can convey both identity and a user-friendly name, without inconsistencies. Where Name exists and is not a Key (such as for instances of LogicalDevice), the same information can be present in both the Name and ElementName properties. Note that if there is an associated instance of CIM_EnabledLogicalElementCapabilities, restrictions on this properties may exist as defined in ElementNameMask and MaxElementNameLen properties defined in that class."))
                :INITFORM NIL)
               (TBSCERTIFICATE (ARRAY STRING) :CIM-NAME "TBSCertificate"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The To Be Signed (TBS) certificate is used as an input data to the signature algorithm when the certificate is signed or verified. Only the first element of the array property shall be populated.")
                 :OCTET-STRING
                 (:MAPPING-STRINGS
                  ("RFC3280.IETF|Section 4.1.2" "RFC3280.IETF|Section 5.1.2")))
                :INITFORM NIL)
               (MD5FINGERPRINT (ARRAY STRING) :CIM-NAME "MD5Fingerprint"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Digital signature algorithm that verifies data integrity by creating a 128-bit message digest or fingerprint. The fingerprint is unique to the input data and contains the binary hash of the encoded X509 object such as encoded certificate or CRL.")
                 :OCTET-STRING)
                :INITFORM NIL)
               (SHA1FINGERPRINT (ARRAY STRING) :CIM-NAME "SHA1Fingerprint"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Secure hashing algorithm, a cryptographic message digest algorithm used to verify data integrity by making replication of the fingerprint. The fingerprint is unique to the input data and contains the binary hash of the encoded X509 object such as encoded certificate or CRL.")
                 :OCTET-STRING)
                :INITFORM NIL)
               (FINGERPRINTDIGESTALGORITHMS (ARRAY UINT16) :CIM-NAME
                "FingerprintDigestAlgorithms" :QUALIFIERS
                ((:DESCRIPTION
                  "The algorithm used for hashing the encoded X509 certificate's or CRL's message digest represented in the corresponding element of the FingerPrint array.")
                 (:VALUE-MAP ("2" "3" ".." "32768..65535"))
                 (:VALUES ("MD5" "SHA1" "DMTF Reserved" "Vendor Specified"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_X509Infrastructure.Fingerprints")))
                :INITFORM NIL)
               (FINGERPRINTS (ARRAY STRING) :CIM-NAME "Fingerprints"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Fingerprints property represents the message digests of the encoded X509 certificate or CRL that uniquely identify it and can be used for the integrity verification of the X509 certificate or CRL. Fingerprint is the hash of the encoded X509 certificate or CRL that is based on the algorithm described in the corresponding element of the FingerprintDigestAlgorithms array.")
                 :OCTET-STRING (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_X509Infrastructure.FingerprintDigestAlgorithms")))
                :INITFORM NIL)
               (SIGNATURE (ARRAY UINT8) :CIM-NAME "Signature" :QUALIFIERS
                ((:DESCRIPTION
                  "Certificate authority's or credential owner's identifying digest that confers validity on a signed credential.")
                 :OCTET-STRING)
                :INITFORM NIL))
              (:CIM-NAME "CIM_X509Infrastructure")
              (:QUALIFIERS (:VERSION "2.29.0")
               (:CLASS-CONSTRAINT
                ("/* The constraints below aim to efficiently */  /* represent a singular OctetString. Each of the properties*/  /* is a single encoded string, thus only the first element */  /* needs to be populated. */ inv:self.TBSCertificate->size()<=1"))
               (:UML-PACKAGE-PATH "CIM::User::PublicKey")
               (:DESCRIPTION
                "CIM_X509Infrastructure describes Internet X509 Public Key Infrastructure (PKI) standard based properties used by certificates and certificate revocation lists. For more information on the Internet X509 PKI refer to the RFC 3280.")))