
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IPsecTransportAction.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_IPSECTRANSPORTACTION (CIM_IPSECACTION)
              ((USEPFS BOOLEAN :CIM-NAME "UsePFS" :QUALIFIERS
                ((:DESCRIPTION
                  "UsePFS indicates whether perfect forward secrecy is required when refreshing keys.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IPsecAction.UsePFS"))
                 (:MODEL-CORRESPONDENCE ("CIM_IPsecSAEndpoint.PFSInUse")))
                :INITFORM NIL)
               (USEPHASE1GROUP BOOLEAN :CIM-NAME "UsePhase1Group" :QUALIFIERS
                ((:DESCRIPTION
                  "UsePhase1Group indicates that the phase 2 GroupId should be the same as that used in the phase 1 key exchange. If UsePFS is False, then this property is ignored. Note that a value of False indicates that the property GroupId will contain the key exchange group to use for phase 2.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IPsecAction.UseIKEGroup")))
                :INITFORM NIL)
               (GROUPID UINT16 :CIM-NAME "GroupId" :QUALIFIERS
                ((:DESCRIPTION
                  "GroupId specifies the PFS group ID to use. This value is only used if PFS is True and UsePhase1Group is False. If the GroupID number is from the vendor-specific range (32768-65535), the VendorID qualifies the group number. Well-known group identifiers from RFC2412, Appendix E, are: Group 1='768 bit prime', Group 2='1024 bit prime', Group 3='Elliptic Curve Group with 155 bit field element', Group 4='Large Elliptic Curve Group with 185 bit field element', and Group 5='1536 bit prime'.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" ".." "0x8000.."))
                 (:VALUES
                  ("No Group/Non-Diffie-Hellman Exchange" "DH-768 bit prime"
                   "DH-1024 bit prime" "EC2N-155 bit field element"
                   "EC2N-185 bit field element" "DH-1536 bit prime"
                   "Standard Group - Reserved" "Vendor Reserved"))
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IPsecAction.GroupID"
                   "RFC2412.IETF|Appendix E"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IPsecAction.VendorID" "CIM_IKESAEndpoint.GroupID")))
                :INITFORM NIL)
               (VENDORID STRING :CIM-NAME "VendorID" :QUALIFIERS
                ((:DESCRIPTION
                  "The property VendorID is used together with the property GroupID (when it is in the vendor-specific range) to identify the key exchange group. VendorID is ignored unless UsePFS is true, AND UsePhase1Group is False, AND GroupID is in the vendor-specific range (32768-65535).")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IPsecAction.VendorID"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IPsecAction.GroupId" "CIM_IKESAEndpoint.VendorID")))
                :INITFORM NIL)
               (GRANULARITY UINT16 :CIM-NAME "Granularity" :QUALIFIERS
                ((:DESCRIPTION
                  "The property Granularity is an enumeration that specifies how the selector for the SA should be derived from the traffic that triggered the negotiation. Its values are: 
1=Other; See the OtherGranularity property for more information 
2=Subnet; The source and destination subnet masks are used 
3=Address; The source and destination IP addresses of the triggering packet are used 
4=Protocol; The source and destination IP addresses and the IP protocol of the triggering packet are used 
5=Port; The source and destination IP addresses, IP protocol and the source and destination layer 4 ports of the triggering packet are used.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5"))
                 (:VALUES ("Other" "Subnet" "Address" "Protocol" "Port"))
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IPsecAction.Granularity"))
                 (:MODEL-CORRESPONDENCE ("CIM_IPsecAction.OtherGranularity")))
                :INITFORM NIL)
               (OTHERGRANULARITY STRING :CIM-NAME "OtherGranularity"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Description of the granularity when the value 1 (\"Other\") is specified for the property, Granularity.")
                 (:MODEL-CORRESPONDENCE ("CIM_IPsecAction.Granularity")))
                :INITFORM NIL)
               (MINLIFETIMESECONDS UINT64 :CIM-NAME "MinLifetimeSeconds"
                :QUALIFIERS
                ((:DESCRIPTION
                  "MinLifetimeSeconds prevents certain denial of service attacks where the peer requests an arbitrarily low lifetime value, causing renegotiations with expensive Diffie-Hellman operations. The property specifies the minimum lifetime, in seconds, that will be accepted from the peer. A value of zero (the default) indicates that there is no minimum value. A non-zero value specifies the minimum seconds lifetime.")
                 (NIL "Seconds")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IKENegotiationAction.MinLifetimeSeconds"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SecurityAssociationEndpoint.LifetimeSeconds"))
                 (:P-UNIT "second"))
                :INITFORM "0")
               (IDLEDURATIONSECONDS UINT64 :CIM-NAME "IdleDurationSeconds"
                :QUALIFIERS
                ((:DESCRIPTION
                  "IdleDurationSeconds is the time an SA can remain idle (i.e., no traffic protected using the security association) before it is automatically deleted. The default (zero) value indicates that there is no idle duration timer and that the SA is deleted based upon the SA seconds and kilobyte lifetimes. Any non-zero value indicates the number of seconds that the SA may remain unused.")
                 (NIL "Seconds")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IKENegotiationAction.IdleDurationSeconds"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SecurityAssociationEndpoint.IdleDurationSeconds"))
                 (:P-UNIT "second"))
                :INITFORM "0")
               (MINLIFETIMEKILOBYTES UINT64 :CIM-NAME "MinLifetimeKilobytes"
                :QUALIFIERS
                ((:DESCRIPTION
                  "MinLifetimeKilobytes prevents certain denial of service attacks where the peer requests an arbitrarily low lifetime value, causing renegotiations with expensive Diffie-Hellman operations. The property specifies the minimum lifetime, in kilobytes, that will be accepted from the peer. A value of zero (the default) indicates that there is no minimum value. A non-zero value specifies the minimum kilobytes lifetime. Note that there has been considerable debate regarding the usefulness of applying kilobyte lifetimes to phase 1 security associations, so it is likely that this property will only apply to the subclass, IPsecAction.")
                 (NIL "KiloBytes")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IKENegotiationAction.MinLifetimeKilobytes"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SecurityAssociationEndpoint.LifetimeKilobytes"))
                 (:P-UNIT "byte * 10^3"))
                :INITFORM "0")
               (DOPACKETLOGGING BOOLEAN :CIM-NAME "DoPacketLogging" :QUALIFIERS
                ((:DESCRIPTION
                  "DoPacketLogging causes a log message to be generated when the action is applied to a packet.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|SAAction.DoPacketLogging"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SecurityAssociationEndpoint.PacketLoggingActive")))
                :INITFORM NIL)
               (SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The name of the class or the subclass used in the creation of the System object in whose scope this PolicyAction is defined. 

This property helps to identify the System object in whose scope this instance of PolicyAction exists. For a rule-specific PolicyAction, this is the System in whose context the PolicyRule is defined. For a reusable PolicyAction, this is the instance of PolicyRepository (which is a subclass of System) that holds the Action. 

Note that this property, and the analogous property SystemName, do not represent propagated keys from an instance of the class System. Instead, they are properties defined in the context of this class, which repeat the values from the instance of System to which this PolicyAction is related, either directly via the PolicyActionInPolicyRepository association or indirectly via the PolicyActionInPolicyRule aggregation.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The name of the System object in whose scope this PolicyAction is defined. 

This property completes the identification of the System object in whose scope this instance of PolicyAction exists. For a rule-specific PolicyAction, this is the System in whose context the PolicyRule is defined. For a reusable PolicyAction, this is the instance of PolicyRepository (which is a subclass of System) that holds the Action.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (POLICYRULECREATIONCLASSNAME STRING :CIM-NAME
                "PolicyRuleCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "For a rule-specific PolicyAction, the CreationClassName of the PolicyRule object with which this Action is associated. For a reusable PolicyAction, a special value, 'NO RULE', should be used to indicate that this Action is reusable and not associated with a single PolicyRule.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (POLICYRULENAME STRING :CIM-NAME "PolicyRuleName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "For a rule-specific PolicyAction, the name of the PolicyRule object with which this Action is associated. For a reusable PolicyAction, a special value, 'NO RULE', should be used to indicate that this Action is reusable and not associated with a single PolicyRule.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (POLICYACTIONNAME STRING :CIM-NAME "PolicyActionName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "A user-friendly name of this PolicyAction.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (DOACTIONLOGGING BOOLEAN :CIM-NAME "DoActionLogging" :QUALIFIERS
                ((:DESCRIPTION
                  "DoActionLogging causes a log message to be generated when the action is performed."))
                :INITFORM NIL)
               (COMMONNAME STRING :CIM-NAME "CommonName" :QUALIFIERS
                ((:DESCRIPTION
                  "A user-friendly name of this policy-related object."))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                ((:DESCRIPTION
                  "InstanceID is an optional property that may be used to opaquely and uniquely identify an instance of this class within the scope of the instantiating Namespace. Various subclasses of this class may override this property to make it required, or a key. Such subclasses may also modify the preferred algorithms for ensuring uniqueness that are defined below.
To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> must include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> must not contain a colon (:). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements. If not null and the above \"preferred\" algorithm is not used, the defining entity must assure that the resulting InstanceID is not reused across any InstanceIDs produced by this or other providers for the NameSpace of this instance. 
If not set to null for DMTF-defined instances, the \"preferred\" algorithm must be used with the <OrgID> set to CIM."))
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
               (POLICYKEYWORDS (ARRAY STRING) :CIM-NAME "PolicyKeywords"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An array of keywords for characterizing / categorizing policy objects. Keywords are of one of two types: 
- Keywords defined in this and other MOFs, or in DMTF white papers. These keywords provide a vendor- independent, installation-independent way of characterizing policy objects. 
- Installation-dependent keywords for characterizing policy objects. Examples include 'Engineering', 'Billing', and 'Review in December 2000'. 
This MOF defines the following keywords: 'UNKNOWN', 'CONFIGURATION', 'USAGE', 'SECURITY', 'SERVICE', 'MOTIVATIONAL', 'INSTALLATION', and 'EVENT'. These concepts are self-explanatory and are further discussed in the SLA/Policy White Paper. One additional keyword is defined: 'POLICY'. The role of this keyword is to identify policy-related instances that may not be otherwise identifiable, in some implementations. The keyword 'POLICY' is NOT mutually exclusive of the other keywords specified above."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_IPsecTransportAction")
              (:QUALIFIERS (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::IPsecPolicy")
               (:DESCRIPTION
                "IPsecTransportAction is used to specify that a transport-mode SA should be negotiated.")
               (:MAPPING-STRINGS
                ("IPSP Policy Model.IETF|IPsecTransportAction"))))