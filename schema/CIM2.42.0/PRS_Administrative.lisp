
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_Administrative.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_ADMINISTRATIVE (PRS_EXCHANGEELEMENT)
              ((COMPLIANCELEVEL UINT16 :CIM-NAME "ComplianceLevel" :QUALIFIERS
                ((:DESCRIPTION
                  "Level 0 means all information within a Reference, Problem or Resolution is conveyed by a single PRS_Statement. 

Level 1 means there may be multiple PRS_Statement instances within a Reference, Problem or Resolution. 

Level 2 means that a PRS_Statement may be associated with a PRS_Feature instance within a Reference, Problem or Resolution.")
                 (:VALUE-MAP ("0" "1" "2")))
                :INITFORM NIL)
               (DOCUMENTSTATUS UINT8 :CIM-NAME "DocumentStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "Editorial status of the document. If 'Draft', information is complete, but unedited. If 'Reviewed', an editorial review has been completed. If 'Published', information has been reviewed and approved for distribution.")
                 (:VALUE-MAP ("0" "1" "2" "254" "255"))
                 (:VALUES ("Draft" "Reviewed" "Published" "Other" "Unknown")))
                :INITFORM NIL)
               (DISTRIBUTION UINT8 :CIM-NAME "Distribution" :QUALIFIERS
                ((:DESCRIPTION
                  "Intended distribution audience for the associated information. If 'Proprietary', information contains proprietary information and is not to be released externally. If 'Internal', information is for internal use only. If 'Partner', information is only available to contracted partners. If 'Public', information is available to anyone.")
                 (:VALUE-MAP ("0" "1" "2" "3" "254" "255"))
                 (:VALUES
                  ("Proprietary" "Internal" "Partner" "Public" "Other"
                   "Unknown")))
                :INITFORM NIL)
               (LANGUAGE STRING :CIM-NAME "Language" :QUALIFIERS
                ((:DESCRIPTION "Language used in the associated information."))
                :INITFORM NIL)
               (COPYRIGHT STRING :CIM-NAME "Copyright" :QUALIFIERS
                ((:DESCRIPTION "Copyright for the associated information."))
                :INITFORM NIL)
               (DISCLAIMER STRING :CIM-NAME "Disclaimer" :QUALIFIERS
                ((:DESCRIPTION
                  "Disclaimers about the associated information."))
                :INITFORM NIL)
               (RIGHTS STRING :CIM-NAME "Rights" :QUALIFIERS
                ((:DESCRIPTION "Usage rights for the associated information."))
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
              (:CIM-NAME "PRS_Administrative")
              (:QUALIFIERS (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "PRS_Administrative defines administrative information about associated objects. There must be at least one PRS_Administrative instance associated with a PRS_Solution. Administrative information is inherited from a parent object. 

If the administrative information among objects within a Solution is not the same, additional PRS_Administrative instances may be associated with other objects within the Solution. All instances under a specific parent inherit their administrative information unless there is an PRS_Administrative instance associated with that instance. 

For example, if there is a PRS_Administrative instance associated with a PRS_Problem instance, all of the PRS_Statement and PRS_ Product instances within the Problem use the same Administrative information as the PRS_Problem instance.")))