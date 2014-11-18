
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IKERule.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_IKERULE (CIM_SARULE)
              ((LIMITNEGOTIATION UINT16 :CIM-NAME "LimitNegotiation"
                :QUALIFIERS
                ((:DESCRIPTION
                  "LimitNegotiation is used as part of processing either a key exchange or IPsec Rule. Before proceeding with either a phase 1 or a phase 2 negotiation, this property is checked to determine if the negotiation role of the Rule matches that defined for the negotiation being undertaken (e.g., Initiator, Responder, or Both). If this check fails, then the negotiation is stopped. Note that this only applies to new negotiations and has no effect on either renegotiation or refresh operations with peers for which an established Security Association already exists.")
                 (:VALUE-MAP ("1" "2" "3"))
                 (:VALUES ("Initiator-Only" "Responder-Only" "Either"))
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|SARule.LimitNegotiation")))
                :INITFORM NIL)
               (SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping System's CreationClassName.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_System.CreationClassName"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping System's Name.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_System.Name"))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (POLICYRULENAME STRING :CIM-NAME "PolicyRuleName" :QUALIFIERS
                (:KEY (:DESCRIPTION "A user-friendly name of this PolicyRule.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (CONDITIONLISTTYPE UINT16 :CIM-NAME "ConditionListType"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates whether the list of PolicyConditions associated with this PolicyRule is in disjunctive normal form (DNF), conjunctive normal form (CNF), or has no conditions (i.e., is an UnconditionalRule) and is automatically evaluated to \"True.\" The default value is 1 (\"DNF\").")
                 (:VALUE-MAP ("0" "1" "2"))
                 (:VALUES ("Unconditional Rule" "DNF" "CNF")))
                :INITFORM "1")
               (RULEUSAGE STRING :CIM-NAME "RuleUsage" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string that can be used to provide guidelines on how this PolicyRule should be used."))
                :INITFORM NIL)
               (PRIORITY UINT16 :CIM-NAME "Priority" :QUALIFIERS
                ((:DEPRECATED ("CIM_PolicySetComponent.Priority"))
                 (:DESCRIPTION
                  "PolicyRule.Priority is deprecated and replaced by providing the priority for a rule (and a group) in the context of the aggregating PolicySet instead of the priority being used for all aggregating PolicySet instances. Thus, the assignment of priority values is much simpler. 

A non-negative integer for prioritizing this Policy Rule relative to other Rules. A larger value indicates a higher priority. The default value is 0."))
                :INITFORM "0")
               (MANDATORY BOOLEAN :CIM-NAME "Mandatory" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "A flag indicating that the evaluation of the Policy Conditions and execution of PolicyActions (if the Conditions evaluate to TRUE) is required. The evaluation of a PolicyRule MUST be attempted if the Mandatory property value is TRUE. If the Mandatory property is FALSE, then the evaluation of the Rule is 'best effort' and MAY be ignored."))
                :INITFORM NIL)
               (SEQUENCEDACTIONS UINT16 :CIM-NAME "SequencedActions"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property gives a policy administrator a way of specifying how the ordering of the PolicyActions associated with this PolicyRule is to be interpreted. Three values are supported: 
o mandatory(1): Do the actions in the indicated order, or don't do them at all. 
o recommended(2): Do the actions in the indicated order if you can, but if you can't do them in this order, do them in another order if you can. 
o dontCare(3): Do them -- I don't care about the order. 
The default value is 3 (\"DontCare\").")
                 (:VALUE-MAP ("1" "2" "3"))
                 (:VALUES ("Mandatory" "Recommended" "Dont Care")))
                :INITFORM "3")
               (EXECUTIONSTRATEGY UINT16 :CIM-NAME "ExecutionStrategy"
                :QUALIFIERS
                ((:DESCRIPTION
                  "ExecutionStrategy defines the strategy to be used in executing the sequenced actions aggregated by this PolicyRule. There are three execution strategies: 

Do Until Success - execute actions according to predefined order, until successful execution of a single action. 
Do All - execute ALL actions which are part of the modeled set, according to their predefined order. Continue doing this, even if one or more of the actions fails. 
Do Until Failure - execute actions according to predefined order, until the first failure in execution of an action instance.")
                 (:VALUE-MAP ("1" "2" "3"))
                 (:VALUES ("Do Until Success" "Do All" "Do Until Failure")))
                :INITFORM NIL)
               (POLICYDECISIONSTRATEGY UINT16 :CIM-NAME
                "PolicyDecisionStrategy" :QUALIFIERS
                ((:DESCRIPTION
                  "PolicyDecisionStrategy defines the evaluation method used for policies contained in the PolicySet. There are two values currently defined: 
- 'First Matching' (1) executes the actions of the first rule whose conditions evaluate to TRUE. The concept of 'first' is determined by examining the priority of the rule within the policy set (i.e., by examining the property, PolicySetComponent.Priority). Note that this ordering property MUST be maintained when processing the PolicyDecisionStrategy. 
- 'All' (2) executes the actions of ALL rules whose conditions evaluate to TRUE, in the set. As noted above, the order of processing of the rules is defined by the property, PolicySetComponent.Priority (and within a rule, the ordering of the actions is defined by the property, PolicyActionStructure.ActionOrder). Note that when this strategy is defined, processing MUST be completed of ALL rules whose conditions evaluate to TRUE, regardless of errors in the execution of the rule actions.")
                 (:VALUE-MAP ("1" "2")) (:VALUES ("First Matching" "All")))
                :INITFORM NIL)
               (ENABLED UINT16 :CIM-NAME "Enabled" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates whether this PolicySet is administratively enabled, administratively disabled, or enabled for debug. The \"EnabledForDebug\" property value is deprecated and, when it or any value not understood by the receiver is specified, the receiving enforcement point treats the PolicySet as \"Disabled\". To determine if a PolicySet is \"Enabled\", the containment hierarchy specified by the PolicySetComponent aggregation is examined and the Enabled property values of the hierarchy are ANDed together. Thus, for example, everything aggregated by a PolicyGroup may be disabled by setting the Enabled property in the PolicyGroup instance to \"Disabled\" without changing the Enabled property values of any of the aggregated instances. The default value is 1 (\"Enabled\").")
                 (:VALUE-MAP ("1" "2" "3"))
                 (:VALUES ("Enabled" "Disabled" "Enabled For Debug")))
                :INITFORM "1")
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
               (IDENTITYCONTEXTS (ARRAY STRING) :CIM-NAME "IdentityContexts"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An IP endpoint may have multiple identities for use in different situations. The IdentityContext property specifies the specific context/identities which pertain to this Rule. The property's function is similar to that of PolicyRoles. A context may be a VPN name or other identifier that selects the appropriate identity. 

IdentityContext is an array of strings. The multiple values in the array are logically ORed together in matching an IPNetworkIdentity's IdentityContext. Each value in the array may be a composition of multiple context names. When an array value is a composition, the individual values are logically ANDed together for evaluation purposes. The syntax is: 
<ContextName>[&&<ContextName>]* 
where the individual context names appear in alphabetical order (according to the collating sequence for UCS-2). So, for example, the values 'CompanyXVPN', 'CompanyYVPN&&TopSecret', 'CompanyZVPN&&Confidential' are possible contexts for a Rule. They are matched against an IPNetworkIdentity's IdentityContext. Any of the values may indicate a match and select an Identity, since the values in the array are logically ORed.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|IKERule.IdentityContexts"))
                 (:MODEL-CORRESPONDENCE ("CIM_IdentityContext")))
                :INITFORM NIL)
               (POLICYROLES (ARRAY STRING) :CIM-NAME "PolicyRoles" :QUALIFIERS
                ((:DEPRECATED ("CIM_PolicySetInRoleCollection"))
                 (:DESCRIPTION
                  "The PolicyRoles property represents the roles associated with a PolicySet. All contained PolicySet instances inherit the values of the PolicyRoles of the aggregating PolicySet but the values are not copied. A contained PolicySet instance may, however, add additional PolicyRoles to those it inherits from its aggregating PolicySet(s). Each value in PolicyRoles multi-valued property represents a role for which the PolicySet applies, i.e., the PolicySet should be used by any enforcement point that assumes any of the listed PolicyRoles values. 

Although not officially designated as 'role combinations', multiple roles may be specified using the form: 
<RoleName>[&&<RoleName>]* 
where the individual role names appear in alphabetical order (according to the collating sequence for UCS-2). Implementations may treat PolicyRoles values that are specified as 'role combinations' as simple strings. 

This property is deprecated in lieu of the use of an association, CIM_PolicySetInRoleCollection. The latter is a more explicit and less error-prone approach to modeling that a PolicySet has one or more PolicyRoles."))
                :INITFORM NIL)
               (POLICYKEYWORDS (ARRAY STRING) :CIM-NAME "PolicyKeywords"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An array of keywords for characterizing / categorizing policy objects. Keywords are of one of two types: 
- Keywords defined in this and other MOFs, or in DMTF white papers. These keywords provide a vendor- independent, installation-independent way of characterizing policy objects. 
- Installation-dependent keywords for characterizing policy objects. Examples include 'Engineering', 'Billing', and 'Review in December 2000'. 
This MOF defines the following keywords: 'UNKNOWN', 'CONFIGURATION', 'USAGE', 'SECURITY', 'SERVICE', 'MOTIVATIONAL', 'INSTALLATION', and 'EVENT'. These concepts are self-explanatory and are further discussed in the SLA/Policy White Paper. One additional keyword is defined: 'POLICY'. The role of this keyword is to identify policy-related instances that may not be otherwise identifiable, in some implementations. The keyword 'POLICY' is NOT mutually exclusive of the other keywords specified above."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_IKERule")
              (:QUALIFIERS (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::IPsecPolicy")
               (:DESCRIPTION
                "IKERule contains the Conditions and Actions for IKE phase 1 negotiations or to specify static actions such as Discard.")
               (:MAPPING-STRINGS ("IPSP Policy Model.IETF|IKERule"))))