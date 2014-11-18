
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RangeOfIPAddresses.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_RANGEOFIPADDRESSES (CIM_SYSTEMSPECIFICCOLLECTION)
              ((STARTADDRESS STRING :CIM-NAME "StartAddress" :QUALIFIERS
                ((:DESCRIPTION
                  "The starting IP address of the AddressRange, formatted according to the appropriate convention as defined in the AddressType property of this class (e.g., 171.79.6.40).")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RangeOfIPAddresses.AddressType")))
                :INITFORM NIL)
               (ENDADDRESS STRING :CIM-NAME "EndAddress" :QUALIFIERS
                ((:DESCRIPTION
                  "The ending IP address of the AddressRange, formatted according to the appropriate convention as defined in the AddressType property of this class (e.g., 171.79.6.40).")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RangeOfIPAddresses.AddressType")))
                :INITFORM NIL)
               (ADDRESSTYPE UINT16 :CIM-NAME "AddressType" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration that defines how the address and mask properties are formatted.")
                 (:VALUE-MAP ("0" "1" "2"))
                 (:VALUES ("Unknown" "IPv4" "IPv6")))
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
              (:CIM-NAME "CIM_RangeOfIPAddresses")
              (:QUALIFIERS (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::Collections")
               (:DESCRIPTION
                "The class RangeOfIPAddresses represents an implicit grouping (or 'pool') of IP addresses specified by the properties, Start and EndAddress. It is defined as scoped/contained by a system such as an individual network element or an admin domain.")))