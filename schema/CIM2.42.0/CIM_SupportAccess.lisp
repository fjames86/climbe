
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SupportAccess.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SUPPORTACCESS (CIM_MANAGEDELEMENT)
              ((SUPPORTACCESSID STRING :CIM-NAME "SupportAccessId" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "SupportAccessID is an arbitrary, free form string defined by the Product Vendor or by the organization that deploys the Product. This property, since it is a key, should be unique throughout the enterprise.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:OVERRIDE "Description")
                 (:DESCRIPTION
                  "A textual description of the type of Support provided.")
                 (:MAPPING-STRINGS ("MIF.DMTF|Support|001.3")))
                :INITFORM NIL)
               (COMMUNICATIONINFO STRING :CIM-NAME "CommunicationInfo"
                :QUALIFIERS
                ((:DESCRIPTION
                  "CommunicationInfo provides the details of the Communication Mode. For example, if the CommunicationMode is 'Phone', CommunicationInfo specifies the phone number to be called.")
                 (:MAPPING-STRINGS
                  ("MIF.DMTF|FRU|002.11" "MIF.DMTF|FRU|002.12")))
                :INITFORM NIL)
               (COMMUNICATIONMODE UINT16 :CIM-NAME "CommunicationMode"
                :QUALIFIERS
                ((:DESCRIPTION
                  "CommunicationMode defines the form of communication in order to obtain support. For example, phone communication (value =2), fax (3) or email (8) can be specified.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" "6" "7" "8"))
                 (:VALUES
                  ("Other" "Phone" "Fax" "BBS" "Online Service" "Web Page"
                   "FTP" "E-mail"))
                 (:MAPPING-STRINGS ("MIF.DMTF|Support|001.5")))
                :INITFORM NIL)
               (LOCALE STRING :CIM-NAME "Locale" :QUALIFIERS
                ((:DESCRIPTION
                  "Locale defines the geographic region and/or language dialect to which this Support resource pertains.")
                 (:MAX-LEN "64") (:MAPPING-STRINGS ("MIF.DMTF|Support|001.2")))
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
              (:CIM-NAME "CIM_SupportAccess")
              (:QUALIFIERS (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Core::ProductFRU")
               (:DESCRIPTION
                "The CIM_SupportAccess association defines how to obtain assistance for a Product.")))