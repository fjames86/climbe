
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_LANConnectivitySegment.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LANCONNECTIVITYSEGMENT (CIM_CONNECTIVITYCOLLECTION)
              ((LANID STRING :CIM-NAME "LANID" :QUALIFIERS
                ((:DESCRIPTION "A label or identifier for the LAN segment.")
                 (:MAX-LEN "64")
                 (:MODEL-CORRESPONDENCE ("CIM_LANEndpoint.LANID")))
                :INITFORM NIL)
               (CONNECTIVITYTYPE UINT16 :CIM-NAME "ConnectivityType"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration that categorizes and classifies instances of this class. Instances SHOULD aggregate entities of the appropriate 'type', as defined by the value of this enumeration.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES ("Unknown" "Other" "Ethernet" "TokenRing" "FDDI"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_LANConnectivitySegment.OtherTypeDescription")))
                :INITFORM NIL)
               (OTHERTYPEDESCRIPTION STRING :CIM-NAME "OtherTypeDescription"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the type of connectivity that is supported by this Collection, when the value of the Type property is set to 1 (i.e., \"Other\"). This property should be set to NULL when the Type property is any value other than 1.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_LANConnectivitySegment.ConnectivityType")))
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
              (:CIM-NAME "CIM_LANConnectivitySegment")
              (:QUALIFIERS (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::Collections")
               (:DESCRIPTION
                "A collection of LAN Endpoints of a particular type (i.e., Ethernet or Token Ring), that are able to intercommunicate without the assistance of bridging or routing services.")))