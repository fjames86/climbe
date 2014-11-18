
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IPNetworkIdentity.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_IPNETWORKIDENTITY (CIM_IDENTITY)
              ((IDENTITYTYPE UINT16 :CIM-NAME "IdentityType" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The IdentityType specifies the type of IP network Identity. The list of identities was generated from Section 4.6.2.1 of RFC2407. Note that the enumeration is different than the RFC list, since the value 'Other' is taken into account.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" ".."
                   "0x8000.."))
                 (:VALUES
                  ("Other" "IPV4 Address" "FQDN" "User FQDN"
                   "IPV4 Subnet Address" "IPV6 Address" "IPV6 Subnet Address"
                   "IPV4 Address Range" "IPV6 Address Range" "DER ASN1 DN"
                   "DER ASN1 GN" "KEY ID" "DMTF Reserved" "Vendor Reserved"))
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IKEIdentity.IdentityType"
                   "RFC2407.IETF|Section 4.6.2.1"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IPNetworkIdentity.IdentityValue")))
                :INITFORM NIL)
               (IDENTITYVALUE STRING :CIM-NAME "IdentityValue" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "IdentityValue contains a string encoding of the Identity. For Identity instances that are address types, the IdentityValue string value may be omitted and the associated IPProtocolEndpoint, RangeOfIPAddresses or similar class is used to define this information. The class is associated using the AssignedIdentity relationship.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IKEIdentity.IdentityValue"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IPNetworkIdentity.IdentityType")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority. (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (CURRENTLYAUTHENTICATED BOOLEAN :CIM-NAME
                "CurrentlyAuthenticated" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether this Identity has been authenticated, and is currently known within the scope of an AuthenticationService or authority. By default, authenticity SHOULD NOT be assumed. This property is set and cleared by the security infrastructure, and should only be readable within the management infrastructure. Note that its value, alone, may not be sufficient to determine authentication/ authorization, in that properties of an Identity subclass (such as a security token or computer hardware port/ communication details) may be required by the security infrastructure."))
                :INITFORM "false")
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
              (:CIM-NAME "CIM_IPNetworkIdentity")
              (:QUALIFIERS (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::Identity")
               (:DESCRIPTION
                "IPNetworkIdentity is used to represent the various network identities that may be used for an IPProtocolEndpoint. The relationship between the NetworkIdentity and the IPProtocolEndpoint is modeled by the AssignedIdentity association, inherited from CIM_Identity. This association could also be used to relate an address range or other endpoint collection with the Identity.")
               (:MAPPING-STRINGS ("IPSP Policy Model.IETF|IKEIdentity"))))