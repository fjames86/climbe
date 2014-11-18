
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SwitchPortTransparentBridgingStatistics.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SWITCHPORTTRANSPARENTBRIDGINGSTATISTICS
              (CIM_SAPSTATISTICALINFORMATION)
              ((INFRAMES UINT32 :CIM-NAME "InFrames" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of frames that have been received by the port from its segment. Note that a frame is only counted if and only if it is for a protocol being processed by the local bridging function, including bridge management frames.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BRIDGE-MIB.dot1dTpPortInFrames")))
                :INITFORM NIL)
               (OUTFRAMES UINT32 :CIM-NAME "OutFrames" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of frames that have been transmitted by the port to its segment. Note that a frame is only counted if and only if it is for a protocol being processed by the local bridging function, including bridge management frames.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BRIDGE-MIB.dot1dTpPortOutFrames")))
                :INITFORM NIL)
               (INDISCARDS UINT32 :CIM-NAME "InDiscards" :QUALIFIERS
                ((:DESCRIPTION
                  "Count of valid frames received which were discarded (i.e., filtered) by the forwarding process.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BRIDGE-MIB.dot1dTpPortInDiscards")))
                :INITFORM NIL)
               (SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping System's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED
                  "CIM_ServiceAccessPoint.SystemCreationClassName"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping System's Name.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_ServiceAccessPoint.SystemName"))
                :INITFORM NIL)
               (SAPCREATIONCLASSNAME STRING :CIM-NAME "SAPCreationClassName"
                :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping SAP's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_ServiceAccessPoint.CreationClassName"))
                :INITFORM NIL)
               (SAPNAME STRING :CIM-NAME "SAPName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping SAP's Name.") (:MAX-LEN "256")
                 (:PROPOGATED "CIM_ServiceAccessPoint.Name"))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:KEY (:OVERRIDE "Name")
                 (:DESCRIPTION
                  "The Name property, inherited from StatisticalInformation, serves as part of the object key.")
                 (:MAX-LEN "256"))
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
              (:CIM-NAME "CIM_SwitchPortTransparentBridgingStatistics")
              (:QUALIFIERS (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::SwitchingBridging")
               (:DESCRIPTION
                "Statistical information regarding a SwitchPort, at which transparent bridging is performed.")))