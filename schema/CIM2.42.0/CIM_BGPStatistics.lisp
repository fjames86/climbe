
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BGPStatistics.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BGPSTATISTICS (CIM_SERVICESTATISTICALINFORMATION)
              ((INUPDATES UINT32 :CIM-NAME "InUpdates" :QUALIFIERS
                ((:DEPRECATED ("CIM_BGPEndpointStatistics.InUpdates"))
                 (:DESCRIPTION
                  "This is the number of BGP UPDATE messages received on this router's BGP connection. This is a 32-bit counter.")
                 :COUNTER
                 (:MAPPING-STRINGS ("MIB.IETF|BGP4-MIB.bgpPeerInUpdates")))
                :INITFORM NIL)
               (OUTUPDATES UINT32 :CIM-NAME "OutUpdates" :QUALIFIERS
                ((:DEPRECATED ("CIM_BGPEndpointStatistics.OutUpdates"))
                 (:DESCRIPTION
                  "This is the number of BGP UPDATE messages transmitted on this router's BGP connection. This is a 32-bit counter.")
                 :COUNTER
                 (:MAPPING-STRINGS ("MIB.IETF|BGP4-MIB.bgpPeerOutUpdates")))
                :INITFORM NIL)
               (INTOTALMESSAGES UINT32 :CIM-NAME "InTotalMessages" :QUALIFIERS
                ((:DEPRECATED ("CIM_BGPEndpointStatistics.InTotalMessages"))
                 (:DESCRIPTION
                  "This is the total number of BGP messages received on this router's BGP connection. This is a 32-bit counter.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BGP4-MIB.bgpPeerInTotalMessages")))
                :INITFORM NIL)
               (OUTTOTALMESSAGES UINT32 :CIM-NAME "OutTotalMessages"
                :QUALIFIERS
                ((:DEPRECATED ("CIM_BGPEndpointStatistics.OutTotalMessages"))
                 (:DESCRIPTION
                  "This is the total number of BGP messages transmitted on this router's BGP connection. This is a 32-bit counter.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BGP4-MIB.bgpPeerOutTotalMessages")))
                :INITFORM NIL)
               (FSMESTABLISHEDTRANSITIONS UINT32 :CIM-NAME
                "FsmEstablishedTransitions" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_BGPEndpointStatistics.FsmEstablishedTransitions"))
                 (:DESCRIPTION
                  "This contains the total number of times that the BGP Finite State Machine has transitioned into the established state for this router's BGP connection. This is a 32-bit counter.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BGP4-MIB.bgpPeerFsmEstablishedTransitions")))
                :INITFORM NIL)
               (FSMESTABLISHEDTIME UINT32 :CIM-NAME "FsmEstablishedTime"
                :QUALIFIERS
                ((:DEPRECATED ("CIM_BGPEndpointStatistics.FsmEstablishedTime"))
                 (:DESCRIPTION
                  "This indicates how long, in seconds, this peer has been in the established state, or how long since this peer was last in the established state. It is set to zero when a new peer is configured or when the router is booted. This has the semantics of a 32-bit gauge.")
                 (NIL "Seconds") :GAUGE
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BGP4-MIB.bgpPeerFsmEstablishedTime")))
                :INITFORM NIL)
               (INUPDATEELAPSEDTIME UINT32 :CIM-NAME "InUpdateElapsedTime"
                :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_BGPEndpointStatistics.InUpdateElapsedTime"))
                 (:DESCRIPTION
                  "This defines the time in seconds since the last BGP UPDATE message was received from the peer. This has the semantics of a 32-bit gauge.")
                 (NIL "Seconds") :GAUGE
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BGP4-MIB.bgpPeerInUpdateElapsedTime")))
                :INITFORM NIL)
               (SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping System's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_Service.SystemCreationClassName"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping System's Name.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_Service.SystemName"))
                :INITFORM NIL)
               (SERVICECREATIONCLASSNAME STRING :CIM-NAME
                "ServiceCreationClassName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping Service's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_Service.CreationClassName"))
                :INITFORM NIL)
               (SERVICENAME STRING :CIM-NAME "ServiceName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping Service's Name.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_Service.Name"))
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
                :INITFORM NIL)
               (LASTERROR (ARRAY UINT8) :CIM-NAME "LastError" :QUALIFIERS
                ((:DEPRECATED ("CIM_BGPEndpointStatistics.LastError"))
                 (:DESCRIPTION
                  "This contains the last error code and error subcode for this router's BGP connection. If no error has occurred, then each integer in the array is zero.")
                 (:MAPPING-STRINGS ("MIB.IETF|BGP4-MIB.bgpPeerLastError")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_BGPStatistics")
              (:QUALIFIERS (:DEPRECATED ("CIM_BGPEndpointStatistics"))
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "This class contains statistical information for a Service's sessions. It is deprecated since the statistics are defined in the BGP4 MIB at the level of individual peers/ endpoints.")))