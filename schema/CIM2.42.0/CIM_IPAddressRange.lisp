
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IPAddressRange.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_IPADDRESSRANGE (CIM_COLLECTIONOFMSES)
              ((STARTADDRESS STRING :CIM-NAME "StartAddress" :QUALIFIERS
                ((:DEPRECATED ("CIM_RangeOfIPAddresses.StartAddress"))
                 (:DESCRIPTION
                  "The starting IP address of the AddressRange, formatted according to the appropriate convention as defined in the AddressType property of this class (e.g., 171.79.6.40)."))
                :INITFORM NIL)
               (ENDADDRESS STRING :CIM-NAME "EndAddress" :QUALIFIERS
                ((:DEPRECATED ("CIM_RangeOfIPAddresses.EndAddress"))
                 (:DESCRIPTION
                  "The ending IP address of the AddressRange, formatted according to the appropriate convention as defined in the AddressType property of this class (e.g., 171.79.6.40)."))
                :INITFORM NIL)
               (TYPEOFADDRESS UINT16 :CIM-NAME "TypeOfAddress" :QUALIFIERS
                ((:DEPRECATED ("CIM_RangeOfIPAddresses.AddressType"))
                 (:DESCRIPTION
                  "An enumeration that defines how to format the address and mask of the address range that defines this IPSubnet. 

Whenever possible, IPv4-compatible addresses should be used instead of IPv6 addresses (see RFC 2373, section 2.5.4). In order to have a consistent format for IPv4 addresses in a mixed IPv4/v6 environment, all IPv4 addresses and both IPv4-compatible IPv6 addresses and IPv4-mapped IPv6 addresses, per RFC 2373, section 2.5.4, should be formatted in standard IPv4 format.")
                 (:VALUE-MAP ("0" "1" "2"))
                 (:VALUES ("Unknown" "IPv4" "IPv6")))
                :INITFORM NIL)
               (ALLOCATIONREGION UINT16 :CIM-NAME "AllocationRegion"
                :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "This attribute defines the region that addresses can be allocated to.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7" "8"))
                 (:VALUES
                  ("Unknown" "Multiregional: 192.0.0.0 to 193.255.255.255"
                   "Europe: 194.0.0.0 to 195.255.255.255"
                   "Others: 196.0.0.0 to 197.255.255.255"
                   "North America: 198.0.0.0 to 199.255.255.255"
                   "Central & South America: 200.0.0.0 to 201.255.255.255"
                   "Pacific Rim: 202.0.0.0 to 203.255.255.255"
                   "Others: 204.0.0.0 to 205.255.255.255"
                   "Others: 206.0.0.0 to 207.255.255.255")))
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
              (:CIM-NAME "CIM_IPAddressRange")
              (:QUALIFIERS (:DEPRECATED ("CIM_RangeOfIPAddresses")) :ABSTRACT
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::Collections")
               (:DESCRIPTION
                "IPAddressRange represents a grouping of specific addresses, and provides additional semantics for this group if appropriate. The class is deprecated in lieu of the concrete class RangeOfIPAddresses since there is sufficient information for the class to be instantiated. In addition, an address range should be defined in the context of a System (for example, a network element or an admin domain). These semantics are incorporated in the RangeOfIPAddresses class.")))