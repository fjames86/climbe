
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IndicationFilter.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_INDICATIONFILTER (CIM_MANAGEDELEMENT)
              ((SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "A System's CreationClassName. The Filter is defined in the context of a CIM_System, where it is hosted or to which it applies. In a future release, a weak relationship will be explicitly added to the model. This is not done now to allow further refinement of the Filter definition and its inheritance tree. Keys are defined now to allow the class to be instantiated.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "A System's Name. The Filter is defined in the context of a CIM_System, where it is hosted or to which it applies. In a future release, a weak relationship will be explicitly added to the model. This is not done now to allow further refinement of the Filter definition and its inheritance tree. Keys are defined now to allow the class to be instantiated.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "Indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, it allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:KEY (:DESCRIPTION "The name of the filter.")) :INITFORM NIL)
               (SOURCENAMESPACE STRING :CIM-NAME "SourceNamespace" :QUALIFIERS
                ((:DEPRECATED ("CIM_IndicationFilter.SourceNamespaces"))
                 (:DESCRIPTION
                  "The path to a local namespace where the Indications originate. If NULL, the namespace of the Filter registration is assumed."))
                :INITFORM NIL)
               (INDIVIDUALSUBSCRIPTIONSUPPORTED BOOLEAN :CIM-NAME
                "IndividualSubscriptionSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "If IndividualSubscriptionSupported is true, the implementation shall support direct subscription to this IndicationFilter. If IndividualSubscriptionSupported is false, the implementation shall not support direct subscription to this IndicationFilter."))
                :INITFORM "true")
               (QUERY STRING :CIM-NAME "Query" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "A query expression that defines the condition(s) under which instances of CIM_Indication will be generated. For CIM_InstIndication subclasses of CIM_Indication classes, the query expression may also define the instance properties to be copied to the CIM_InstIndication's SourceInstance and PreviousInstance properties. Query language semantics include projection (e.g., Select), range (e.g., From) and predicate (e.g., Where). 
When used with QueryLanguage set to \"DMTF:CQL\" or \"DMTF:CQLT\", the FROM clause shall contain at least one subclass of CIM_Indication and may contain any number of other classes or subqueries. If only one subclass of CIM_Indication is named, it defines the CIM_Indication that this Instance of CIM_IndicationFilter will produce. If more than one subclass of CIM_Indication is named, then one of them must be named explicitly in the select-list. 
The select-list must refer explicitly or implicitly to exactly one CIM_Indication subclass. In addition, it shall conform to one of several options: 
1) only a \"*\": This may only be used if the Indication subclass is the only entry on the FROM list. 
2) only a \"<Indicationclass or alias>.*\": This form may be used if the FROM clause contains more than one Indication subclass. 
3) a list of the form \"<propertyname>*[\",\"[<literal> AS ]<propertyname>]\": This form may only be used if the CIM_Indication subclass is the only entry on the FROM list. In this form, the literal is assigned to the named property of the selected CIM_Indication subclass 
4) a list of the form \"<Indicationname>.<propertyname> *[\",\" [<Indicationname>.<propertyname> |\"\": <literal> AS <propertyname> | <fromname>.<propertyname> AS <propertyname> ] ]\" : The first term selects the appropriate CIM_Indication subclass to produce. Subsequent terms allow other properties of that indication, or allow a literal or property of another class to be assigned to the output as one of the properties of the selected CIM_Indication subclass. 
Note that in all cases, only the property names of the selected CIM_Indication subclass may be referred to in the select-list.
When used with \"DMTF:CQLT\", the additional string array property TemplateVariable should be used to provide additional filtering information to the query.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IndicationFilter.QueryLanguage"
                   "CIM_IndicationFilter.TemplateVariable")))
                :INITFORM NIL)
               (QUERYLANGUAGE STRING :CIM-NAME "QueryLanguage" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION "The language in which the query is expressed. . 
\"DMTF:CQL\" indicates a CIM Query Language string. 
\"DMTF:CQLT\" indicates a CIM Query Language Template string. When used, the identifiers recognized in the $identifier$ tokens are \"SELF\" and the property names of this class, or one of its subclasses. As seen by a CIM client, the value of the Query property is not changed as a result of template processing. Template processing conceptually produces a new query string, which defines the actual conditions that will trigger production of a CIM_Indication instance. When used in the Query string, $SELF$ will be replaced by a string corresponding to a WBEM URI referencing the instance of this class that contains the Query template string. Tokens of the form $<propertyname>$ will be replaced by a string representing the corresponding property value of the instance of this class that contains the Query string. The Query string must be evaluated when the CIM_IndicationFilter is created and at any time when one any modification of any property referenced by tokens in the Query string are modified.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IndicationFilter.Query"
                   "CIM_IndicationFilter.TemplateVariable")))
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
               (SOURCENAMESPACES (ARRAY STRING) :CIM-NAME "SourceNamespaces"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The names of the local namespaces where the Indications originate. If NULL, the namespace of the Filter registration is assumed. SourceNamespaces replaces the SourceNamespace property on IndicationFilter to provide a means of defining the multiple namespaces where indications may originate.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE ("CIM_Namespace.Name")))
                :INITFORM NIL)
               (TEMPLATEVARIABLE (ARRAY STRING) :CIM-NAME "TemplateVariable"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property may be used to hold application specific filtering information for use within a \"DMTF:CQLT\" formatted query.

For example, each TemplateVariable entry might be filled with the WBEM URI formatted object path of a CIM_ManagedElement, as in the following example, which selects only indications against namedCIM_StorageSynchonized instances. It then uses SELF to select the executing IndicationFilter, and then uses the entries of the TemplateVariable array to select particular instances of CIM_StorageSynchronized.

SELECT I.* 
FROM CIM_InstIndication I, CIM_IndicationFilter F 
WHERE I.SourceInstance ISA CIM_StorageSynchronized 
	AND ObjectPath(F) = ObjectPath($SELF$)
	AND ANY x IN F.TemplateVariable[*]
		SATISFIES (ObjectPath(I.SourceInstanceModelPath) = ObjectPath(x)).")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_IndicationFilter.QueryLanguage"
                   "CIM_IndicationFilter.Query")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_IndicationFilter")
              (:QUALIFIERS (:VERSION "2.31.1") (:UML-PACKAGE-PATH "CIM::Event")
               (:DESCRIPTION
                "CIM_IndicationFilter defines the criteria for generating an instance of CIM_Indication and what data should be returned in that instance. It is derived from CIM_ManagedElement to allow modeling the dependency of the filter on a specific service.
If used with the \"DMTF:CQLT\" language, the processing and CQLT tokens that must be supported are described in the description of the QueryLanguage property")))