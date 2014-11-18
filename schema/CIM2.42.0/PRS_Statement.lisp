
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_Statement.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_STATEMENT (PRS_EXPRESSIONELEMENT)
              ((STATEMENTROLE UINT8 :CIM-NAME "StatementRole" :QUALIFIERS
                ((:DESCRIPTION
                  "StatementRole describes how the PRS_Statement relates to the larger context. For example, is the PRS_Statement describing a Fix or a Symptom? 'Description' is generic text without a specific diagnostic application. 'Symptom' describes initial observable incident or behavior that the user reports. 'Error_Message' is a specific type of symptom that the user reports, describing the specific error condition. 'Objective' is what the user wants to accomplish, often expressed as a positive condition. FOr example, how to print on a network. 'Evidence' is information that is collected to diagnose the problem after the symptom is reported. 'Cause' is a description of the underlying facts or factors that engender or relate this behavior. 'Work_around' is information that lets the user work, but does not correct the problem completely. 'Fix' is information that fixes the problem completely. 'Answer' is the information given to the user such as steps to perform, wording to support their environment and understanding. 'Keyword' is a specific classification using defined words or phrases. 'Changes' describe recent changes in the environment which could affect the problem or resolution. 'Title' is the title applying to associated PRS_Statements (usually associated via an 'and' expression.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "254"
                   "255"))
                 (:VALUES
                  ("Description" "Symptom" "Error_Message" "Objective"
                   "Evidence" "Cause" "Work_Around" "Fix" "Answer" "Keyword"
                   "Changes" "Title" "Other" "Unknown")))
                :INITFORM NIL)
               (TEXT STRING :CIM-NAME "Text" :QUALIFIERS
                ((:DESCRIPTION
                  "The descriptive text used for the PRS_Statement."))
                :INITFORM NIL)
               (STATEMENTOPERATOR STRING :CIM-NAME "StatementOperator"
                :QUALIFIERS
                ((:DESCRIPTION
                  "When the PRS_Adminstrative object indicates Level 2 compliance, StatementOperator describes the relationship between an associated PRS_Feature and the FeatureValue property. This property is ignored if there is no PRS_Feature associated with this PRS_Statement."))
                :INITFORM NIL)
               (FEATUREVALUE STRING :CIM-NAME "FeatureValue" :QUALIFIERS
                ((:DESCRIPTION
                  "When the PRS_Adminstrative object indicates Level 2 compliance, FeatureValue is the specific value selected from the associated PRS_Feature. This property is ignored if there is no PRS_Feature associated with this PRS_Statement."))
                :INITFORM NIL)
               (ORDER STRING :CIM-NAME "Order" :QUALIFIERS
                ((:DESCRIPTION
                  "Order is used to sequence PRS_Statements associated with a single PRS_Expression to allow a Consumer to process the information in the order desired by the Producer."))
                :INITFORM NIL)
               (RELEVANCE UINT16 :CIM-NAME "Relevance" :QUALIFIERS
                ((:DESCRIPTION
                  "Importance of this Statement. The value of this property shall be an integer value in the range of 0 to 100, inclusive.")
                 (:MIN-VALUE "0") (:MAX-VALUE "100"))
                :INITFORM NIL)
               (PRSUNIQUENAME STRING :CIM-NAME "PRSUniqueName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The PRSUniqueName property is a Globally Unique IDentifier (GUID) also known as a Universally Unique IDentifier (UUID). This property allows Solution and Service Incident objects to be used by multiple Solutions or Service Incidents without duplication. In addition, all Solution or Service Incidents containing a unique object are updated when the object is updated."))
                :INITFORM NIL)
               (DIRTYFLAG UINT8 :CIM-NAME "DirtyFlag" :QUALIFIERS
                ((:DESCRIPTION
                  "The DirtyFlag is used by the SISService Start Transaction method to determine whether an ExchangeElement has been created, modified or deleted since the last Transaction. Any object not marked 'Clean' is included in the next Transaction. 

It is the responsibility of the entity creating, modifying or deleting the object derived from ExchangeElement to set this property appropriately. 

This property value is set to 'Clean' by an invocation of the Transaction Complete method with a Status parameter of zero (0).")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES ("Clean" "New" "Modified" "Deleted")))
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
                :INITFORM NIL))
              (:CIM-NAME "PRS_Statement")
              (:QUALIFIERS (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "PRS_Statement contains the text describing a problem, any relevant background information, and its resolution. Statements are units of text ranging from brief sentences or phrases to paragraphs or pages. There is no limit to the number of PRS_Statements within a Solution, as long as they support the intent and focus of their root class. Root classes include: PRS_Reference, PRS_Problem or PRS_Resolution. 

PRS_Statements may be grouped together to build compound 'sentences'. For example, 
StatementA = Printer output is blotchy. 
StatementB = Print jobs per day are less than 50. 
ExpressionA = StatementA AND StatementB.")))