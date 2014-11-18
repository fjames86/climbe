
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_QueryCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_QUERYCAPABILITIES (CIM_CAPABILITIES)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "The user friendly name for this instance of Capabilities. In addition, the user friendly name can be used as a index property for a search of query. (Note: Name does not have to be unique within a namespace.)"))
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
               (CQLFEATURES (ARRAY UINT16) :CIM-NAME "CQLFeatures" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_GenericOperationCapabilitiesStructure.CQLSupport"))
                 (:DESCRIPTION
                  "Enumeration of CQL features supported by an Object Manager or Provider associated via ElementCapabilities. For more information refer to the CIM Query Language Specification, DSP0202.")
                 (:VALUE-MAP
                  ("2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" ".." "0x8000.."))
                 (:VALUES
                  ("Basic Query" "Simple Join" "Complex Join" "Subquery"
                   "Result Set Operations" "Extended Select List"
                   "Embedded Properties" "Aggregations"
                   "Regular Expression Like" "Array Range" "Satisfies Array"
                   "Foreign Namespace Support" "Arithmetic Expression"
                   "Full Unicode Support" "Conversion Utilities"
                   "Property Scoping" "Association Traversal" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_IndicationFilter.Query")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_QueryCapabilities")
              (:QUALIFIERS
               (:DEPRECATED ("CIM_GenericOperationCapabilitiesStructure"))
               (:VERSION "2.39.0") (:UML-PACKAGE-PATH "CIM::Interop")
               (:DESCRIPTION
                "CIM_QueryCapabilities is deprecated. See CIM_GenericOperationCapabilitiesStructure.
This class defines the extent of the support of a query language. Query languages may be used in support of the query operation, as defined in the OpenQueryInstances CIM Operation from DSP0223, or in the filtering of indications. 
An instance of this class associated to the CIM_ObjectManager instance denotes that the WBEM Infrastructure itself supports the query operation. An instance of this class associated to a CIM_Provider instance denotes that the provider has less or more capabilities than the Object Manager for processing queries. If the provider has different support for query languages than the object manager then, instances of this class shall be associated to both the object manager and the provider.
An instance of this class associated to the CIM_IndicationService denotes what query languages can be used to formulate an indication filter. 
The possible query languages are CQL and XPath, as denoted by the CQLFeatures and XPathFeatures respectively. A value of null in one of these properties indicates that the related query language is not supported.")))