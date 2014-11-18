
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_Transaction.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_TRANSACTION (PRS_EXCHANGEELEMENT)
              ((TRANSACTIONTYPE UINT8 :CIM-NAME "TransactionType" :QUALIFIERS
                ((:DESCRIPTION
                  "The specific SIS transaction represented by this PRS_Transaction instance.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "254"
                   "255"))
                 (:VALUES
                  ("Service_Request" "Entitlement" "Problem_Submittal"
                   "Accept_Problem" "Problem_Resolution"
                   "Request_Problem_Information" "Provide_Problem_Information"
                   "Provide_Admin_Information" "Query_Incident" "Confirm_Close"
                   "Reject_Resolution" "Request_Closure" "Other" "Unknown")))
                :INITFORM NIL)
               (TRANSACTIONSTATE UINT8 :CIM-NAME "TransactionState" :QUALIFIERS
                ((:DESCRIPTION
                  "The current state of this transaction. This value is manipulated by the PRS_SISService:StartSISTransaction and SetSISCompletionStatus method implementations. This property is not intended to be written by management applications.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES ("Open" "Working" "Closed" "Notification_Pending")))
                :INITFORM NIL)
               (COMPLETIONSTATUS UINT32 :CIM-NAME "CompletionStatus"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The status of the transaction after it has reached the 'Closed' state. A CompletionStatus of zero (0) means the tranasaction completed successfully. A non-zero CompletionStatus indicates the transaction did not complete successfully. Non-zero values are implementation-specific. While the transaction is 'Open' or 'Working' the CompletionStatus property shall be zero (0). See the description for PRS_SISService for the definition of the contents of this property."))
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
              (:CIM-NAME "PRS_Transaction")
              (:QUALIFIERS (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "PRS_Transaction represents a single transaction of the Service Incident workflow. A PRS_Transaction instance is created by the PRS_SISService StartSISTransaction method.")))