
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_Address.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_ADDRESS (PRS_EXCHANGEELEMENT)
              ((ADDRESSTYPE UINT8 :CIM-NAME "AddressType" :QUALIFIERS
                ((:DESCRIPTION "The type of address.")
                 (:VALUE-MAP ("0" "1" "2" "3" "254" "255"))
                 (:VALUES
                  ("Primary" "Shipping" "Billing" "Service" "Other"
                   "Unknown")))
                :INITFORM NIL)
               (ADDRESS1 STRING :CIM-NAME "Address1" :QUALIFIERS
                ((:DESCRIPTION "First line of address information.")) :INITFORM
                NIL)
               (ADDRESS2 STRING :CIM-NAME "Address2" :QUALIFIERS
                ((:DESCRIPTION "Second line of address information."))
                :INITFORM NIL)
               (ADDRESS3 STRING :CIM-NAME "Address3" :QUALIFIERS
                ((:DESCRIPTION "Third line of address information.")) :INITFORM
                NIL)
               (ADDRESS4 STRING :CIM-NAME "Address4" :QUALIFIERS
                ((:DESCRIPTION "Fourth line of address information."))
                :INITFORM NIL)
               (CITY STRING :CIM-NAME "City" :QUALIFIERS
                ((:DESCRIPTION "The city.")) :INITFORM NIL)
               (REGION STRING :CIM-NAME "Region" :QUALIFIERS
                ((:DESCRIPTION
                  "The specific region, such as state or province."))
                :INITFORM NIL)
               (POSTALCODE STRING :CIM-NAME "PostalCode" :QUALIFIERS
                ((:DESCRIPTION "The country's postal code for the address."))
                :INITFORM NIL)
               (TIMEZONE STRING :CIM-NAME "TimeZone" :QUALIFIERS
                ((:DESCRIPTION "The time zone of the address.")) :INITFORM NIL)
               (COUNTRY STRING :CIM-NAME "Country" :QUALIFIERS
                ((:DESCRIPTION "The country code, based on ISO/IEC 3166."))
                :INITFORM NIL)
               (PRSUNIQUENAME STRING :CIM-NAME "PRSUniqueName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The PRSUniqueName property is a Globally Unique IDentifier (GUID) also known as a Universally Unique IDentifier (UUID). This property allows Solution and Service Incident objects to be used by multiple Solutions or Service Incidents without duplication. In addition, all Solution or Service Incidents containing a unique object are updated when the object is updated."))
                :INITFORM NIL)
               (DIRTYFLAG UINT8 :CIM-NAME "DirtyFlag" :QUALIFIERS
                ((:DESCRIPTION
                  "The DirtyFlag is used by the SISService Start Transaction method to determine whether an ExchangeElement has been created, modified or deleted since the last Transaction. Any object not marked 'Clean' is included in the next Transaction. 

It is the responsibility of the entity creating, modifying or deleting the object derived from ExchangeElement to set this property appropriately. 

This property value is set to 'Clean' by an invocation of the Transaction Complete method with a Status parameter of zero (0).")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES ("Clean" "New" "Modified" "Deleted")))
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
              (:CIM-NAME "PRS_Address")
              (:QUALIFIERS (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "Provides address information for PRS_ContactItem.")))