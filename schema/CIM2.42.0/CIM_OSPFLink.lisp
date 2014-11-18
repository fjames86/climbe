
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OSPFLink.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_OSPFLINK (CIM_CONNECTIVITYCOLLECTION)
              ((LINKTYPE UINT16 :CIM-NAME "LinkType" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The type of the OSPF link, see section 1.2 in RFC 2328.")
                 (:VALUE-MAP ("2" "3" "4" "5"))
                 (:VALUES
                  ("Point-To-Point" "Point-To-Multipoint" "Broadcast" "NBMA")))
                :INITFORM NIL)
               (HELLOINTERVAL UINT32 :CIM-NAME "HelloInterval" :QUALIFIERS
                ((:DESCRIPTION
                  "The time, in seconds, between sending OSPF Hello-packets over the interface, see section C.3 in RFC 2328.")
                 (NIL "Seconds")
                 (:MAPPING-STRINGS ("MIB.IETF|OSPF-MIB.ospfIfHelloInterval")))
                :INITFORM NIL)
               (ROUTERDEADINTERVAL UINT32 :CIM-NAME "RouterDeadInterval"
                :QUALIFIERS
                ((:DESCRIPTION
                  "After ceasing to hear a router's Hello-packets, the number of seconds before its neighbors declare the router down, see section C.3 in RFC 2328.")
                 (NIL "Seconds")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|OSPF-MIB.ospfIfRtrDeadInterval")))
                :INITFORM NIL)
               (MULTICASTFORWARDING UINT16 :CIM-NAME "MulticastForwarding"
                :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "This parameter indicates whether IP multicast datagrams should be forwarded over this OSPF link, and if so, how the forwarding should be done, see section B.2 in RFC 1584.")
                 (:VALUE-MAP ("2" "3" "4"))
                 (:VALUES
                  ("Disabled" "Data-link Multicast" "Data-link Unicast"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|OSPF-MIB.ospfIfMulticastForwarding")))
                :INITFORM NIL)
               (CONNECTIVITYSTATUS UINT16 :CIM-NAME "ConnectivityStatus"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration describing the current or potential connectivity between endpoints in this collection. Connectivity may be provided or not, or may be in a degraded/partitioned state if one or more endpoints or links have failed. The latter would prevent full connectivity between all elements in the Collection, but would permit connectivity between subsets.")
                 (:VALUE-MAP ("0" "2" "3" "4"))
                 (:VALUES
                  ("Unknown" "Connectivity/Up" "No Connectivity/Down"
                   "Partitioned")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> must include a unique name. It can be a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID. Or, it could be a registered ID that is assigned to the business entity by a recognized global authority.(This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> must not contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity must ensure that the resulting InstanceID is not re-used as any of InstanceIDs produced by this or other providers for the NameSpace of this instance. 
For DMTF-defined instances, the 'preferred' algorithm must be used with the <OrgID> set to 'CIM'."))
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
              (:CIM-NAME "CIM_OSPFLink")
              (:QUALIFIERS (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::OSPF")
               (:DESCRIPTION
                "This class is used to represent OSPF connectivity between two or more OSPF protocol endpoints.")))