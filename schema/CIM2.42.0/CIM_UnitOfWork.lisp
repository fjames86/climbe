
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_UnitOfWork.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_UNITOFWORK (CIM_MANAGEDELEMENT)
              ((DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:OVERRIDE "Description")
                 (:DESCRIPTION
                  "Since UnitOfWork is designed to be an extremely lightweight object, it is recommended that this property not be used. The Description specified for the instance's associated CIM_UnitOfWorkDefintion should apply."))
                :INITFORM NIL)
               (ID SINT64 :CIM-NAME "Id" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The identifier of the UnitOfWork, within the context of the UnitOfWorkDefinition."))
                :INITFORM NIL)
               (UOWDEFID STRING :CIM-NAME "UoWDefId" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "A 16 byte value that uniquely identifies the UnitOfWork Definition. The use of OSF UUID/GUIDs is recommended.")
                 (:MAX-LEN "16") (:PROPOGATED "CIM_UnitOfWorkDefinition.Id"))
                :INITFORM NIL)
               (USERNAME STRING :CIM-NAME "UserName" :QUALIFIERS
                ((:DESCRIPTION
                  "The name of the user who initiated the UnitOfWork. This may be a real user's login name or a logical name representing an application."))
                :INITFORM NIL)
               (STARTTIME DATETIME :CIM-NAME "StartTime" :QUALIFIERS
                ((:DESCRIPTION "The time that the UnitOfWork was started."))
                :INITFORM NIL)
               (ELAPSEDTIME DATETIME :CIM-NAME "ElapsedTime" :QUALIFIERS
                ((:DESCRIPTION
                  "The elapsed time since the UnitOfWork was started. Upon completion of the UnitOfWork, this property contains the total amount of time taken in processing the entire UnitOfWork."))
                :INITFORM NIL)
               (STATUS UINT16 :CIM-NAME "Status" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration identifing the status of the UnitOfWork. Most of the property values are self-explanatory, but a few need additional text: 
3=\"Completed\" - Should be used to represent a 'completed' transaction whose status ('good', 'failed' or 'aborted') is unknown. 
6=\"Completed Aborted\" - Should be used when a UnitOfWork has completed but was not allowed to end normally. An example would be when the Stop or Back buttons are selected from a web browser, before a page is fully loaded.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" "6"))
                 (:VALUES
                  ("Active" "Suspended" "Completed" "Completed Good"
                   "Completed Failed" "Completed Aborted")))
                :INITFORM NIL)
               (TRACELEVEL UINT32 :CIM-NAME "TraceLevel" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the granularity at which traces are written for this particular instance of UnitOfWork. Traces allow providing more detailed information on the course of the execution of the UnitOfWork than just the status and the elapsed time. The trace level does not indicate where the traces are found (i.e. in which file or CIM instances). TraceLevel cannot be set (i.e. written) since an instance of UnitOfWork only publishes information. So, the application code that executes the unit of work must receive the desired trace level by its caller (e.g. the parent module, the user or some remote system that initiates the unit of work). 
If its value is 0, no traces are available. If its value is > 0, traces are available. Except 0, the possible values and their semantics are implementation dependent. Two instances of UnitOfWork (even with the same definition) may have different trace levels since the desired or required granularity of traces may be dependent on the execution context (detection of an error, analysis of an error, etc.) of the unit of work. 
The trace level can be encoded as a bit map (each individual bit indicates a certain trace type and/or level of detail) or numbers (that are further defined by a value map). No encoding scheme is imposed since no general rules or standards exist and in consequence, application developers could reuse their existing trace level scheme."))
                :INITFORM NIL)
               (MUTUALCONTEXTID STRING :CIM-NAME "MutualContextId" :QUALIFIERS
                ((:DESCRIPTION
                  "A string that uniquely identifies the mutual context of UnitOfWork instances. The context is defined as an individual action that several UnitOfWork instances participate in. The use of Ids such as OSF UUID/GUIDs is recommended, although some implementations may require longer Ids. (This is the reason why no maxlen(16) qualifier has been used.) 
MutualContextId explicitly identifies the context for instances of UnitOfWork, that is otherwise provided implicitly by SubUoW association instances. In addition, one can query directly (i.e. without following the associations) for UnitOfWork instances that participate in some individual action (i.e., the mutual context). If no mutual context is needed or if it is not supported by the implementation, the value is NULL. 
Note that the MutualContextId value is to be transferred internally between the participating UnitOfWork implementations such that each UnitOfWork instance implementation receives its value from its predecessor/parent or initially creates the value if it is the first instance of the context."))
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
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                ((:DESCRIPTION
                  "A user-friendly name for the object. This property allows each instance to define a user-friendly name in addition to its key properties, identity data, and description information. 
Note that the Name property of ManagedSystemElement is also defined as a user-friendly name. But, it is often subclassed to be a Key. It is not reasonable that the same property can convey both identity and a user-friendly name, without inconsistencies. Where Name exists and is not a Key (such as for instances of LogicalDevice), the same information can be present in both the Name and ElementName properties. Note that if there is an associated instance of CIM_EnabledLogicalElementCapabilities, restrictions on this properties may exist as defined in ElementNameMask and MaxElementNameLen properties defined in that class."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_UnitOfWork")
              (:QUALIFIERS (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Metrics::UnitOfWork")
               (:DESCRIPTION
                "Each instance of UnitOfWork identifies a transaction that is either in-process or already completed. Because instances of 'in-process' UnitsOfWork can be very short-lived and there can be a great number of active ones, use of this class as an instrumentation source for determining response time may be incorrect or inefficient, unless the rate and duration of the UnitsOfWork are known. The intended use is to respond to queries about currently active or recently completed UnitsOfWork. The length of time that a UnitOfWork instance exists after the UnitOfWork completes is not defined and should be assumed to be implementation-dependent. This class is weak to its definition (CIM_UnitOfWorkDefintion).")))