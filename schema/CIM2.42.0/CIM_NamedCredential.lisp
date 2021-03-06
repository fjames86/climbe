
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_NamedCredential.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_NAMEDCREDENTIAL (CIM_CREDENTIAL)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority. (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the organizational entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (LOCALIDENTITY STRING :CIM-NAME "LocalIdentity" :QUALIFIERS
                ((:DESCRIPTION
                  "The local Identity with whom the direct trust relationship exists.")
                 (:MAX-LEN "256")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NamedCredential.LocalIdentityType")))
                :INITFORM NIL)
               (LOCALIDENTITYTYPE UINT16 :CIM-NAME "LocalIdentityType"
                :QUALIFIERS
                ((:DESCRIPTION
                  "LocalIdentityType is used to describe the type of the LocalIdentity.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11"))
                 (:VALUES
                  ("IPV4_ADDR" "FQDN" "USER_FQDN" "IPV4_ADDR_SUBNET"
                   "IPV6_ADDR" "IPV6_ADDR_SUBNET" "IPV4_ADDR_RANGE"
                   "IPV6_ADDR_RANGE" "DER_ASN1_DN" "DER_ASN1_GN" "KEY_ID"))
                 (:MODEL-CORRESPONDENCE ("CIM_NamedCredential.LocalIdentity")))
                :INITFORM NIL)
               (PEERIDENTITY STRING :CIM-NAME "PeerIdentity" :QUALIFIERS
                ((:DESCRIPTION
                  "The peer identity with whom the direct trust relationship exists.")
                 (:MAX-LEN "256")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_NamedCredential.PeerIdentityType")))
                :INITFORM NIL)
               (PEERIDENTITYTYPE UINT16 :CIM-NAME "PeerIdentityType"
                :QUALIFIERS
                ((:DESCRIPTION
                  "PeerIdentityType is used to describe the type of the PeerIdentity.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11"))
                 (:VALUES
                  ("IPV4_ADDR" "FQDN" "USER_FQDN" "IPV4_ADDR_SUBNET"
                   "IPV6_ADDR" "IPV6_ADDR_SUBNET" "IPV4_ADDR_RANGE"
                   "IPV6_ADDR_RANGE" "DER_ASN1_DN" "DER_ASN1_GN" "KEY_ID"))
                 (:MODEL-CORRESPONDENCE ("CIM_NamedCredential.PeerIdentity")))
                :INITFORM NIL)
               (SHAREDSECRETNAME STRING :CIM-NAME "SharedSecretName"
                :QUALIFIERS
                ((:DESCRIPTION
                  "SharedSecretName is an indirect reference to a shared secret. The SecretService does not expose the actual secret but rather provides access to the secret via a name."))
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
                :INITFORM NIL))
              (:CIM-NAME "CIM_NamedCredential")
              (:QUALIFIERS (:VERSION "2.31.1")
               (:UML-PACKAGE-PATH "CIM::User::SharedSecret")
               (:DESCRIPTION
                "CIM_NamedCredential indirectly represents a shared secret credential. The local identity, IKEIdentity, and the remote peer identity share the secret that is named by the SharedSecretName. The SharedSecretName is used by the SharedSecretService to reference the secret.")))