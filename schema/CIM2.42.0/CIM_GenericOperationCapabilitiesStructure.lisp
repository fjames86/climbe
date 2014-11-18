
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_GenericOperationCapabilitiesStructure.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_GENERICOPERATIONCAPABILITIESSTRUCTURE NIL
              ((FQLSUPPORTED BOOLEAN :CIM-NAME "FQLSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "Is FQL (Filter Query Language, DSP0212) supported?"))
                :INITFORM NIL)
               (CONTINUEONERRORSUPPORTED BOOLEAN :CIM-NAME
                "ContinueOnErrorSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "Is ContinueOnError supported as defined in Generic Operations (DSP0223)?"))
                :INITFORM NIL)
               (MINIMUMOPERATIONTIMEOUT UINT32 :CIM-NAME
                "MinimumOperationTimeout" :QUALIFIERS
                ((:DESCRIPTION
                  "OperationTimeout is defined in Generic Operations (DSP0223). It is used to determine when the WBEM Server can close an enumeration session. MinimumOperationTimeout is the minimum number of seconds allowed for the OperationTimeout parameter.")
                 (:P-UNIT "second"))
                :INITFORM NIL)
               (MAXIMUMOPERATIONTIMEOUT UINT32 :CIM-NAME
                "MaximumOperationTimeout" :QUALIFIERS
                ((:DESCRIPTION
                  "OperationTimeout is defined in Generic Operations (DSP0223). It is used to determine when the WBEM Server can close an enumeration session. MaximumOperationTimeout is the maximum number of seconds allowed for the OperationTimeout parameter. If the value is 0, then there is no operation timeout. That is, the enumeration session is never closed based on time.")
                 (:P-UNIT "second"))
                :INITFORM NIL)
               (CQLSUPPORT (ARRAY UINT32) :CIM-NAME "CQLSupport" :QUALIFIERS
                ((:DESCRIPTION
                  "CQLSupport describes the levels of CQL Supported. If Not Supported the array shall have a single entry of 0 (Not Supported). For more information refer to the CIM Query Language Specification, DSP0202.")
                 (:VALUE-MAP
                  ("0" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" ".."))
                 (:VALUES
                  ("Not Supported" "Basic Query" "Simple Join" "Complex Join"
                   "Subquery" "Result Set Operations" "Extended Select List"
                   "Embedded Properties" "Aggregations"
                   "Regular Expression Like" "Array Range" "Satisfies Array"
                   "Foreign Namespace Support" "Arithmetic Expression"
                   "Full Unicode Support" "Conversion Utilities"
                   "Property Scoping" "Association Traversal"
                   "DMTF Reserved")))
                :INITFORM NIL)
               (OPERATIONSSUPPORTED (ARRAY UINT32) :CIM-NAME
                "OperationsSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "The list of Generic Operations supported. Generic Operations are defined in DSP0223.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26"
                   "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38"
                   "39" "40" ".."))
                 (:VALUES
                  ("Other" "GetInstance" "DeleteInstance" "ModifyInstance"
                   "CreateInstance" "EnumerateInstances"
                   "EnumerateInstanceNames" "Associators" "AssociatorNames"
                   "References" "ReferenceNames" "OpenEnumerateInstances"
                   "OpenEnumerateInstancePaths" "OpenAssociators"
                   "OpenAssociatorPaths" "OpenReferences" "OpenReferencePaths"
                   "OpenQueryInstances" "PullInstancesWithPath"
                   "PullInstancePaths" "PullInstances" "CloseEnumeration"
                   "EnumerationCount" "InvokeMethod" "InvokeStaticMethod"
                   "GetClass" "DeleteClass" "ModifyClass" "CreateClass"
                   "EnumerateClasses" "EnumerateClassNames" "AssociatorClasses"
                   "AssociatorClassPaths" "ReferenceClasses"
                   "ReferenceClassPaths" "GetQualifierType"
                   "DeleteQualifierType" "ModifyQualifierType"
                   "CreateQualifierType" "EnumerateQualifierTypes"
                   "DMTF Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_GenericOperationCapabilitiesStructure.OtherOperationsSupportedDescriptions")))
                :INITFORM NIL)
               (OTHEROPERATIONSSUPPORTEDDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherOperationsSupportedDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "If OperationsSupported has the value 1 (Other), then the corresponding element in this array shall have the name of the operation.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_GenericOperationCapabilitiesStructure.OperationsSupported")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_GenericOperationCapabilitiesStructure")
              (:QUALIFIERS :INDICATION (:VERSION "2.38.0")
               (:UML-PACKAGE-PATH "CIM::Interop::Operations")
               (:DESCRIPTION
                "CIM_GenericOperationCapabilitiesStructure defines a structure of the generic operations capabilities supported by a WBEM implementation (e.g. WBEM Server, WBEM Protocol, WBEM Provider, ...). One use of this strucutre would be to add to a capabilities class and associate via CIM_ElementCapabilities. For more information, see Generic Operations (DSP0223).")
               :STRUCTURE))