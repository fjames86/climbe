
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_NextHopRoute.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_NEXTHOPROUTE (CIM_MANAGEDELEMENT)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority. (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (DESTINATIONADDRESS STRING :CIM-NAME "DestinationAddress"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The address which serves as the destination to be reached."))
                :INITFORM NIL)
               (ADMINDISTANCE UINT16 :CIM-NAME "AdminDistance" :QUALIFIERS
                ((:DESCRIPTION
                  "The specific administrative distance of this route, overriding any default distances specified by the system or routing service."))
                :INITFORM NIL)
               (ROUTEMETRIC UINT16 :CIM-NAME "RouteMetric" :QUALIFIERS
                ((:DESCRIPTION
                  "RouteMetric provides a numeric indication as to the preference of this route, compared to other routes that reach the same destination."))
                :INITFORM NIL)
               (ISSTATIC BOOLEAN :CIM-NAME "IsStatic" :QUALIFIERS
                ((:DESCRIPTION
                  "TRUE indicates that this is a static route, and FALSE indicates a dynamically-learned route."))
                :INITFORM NIL)
               (TYPEOFROUTE UINT16 :CIM-NAME "TypeOfRoute" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumerated integer indicating whether the route is administrator-defined (value=2), computed (via a routing protocol/algorithm, value=3) or the actual route implemented in the network (value=4). The default is a computed route.")
                 (:VALUE-MAP ("2" "3" "4"))
                 (:VALUES
                  ("Administrator Defined Route" "Computed Route"
                   "Actual Route")))
                :INITFORM "3")
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
              (:CIM-NAME "CIM_NextHopRoute")
              (:QUALIFIERS (:VERSION "2.19.0")
               (:UML-PACKAGE-PATH "CIM::Network::Routes")
               (:DESCRIPTION
                "NextHopRoute represents one of a series of 'hops' to reach a network destination. A route is administratively defined, or calculated/learned by a particular routing process. A ConcreteDependency associaton may be instantiated between a route and its routing service to indicate this. (In this scenario, the route is dependent on the service.)")))