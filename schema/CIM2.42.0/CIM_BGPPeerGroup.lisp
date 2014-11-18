
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BGPPeerGroup.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BGPPEERGROUP (CIM_COLLECTIONOFMSES)
              ((SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The scoping AutonomousSystem's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_AutonomousSystem.CreationClassName"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping AutonomousSystem's Name.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_AutonomousSystem.Name"))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified."))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:KEY (:DESCRIPTION "This is the name of the BGP Peer Group.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (CONNECTRETRYINTERVAL UINT32 :CIM-NAME "ConnectRetryInterval"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This defines the time interval, in seconds, for the ConnectRetry timer for the endpoints of the routers in the PeerGroup. The suggested value is 120 seconds.")
                 (NIL "Seconds")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BGP4-MIB.bgpConnectRetryInterval")))
                :INITFORM "120")
               (HOLDTIMECONFIGURED UINT16 :CIM-NAME "HoldTimeConfigured"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This defines the time interval in seconds for the Hold TimeConfigured property of the endpoints of the routers in the PeerGroup. This value must not be less than three seconds. The suggested value for this timer is 90 seconds.")
                 (NIL "Seconds")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BGP4-MIB.bgpPeerHoldTimeConfigured")))
                :INITFORM "90")
               (KEEPALIVECONFIGURED UINT16 :CIM-NAME "KeepAliveConfigured"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This defines the time interval in seconds for the KeepAliveConfigured timer for the endpoints of the routers in the PeerGroup. The suggested value for this property is 30 seconds. The maximum value of this property is 21845 seconds.")
                 (NIL "Seconds")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BGP4-MIB.bgpPeerKeepAliveConfigured")))
                :INITFORM "30")
               (MINASORIGINATIONINTERVAL UINT16 :CIM-NAME
                "MinASOriginationInterval" :QUALIFIERS
                ((:DESCRIPTION
                  "This defines the time interval in seconds for the MinASOriginationInterval timer for the endpoints of the routers in the PeerGroup. The suggested value for this property is 15 seconds.")
                 (NIL "Seconds")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BGP4-MIB.bgpPeerMinASOriginationInterval")))
                :INITFORM "15")
               (MINROUTEADVERTISEMENTINTERVAL UINT16 :CIM-NAME
                "MinRouteAdvertisementInterval" :QUALIFIERS
                ((:DESCRIPTION
                  "This defines the time interval in seconds for the MinRouteAdvertisementInterval timer for the endpoints of the routers in the PeerGroup. The suggested value for this property is 30 seconds.")
                 (NIL "Seconds")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BGP4-MIB.bgpPeerMinRouteAdvertisementInterval")))
                :INITFORM "30")
               (COLLECTIONID STRING :CIM-NAME "CollectionID" :QUALIFIERS
                ((:DESCRIPTION
                  "The identification of the Collection object. When subclassed, the CollectionID property can be overridden to be a Key property.")
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
              (:CIM-NAME "CIM_BGPPeerGroup")
              (:QUALIFIERS (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "A BGP Peer Group is a set of BGP neighbors that share the same update policies. This enables an administrator to assign policies to the peer group, instead of individually. This enables the routers in the Peer Group to optimize UPDATE messages. Consequently, Peer Groups have a set of restrictions that must be followed in order to work correctly with external BGP peers. Otherwise, loss of routing information could occur. 

A BGPPeerGroup is weak to the AutonomousSystem that contains it. Therefore, the keys from System must be propagated to it.")))