
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MethodAction.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_METHODACTION (CIM_POLICYACTION)
              ((INSTMETHODCALLNAME STRING :CIM-NAME "InstMethodCallName"
                :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "In the context of the associated PolicyRule, InstMethodCallName defines a unique name for the InstMethodCall instances that result from the methods invoked as a result of evaluating the Query string. This name MAY be used in subsequent MethodActions of the same PolicyRule to identify the set of InstMethodCall instances that result from evaluation of this MethodAction in the context of its PolicyRule. This string is treated as a class name, in a query statement.")
                 (:MODEL-CORRESPONDENCE ("CIM_MethodAction.Query")))
                :INITFORM NIL)
               (QUERY STRING :CIM-NAME "Query" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "A query expression that defines the method to invoke and its input parameters. These are defined by the first and subsequent select-list entries in the Query string's select-criteria. The FROM clause MAY reference any object, including those named by the QueryResultName and MethodCallName produced by QueryConditions or MethodActions of the same PolicyRule. 
Note that both intrinsic and extrinsic methods MAY be called. The first select-list entry MUST be an object Path to a method. For consistency it SHOULD be called MethodName. However, if there is a conflict with existing parameter names, it MAY be called something else. The remaining select list entries are not positional and MUST use the name of the corresponding method parameter. 
The object path to a method is defined here as a WBEM URI, (see DSP0207) dot concatenated with a method name. It must have the form: [<wbemURI>, \".\",] <MethodName>. 
The named method may be intrinsic or extrinsic. Extrinsics may be at class level (i.e. static) or not. 
The particular instance of this class that is invoking the specified method defines the default namespace, class, and key values. If any of these are missing from the WBEM URI, these defaults are assumed. 
For intrinsic methods (as defined in the \"Specification for CIM Operations over HTTP\", see DSP0200), any class name or key values specified in the WBEM URI are ignored. Similarly, key values are ignored for static methods. 
Intrinsic methods that take an <instancename>, an <objectname>, an <instance>, or a <namedinstance> (as defined in DSP0200) as an input parameter are preprocessed by the implementation of the MethodAction instance. For each of <instancename> or <objectname>, the corresponding input parameter name is set to a WBEM URI of the instance or class. /n For each of <instance> or <namedinstance>, the corresponding input parameter must be set to a WBEM URI to the instance or class. Properties of that instance are passed as additional select list entries with the name of the corresponding parameter dot appended with the name of the named instance property. 
For example: if the call is to ModifyInstance, then parameter ModifiedInstance is set to the= <wbemURI> of the instance to modify and for each relevant property to modify, a parameter is supplied with the name ModifiedInstance.<propertyName> and is set to the new value for the named property.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_MethodAction.InstMethodCallName"
                   "CIM_MethodAction.QueryLanguage")))
                :INITFORM NIL)
               (QUERYLANGUAGE UINT16 :CIM-NAME "QueryLanguage" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The language in which the Query string is expressed./n CQL - refers to the 'DMTF:CQL' language defined by DSP0200. 
CQL: indicates a CIM Query Language string. 
CQLT: indicates a CIM Query Language Template string. When used, the identifiers recognized in the $identifier$ tokens are \"SELF\" and the property names of this class, or one of its subclasses. When used in the Query string, $SELF$ will be replaced by a string corresponding to a WBEM URI referencing the instance of this class that contains the Query template string. Tokens of the form $<propertyname>$ will be replaced by a string representing the corresponding property value of the instance of this class that contains the Query string.")
                 (:VALUE-MAP ("2" "3" ".." "0x8000.."))
                 (:VALUES ("CQL" "CQLT" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_MethodAction.Query")))
                :INITFORM "2")
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
              (:CIM-NAME "CIM_MethodAction")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "MethodAction is a PolicyAction that MAY invoke methods as defined by a query. If there are no results returned from the query, then no methods are called, otherwise each query result row defines the method to call and its parameters. The called method MAY be either an intrinsic method of a CIM Namespace or an extrinsic method of a CIM_ManagedElement. 

In order to correlate between methods called by this MethodAction and any other invoked Methods, InstMethodCall indications MAY be created for the method calls that result from this MethodAction. These indications are named by the value in the InstMethodCallName property. These indications MUST be produced if that InstMethodCallName value is included in the FROM clause of the query of some other MethodAction instance within the same PolicyRule. (The details of how this is accomplished are implementation dependent.) 

The input parameters to the method are defined by the query and MAY be fixed values defined by literals or MAY be defined by reference to one or more properties of classes named in the FROM clause of the query. The referenced objects MAY be those produced by QueryConditions or MethodActions instances associated to the same PolicyRule instance.")))