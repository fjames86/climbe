
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_QueryCondition.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_QUERYCONDITION (CIM_POLICYCONDITION)
              ((QUERYRESULTNAME STRING :CIM-NAME "QueryResultName" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "In the context of the associated PolicyRule, QueryResultName defines a unique alias for the query results that MAY be used in subsequent QueryConditions or MethodActions of the same PolicyRule. This string is treated as a class name, in a query statement.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_QueryCondition.Query" "CIM_MethodAction.Query")))
                :INITFORM NIL)
               (QUERY STRING :CIM-NAME "Query" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "A query expression that MAY be evaluated and that defines the query results that MAY be generated. Note that the query's FROM clause MAY reference any class, including those named by the QueryResultName of other QueryCondition instances associated to the same PolicyRule.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_QueryCondition.QueryLanguage"
                   "CIM_QueryCondition.QueryResultName")))
                :INITFORM NIL)
               (QUERYLANGUAGE UINT16 :CIM-NAME "QueryLanguage" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The language in which the Query string is expressed./n CQL - refers to the 'DMTF:CQL' language defined by DSP0200. 
CQL: indicates a CIM Query Language string. 
CQLT: indicates a CIM Query Language Template string. When used, the identifiers recognized in the $identifier$ tokens are \"SELF\" and the property names of this class, or one of its subclasses. When used in the Query string, $SELF$ will be replaced by a string corresponding to a WBEM URI referencing the instance of this class that contains the Query template string. Tokens of the form $<propertyname>$ will be replaced by a string representing the corresponding property value of the instance of this class that contains the Query string.")
                 (:VALUE-MAP ("2" "3" ".." "0x8000.."))
                 (:VALUES ("CQL" "CQLT" "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_QueryCondition.Query")))
                :INITFORM "2")
               (TRIGGER BOOLEAN :CIM-NAME "Trigger" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "If Trigger = true, and with the exception of any PolicyTimePeriodConditions, PolicyConditions of this Policy are not evaluated until this 'triggering' condition query is true. There MUST be no more than one QueryCondition with Trigger = true associated with a particular Policy."))
                :INITFORM "false")
               (SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The name of the class or the subclass used in the creation of the System object in whose scope this PolicyCondition is defined. 

This property helps to identify the System object in whose scope this instance of PolicyCondition exists. For a rule-specific PolicyCondition, this is the System in whose context the PolicyRule is defined. For a reusable PolicyCondition, this is the instance of PolicyRepository (which is a subclass of System) that holds the Condition. 

Note that this property, and the analogous property SystemName, do not represent propagated keys from an instance of the class System. Instead, they are properties defined in the context of this class, which repeat the values from the instance of System to which this PolicyCondition is related, either directly via the PolicyConditionInPolicyRepository association or indirectly via the PolicyConditionInPolicyRule aggregation.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The name of the System object in whose scope this PolicyCondition is defined. 

This property completes the identification of the System object in whose scope this instance of PolicyCondition exists. For a rule-specific PolicyCondition, this is the System in whose context the PolicyRule is defined. For a reusable PolicyCondition, this is the instance of PolicyRepository (which is a subclass of System) that holds the Condition.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (POLICYRULECREATIONCLASSNAME STRING :CIM-NAME
                "PolicyRuleCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "For a rule-specific PolicyCondition, the CreationClassName of the PolicyRule object with which this Condition is associated. For a reusable Policy Condition, a special value, 'NO RULE', should be used to indicate that this Condition is reusable and not associated with a single PolicyRule.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (POLICYRULENAME STRING :CIM-NAME "PolicyRuleName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "For a rule-specific PolicyCondition, the name of the PolicyRule object with which this Condition is associated. For a reusable PolicyCondition, a special value, 'NO RULE', should be used to indicate that this Condition is reusable and not associated with a single PolicyRule.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (POLICYCONDITIONNAME STRING :CIM-NAME "PolicyConditionName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "A user-friendly name of this PolicyCondition.")
                 (:MAX-LEN "256"))
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
              (:CIM-NAME "CIM_QueryCondition")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "QueryCondition defines the criteria for generating a set of query results that are accessible to other QueryConditions or MethodActions of the same PolicyRule. If there are no results returned from the query, then the Condition evaluates to false; otherwise, true. 

QueryConditions are assumed to be constantly evaluated whenever precursor PolicyConditions are met. Actual implementations may evaluate conditions dynamically, via polling, or via other means. 

QueryCondition instances are viewed as clients of query. The QueryCondition implementation takes the query results and makes them available by the name specified in QueryResultName to the FROM clause in the Query property of other QueryConditions or MethodActions. (The details of how this is accomplished are implementation dependent.) These results are not available via CIM Operations, do not create lifecycle indications, and do not persist beyond a single evaluation of the associated PolicyRule.")))