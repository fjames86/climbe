
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OtherRoleInformation.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_OTHERROLEINFORMATION (CIM_MANAGEDELEMENT)
              ((CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The Name property defines the label by which the object is known. In the case of an LDAP-derived instance, the Name property value may be set to the distinguished name of the LDAP-accessed object instance.")
                 (:MAX-LEN "1024"))
                :INITFORM NIL)
               (PREFERREDDELIVERYMETHOD STRING :CIM-NAME
                "PreferredDeliveryMethod" :QUALIFIERS
                ((:DESCRIPTION
                  "The PreferredDeliveryMethod property specifies the role occupants' preferred method to be used for contacting them in their role."))
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
               (OBJECTCLASS (ARRAY STRING) :CIM-NAME "ObjectClass" :QUALIFIERS
                ((:DESCRIPTION
                  "In the case of an LDAP-derived instance, the ObjectClass property value(s) may be set to the objectClass attribute values."))
                :INITFORM NIL)
               (BUSINESSCATEGORY (ARRAY STRING) :CIM-NAME "BusinessCategory"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property may be used to describe the kind of business activity performed by the members (role occupants) in the position or set of responsibilities represented by the Role.")
                 (:MAX-LEN "128"))
                :INITFORM NIL)
               (COMMONNAME (ARRAY STRING) :CIM-NAME "CommonName" :QUALIFIERS
                ((:DESCRIPTION
                  "A CommonName is a (possibly ambiguous) name by which the role is commonly known in some limited scope (such as an organization) and conforms to the naming conventions of the country or culture with which it is associated."))
                :INITFORM NIL)
               (DESCRIPTIONS (ARRAY STRING) :CIM-NAME "Descriptions"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The Descriptions property values may contain human-readable descriptions of the object. In the case of an LDAP-derived instance, the description attribute may have multiple values that, therefore, cannot be placed in the inherited Description property.")
                 (:MAX-LEN "1024"))
                :INITFORM NIL)
               (DESTINATIONINDICATOR (ARRAY STRING) :CIM-NAME
                "DestinationIndicator" :QUALIFIERS
                ((:DESCRIPTION
                  "This property is used for the role occupants' telegram service.")
                 (:MAX-LEN "128"))
                :INITFORM NIL)
               (FACSIMILETELEPHONENUMBER (ARRAY STRING) :CIM-NAME
                "FacsimileTelephoneNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "The role occupants' facsimile telephone number."))
                :INITFORM NIL)
               (INTERNATIONALISDNNUMBER (ARRAY STRING) :CIM-NAME
                "InternationaliSDNNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "The role occupants' International ISDN number.")
                 (:MAX-LEN "16"))
                :INITFORM NIL)
               (OU (ARRAY STRING) :CIM-NAME "OU" :QUALIFIERS
                ((:DESCRIPTION
                  "The name of an organizational unit related to the role."))
                :INITFORM NIL)
               (PHYSICALDELIVERYOFFICENAME (ARRAY STRING) :CIM-NAME
                "PhysicalDeliveryOfficeName" :QUALIFIERS
                ((:DESCRIPTION
                  "The PhysicalDeliveryOfficeName property specifies the name of the city, village, etc. where a physical delivery office is situated.")
                 (:MAX-LEN "128"))
                :INITFORM NIL)
               (POSTALADDRESS (ARRAY STRING) :CIM-NAME "PostalAddress"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The PostalAddress property values specify the address information required for the physical delivery of postal messages by the postal authority to the role occupants."))
                :INITFORM NIL)
               (POSTALCODE (ARRAY STRING) :CIM-NAME "PostalCode" :QUALIFIERS
                ((:DESCRIPTION
                  "The PostalCode property specifies the postal code for the role occupants. If this value is present it will be part of the object's postal address.")
                 (:MAX-LEN "40"))
                :INITFORM NIL)
               (POSTOFFICEBOX (ARRAY STRING) :CIM-NAME "PostOfficeBox"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The PostOfficeBox property specifies the PO box by which the role occupants will receive physical postal delivery. If present, the property value is part of the object's postal address.")
                 (:MAX-LEN "40"))
                :INITFORM NIL)
               (REGISTEREDADDRESS (ARRAY STRING) :CIM-NAME "RegisteredAddress"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property specifies a postal address suitable for receipt of telegrams or expedited documents, where it is necessary to have the recipient accept delivery."))
                :INITFORM NIL)
               (SEEALSO (ARRAY STRING) :CIM-NAME "SeeAlso" :QUALIFIERS
                ((:DESCRIPTION
                  "In the case of an LDAP-derived instance, the SeeAlso property specifies distinguished name of other Directory objects which may be other aspects (in some sense) of the same real world object."))
                :INITFORM NIL)
               (STATEORPROVINCE (ARRAY STRING) :CIM-NAME "StateOrProvince"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The State or Province name property specifies a state or province."))
                :INITFORM NIL)
               (STREET (ARRAY STRING) :CIM-NAME "Street" :QUALIFIERS
                ((:DESCRIPTION
                  "The Street address property specifies a site for the local distribution and physical delivery in a postal address, i.e. the street name, place, avenue, and the number.")
                 (:MAX-LEN "128"))
                :INITFORM NIL)
               (TELEPHONENUMBER (ARRAY STRING) :CIM-NAME "TelephoneNumber"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The TelephoneNumber property specifies a telephone number of the role occupants, e.g. + 44 582 10101).")
                 (:MAX-LEN "32"))
                :INITFORM NIL)
               (TELETEXTERMINALIDENTIFIER (ARRAY STRING) :CIM-NAME
                "TeletexTerminalIdentifier" :QUALIFIERS
                ((:DESCRIPTION
                  "The TeletexTerminalIdentifier property specifies the Teletex terminal identifier (and, optionally, parameters) for a teletex terminal associated with the role occupants."))
                :INITFORM NIL)
               (TELEXNUMBER (ARRAY STRING) :CIM-NAME "TelexNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "The TelexNumber property specifies the telex number, country code, and answerback code of a telex terminal for the role occupants."))
                :INITFORM NIL)
               (X121ADDRESS (ARRAY STRING) :CIM-NAME "X121Address" :QUALIFIERS
                ((:DESCRIPTION "An X.121 address for the role occupants.")
                 (:MAX-LEN "15"))
                :INITFORM NIL))
              (:CIM-NAME "CIM_OtherRoleInformation")
              (:QUALIFIERS (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::User::Role")
               (:DESCRIPTION
                "The OtherRoleInformation class is used to provide additional information about an associated Role instance. This class is defined so as to incorporate commonly-used LDAP attributes to permit implementations to easily derive this information from LDAP-accessible directories.")))