
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ListenerDestinationCIMXML.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LISTENERDESTINATIONCIMXML (CIM_LISTENERDESTINATION)
              ((DESTINATION STRING :CIM-NAME "Destination" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "Destination")
                 (:DESCRIPTION
                  "The destination URL to which CIM-XML Export Messages are to be delivered.The scheme prefix MUST be consistent with the DMTF CIM-XML specifications.If a scheme prefix is not specified, the scheme \"http:\" MUST be assumed."))
                :INITFORM NIL)
               (SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "A System's CreationClassName. A CIM Listener destination is defined in context of a CIM_System (e.g., the sending system.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "A System's Name. A CIM Listener destination is defined in context of a CIM_System (e.g., the sending system.")
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
                (:KEY
                 (:DESCRIPTION
                  "Indicates the name of the CIM Listener destination.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (PERSISTENCETYPE UINT16 :CIM-NAME "PersistenceType" :QUALIFIERS
                ((:DESCRIPTION
                  "Describes the Persistence Type of the destination defined by this instance. If the value of PersistenceType is not specified, the value of PersistenceType MUST be treated as 2 (\"Permanent\"). A value of 2 (\"Permanent\") declares that the destination is always expected to be available (e.g., system log file). Inability to access this destination MUST be treated as an error condition. A value of 3 (\"Transient\") indicates that the destination is short-lived. Inability to access the destination MAY be treated as a normal termination condition. Subscriptions with \"Transient\" destinations MAY be deleted when the destination terminates or is no longer available.")
                 (:VALUE-MAP ("1" "2" "3"))
                 (:VALUES ("Other" "Permanent" "Transient"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ListenerDestination.OtherPersistenceType")))
                :INITFORM NIL)
               (OTHERPERSISTENCETYPE STRING :CIM-NAME "OtherPersistenceType"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing (\"Other\") values for PersistenceType. This value MUST be set to a non NULL value when the PersistenceType is 1 (\"Other\"). For all other values of PersistenceType, the value of OtherPersistenceType MUST be NULL.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ListenerDestination.PersistenceType")))
                :INITFORM NIL)
               (OTHERPROTOCOL STRING :CIM-NAME "OtherProtocol" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string providing a description of the supported protocols when 1, \"Other\", is specified for the Protocol.")
                 (:MODEL-CORRESPONDENCE ("CIM_ListenerDestination.Protocol")))
                :INITFORM NIL)
               (PROTOCOL UINT16 :CIM-NAME "Protocol" :QUALIFIERS
                ((:DESCRIPTION
                  "Protocol describes an encoding and protocol which will be used to deliver the indication. If Other is used, the value for OtherProtocol must not be null.
If a protocol is not specified, 2 \"CIM-XML\" must be assumed.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" "6" ".."))
                 (:VALUES
                  ("Other" "CIM-XML" "SM CLP" "WS-Management" "WSDM" "SMTP"
                   "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ListenerDestination.OtherProtocol")))
                :INITFORM "2")
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
              (:CIM-NAME "CIM_ListenerDestinationCIMXML")
              (:QUALIFIERS (:VERSION "2.22.0") (:UML-PACKAGE-PATH "CIM::Event")
               (:DESCRIPTION
                "CIM_ListenerDestinationCIMXML describes the destination for CIM Export Messages to be delivered via CIM-XML.")))