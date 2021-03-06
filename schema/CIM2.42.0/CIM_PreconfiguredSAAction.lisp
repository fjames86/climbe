
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PreconfiguredSAAction.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRECONFIGUREDSAACTION (CIM_SASTATICACTION)
              ((LIFETIMEKILOBYTES UINT64 :CIM-NAME "LifetimeKilobytes"
                :QUALIFIERS
                ((:DESCRIPTION
                  "LifetimeKilobytes defines a traffic limit in kilobytes that can be consumed before the SA is deleted. A value of zero (the default) indicates that there is no lifetime associated with this action (i.e., infinite lifetime). A non-zero value is used to indicate that after this number of kilobytes has been consumed the SA must be deleted. 

Note that the actual lifetime of the preconfigured SA will be the lesser of the value of this LifetimeKilobytes property and the value of the MaxLifetimeKilobytes property of the associated SATransform. Also note that some SA negotiation protocols (such as IKE) can negotiate the lifetime as an arbitrary length field, it is assumed that a 64-bit integer will be sufficient.")
                 (NIL "KiloBytes")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|PreconfiguredSAAction.LifetimeKilobytes"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SecurityAssociationEndpoint.LifetimeKilobytes"))
                 (:P-UNIT "byte * 10^3"))
                :INITFORM NIL)
               (LIFETIMESECONDS UINT64 :CIM-NAME "LifetimeSeconds" :QUALIFIERS
                ((:DESCRIPTION
                  "LifetimeSeconds specifies how long the SA created from this action should be used/exist. A value of 0 means an infinite lifetime. A non-zero value is typically used in conjunction with alternate SAActions performed when there is a negotiation failure of some sort. 

Note: If the referenced SAStaticAction object IS-A PreconfiguredSAAction (that is associated to several SATransforms), then the actual lifetime of the Security Association will be the lesser of the value of this LifetimeSeconds property and of the value of the MaxLifetimeSeconds property of the associated SATransform.")
                 (NIL "Seconds")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|SAStaticAction.LifetimeSeconds"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SecurityAssociationEndpoint.LifetimeSeconds"))
                 (:P-UNIT "second"))
                :INITFORM NIL)
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
              (:CIM-NAME "CIM_PreconfiguredSAAction")
              (:QUALIFIERS (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::IPsecPolicy")
               (:DESCRIPTION
                "Subclasses of PreconfiguredSAAction are used to create SAs using preconfigured, hard-wired algorithms and keys. No negotiation is necessary. Note that this class is defined as concrete, since its superclass is also concrete. However, it should not be directly instantiated, but one of its subclasses used instead. 

Also note that: 
- The SPI for a preconfigured SA action is contained in the association, TransformOfPreconfiguredAction. 
- The session key (if applicable) is contained in an instance of SharedSecret. For an instance of the SharedSecret class: The session key is stored in the Secret property; the property protocol contains one of the values, \"ESP-encrypt\", \"ESP-auth\" or \"AH\"; and, the class' property algorithm contains the algorithm used to protect the secret. (The latter can be \"PLAINTEXT\" if the IPsec entity has no secret storage.) The value of the class' RemoteID property is the concatenation of the remote IPsec peer IP address in dotted decimal, of the character \"/\", of \"IN\" (or respectively \"OUT\") for inbound/outbound SAs, of the character \"/\" and of the hexadecimal representation of the SPI.")
               (:MAPPING-STRINGS
                ("IPSP Policy Model.IETF|PreconfiguredSAAction"))))