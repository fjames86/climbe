
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IPSubnet.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_IPSUBNET (CIM_LOGICALNETWORK)
              ((SUBNETNUMBER STRING :CIM-NAME "SubnetNumber" :QUALIFIERS
                ((:DEPRECATED ("CIM_IPConnectivitySubnet.SubnetNumber"))
                 (:DESCRIPTION
                  "The IP address of the entire subnet, formatted according to the appropriate convention as defined in the AddressType property of this class."))
                :INITFORM NIL)
               (SUBNETMASK STRING :CIM-NAME "SubnetMask" :QUALIFIERS
                ((:DEPRECATED ("CIM_IPConnectivitySubnet.SubnetMask"))
                 (:DESCRIPTION
                  "The mask for the starting IPv4 address of the IPSubnet, if needed (i.e., if the AddressType property is 1, \"IPv4\")."))
                :INITFORM NIL)
               (PREFIXLENGTH UINT8 :CIM-NAME "PrefixLength" :QUALIFIERS
                ((:DEPRECATED ("CIM_IPConnectivitySubnet.PrefixLength"))
                 (:DESCRIPTION
                  "The prefix length for IPv6 addresses in the IPSubnet, if needed (i.e., if the AddressType property is 2, \"IPv6\")."))
                :INITFORM NIL)
               (ADDRESSTYPE UINT16 :CIM-NAME "AddressType" :QUALIFIERS
                ((:DEPRECATED ("CIM_IPConnectivitySubnet.AddressType"))
                 (:DESCRIPTION
                  "An enumeration that describes the format of the address properties in IPSubnet.")
                 (:VALUE-MAP ("0" "1" "2"))
                 (:VALUES ("Unknown" "IPv4" "IPv6")))
                :INITFORM NIL)
               (SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                ((:DEPRECATED ("No value")) :KEY
                 (:DESCRIPTION "The scoping AdminDomain's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_AdminDomain.CreationClassName"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                ((:DEPRECATED ("No value")) :KEY
                 (:DESCRIPTION "The scoping AdminDomain's Name.")
                 (:MAX-LEN "256") (:PROPOGATED "CIM_AdminDomain.Name"))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                ((:DEPRECATED ("No value")) :KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                ((:DEPRECATED ("CIM_ConnectivityCollection.InstanceID")) :KEY
                 (:DESCRIPTION
                  "The Name property defines the label by which the object is known.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (NETWORKTYPE UINT16 :CIM-NAME "NetworkType" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Type is an enumeration that provides additional information that can be used to help categorize and classify different instances of this class. 

Subclasses should ensure that they are of the appropriate type defined in the Type enumeration. That is, the IPSubnet subclass should define its property as either IPv4 or IPv6, as opposed to, for example, ATM.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18"))
                 (:VALUES
                  ("Unknown" "Other" "IPv4" "IPv6" "IPX" "AppleTalk" "DECnet"
                   "SNA" "CONP" "CLNP" "VINES" "XNS" "ATM" "Frame Relay"
                   "Ethernet" "TokenRing" "FDDI" "Infiniband" "Fibre Channel"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_LogicalNetwork.OtherTypeDescription")))
                :INITFORM NIL)
               (OTHERTYPEDESCRIPTION STRING :CIM-NAME "OtherTypeDescription"
                :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "A string describing the type of protocol that is being run by this LogicalNetwork, when the value of the Type property (or any of its subclasses) is set to 1 (i.e., \"Other\"). This property should be set to NULL when the Type property is any value other than 1.")
                 (:MAX-LEN "64")
                 (:MODEL-CORRESPONDENCE ("CIM_LogicalNetwork.NetworkType")))
                :INITFORM NIL)
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
              (:CIM-NAME "CIM_IPSubnet")
              (:QUALIFIERS (:DEPRECATED ("CIM_IPConnectivitySubnet"))
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::Collections")
               (:DESCRIPTION
                "An IPSubnet represents a group of related IPProtocolEndpoints that can communicate with each other directly using IP. It is used for describing the characteristics of the grouping. 

Since this class' superclass (LogicalNetwork) has been deprecated (in order to define more consistent 'collection' semantics), this class is also deprecated.")))