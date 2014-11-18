
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Person.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PERSON (CIM_USERCONTACT)
              ((BUSINESSCATEGORY STRING :CIM-NAME "BusinessCategory"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property describes the kind of business performed by an organization.")
                 (:MAX-LEN "128"))
                :INITFORM NIL)
               (COMMONNAME STRING :CIM-NAME "CommonName" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "A CommonName is a (possibly ambiguous) name by which the Person is commonly known in some limited scope (such as an organization) and conforms to the naming conventions of the country or culture with which it is associated."))
                :INITFORM NIL)
               (EMPLOYEENUMBER STRING :CIM-NAME "EmployeeNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on inetOrgPerson, the EmployeeNumber property specifies a numeric or an alphanumeric identifier assigned to a person."))
                :INITFORM NIL)
               (EMPLOYEETYPE STRING :CIM-NAME "EmployeeType" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on inetOrgPerson, the EmployeeType property is used to identify the employer to employee relationship. Typical values used may include 'Contractor', 'Employee', 'Intern', 'Temp', 'External', and 'Unknown' but any value may be used."))
                :INITFORM NIL)
               (FACSIMILETELEPHONENUMBER STRING :CIM-NAME
                "FacsimileTelephoneNumber" :QUALIFIERS
                ((:DESCRIPTION "The person's facsimile telephone number."))
                :INITFORM NIL)
               (HOMEPHONE STRING :CIM-NAME "HomePhone" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on RFC1274, the HomePhone property specifies a home telephone number for the person, e.g. + 44 582 10101).")
                 (:MAX-LEN "32"))
                :INITFORM NIL)
               (JPEGPHOTO STRING :CIM-NAME "JPEGPhoto" :QUALIFIERS
                ((:DESCRIPTION
                  "From inetOrgPerson, the JPEGPhoto property values may be used for one or more images of a person using the JPEG File Interchange Format."))
                :INITFORM NIL)
               (MANAGER STRING :CIM-NAME "Manager" :QUALIFIERS
                ((:DESCRIPTION
                  "The person's manager within the organization. In the case of an LDAP-derived instance, the Manager property value may contain the distinguished name of the Manager."))
                :INITFORM NIL)
               (MOBILE STRING :CIM-NAME "Mobile" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on RFC1274, the Mobile phone property specifies a mobile telephone number for the person, e.g. + 44 582 10101).")
                 (:MAX-LEN "32"))
                :INITFORM NIL)
               (OU STRING :CIM-NAME "OU" :QUALIFIERS
                ((:DESCRIPTION
                  "The name of an organizational unit related to the person."))
                :INITFORM NIL)
               (PAGER STRING :CIM-NAME "Pager" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on RFC1274, the Pager property specifies a pager telephone number for the person, e.g. + 44 582 10101).")
                 (:MAX-LEN "32"))
                :INITFORM NIL)
               (PREFERREDLANGUAGE STRING :CIM-NAME "PreferredLanguage"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Based on inetOrgPerson, the person's preferred written or spoken language."))
                :INITFORM NIL)
               (SECRETARY STRING :CIM-NAME "Secretary" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on RFC1274, the Secretary property may be used to specify a secretary for the person. In the case of an LDAP-derived object instance, the value may be a distinguished name."))
                :INITFORM NIL)
               (TITLE STRING :CIM-NAME "Title" :QUALIFIERS
                ((:DESCRIPTION
                  "The Title property may be used to specify the person's designated position or function of the object within an organization, e.g., Manager, Vice-President, etc."))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
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
               (GIVENNAME STRING :CIM-NAME "GivenName" :QUALIFIERS
                ((:DESCRIPTION
                  "The Given Name property is used for the part of a person's name that is not their surname nor their middle name (i.e., their first name)."))
                :INITFORM NIL)
               (SURNAME STRING :CIM-NAME "Surname" :QUALIFIERS
                ((:DESCRIPTION
                  "The Surname property specifies the linguistic construct that normally is inherited by an individual from the individual's parent or assumed by marriage, and by which the individual is commonly known."))
                :INITFORM NIL)
               (MAIL STRING :CIM-NAME "Mail" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on RFC1274, the mail box addresses for the person as defined in RFC822."))
                :INITFORM NIL)
               (USERID STRING :CIM-NAME "UserID" :QUALIFIERS
                ((:DESCRIPTION
                  "A User ID property. Based on RFC1274, the property may be used to specify a computer system login name."))
                :INITFORM NIL)
               (LOCALITYNAME STRING :CIM-NAME "LocalityName" :QUALIFIERS
                ((:DESCRIPTION
                  "This property contains the name of a locality, such as a city, county or other geographic region."))
                :INITFORM NIL)
               (STATEORPROVINCE STRING :CIM-NAME "StateOrProvince" :QUALIFIERS
                ((:DESCRIPTION
                  "The State or Province name property specifies a state or province."))
                :INITFORM NIL)
               (POSTALCODE STRING :CIM-NAME "PostalCode" :QUALIFIERS
                ((:DESCRIPTION
                  "The PostalCode property specifies the postal code of the organization. If this value is present it will be part of the object's postal address.")
                 (:MAX-LEN "40"))
                :INITFORM NIL)
               (TELEPHONENUMBER STRING :CIM-NAME "TelephoneNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "The TelephoneNumber property specifies a telephone number of the organization, e.g. + 44 582 10101).")
                 (:MAX-LEN "32"))
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
               (HOMEPOSTALADDRESS (ARRAY STRING) :CIM-NAME "HomePostalAddress"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The HomePostalAddress property values specify the home address information required for the physical delivery of postal messages by the postal authority."))
                :INITFORM NIL)
               (POSTALADDRESS (ARRAY STRING) :CIM-NAME "PostalAddress"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The PostalAddress property values specify the address information required for the physical delivery of postal messages by the postal authority to the person."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_Person")
              (:QUALIFIERS (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::Org")
               (:DESCRIPTION
                "The Person class is used to represent people, and holds their white and yellow pages data. The class is defined so as to incorporate commonly-used LDAP attributes to permit implementations to easily derive this information from LDAP-accessible directories. This class's properties are a subset of a related class, OtherPersonInformation, which defines all the group properties and in array form for directory compatibility.")))