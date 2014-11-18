
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicySet.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYSET (CIM_POLICY)
              ((POLICYDECISIONSTRATEGY UINT16 :CIM-NAME
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
              (:CIM-NAME "CIM_PolicySet")
              (:QUALIFIERS :ABSTRACT (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "PolicySet is an abstract class that represents a set of policies that form a coherent set. The set of contained policies has a common decision strategy and a common set of policy roles (defined via the PolicySetInRole Collection association). Subclasses include PolicyGroup and PolicyRule.")))