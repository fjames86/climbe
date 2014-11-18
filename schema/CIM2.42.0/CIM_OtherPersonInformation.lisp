
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OtherPersonInformation.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_OTHERPERSONINFORMATION (CIM_MANAGEDELEMENT)
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
               (EMPLOYEENUMBER STRING :CIM-NAME "EmployeeNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on inetOrgPerson, the EmployeeNumber property specifies a numeric or an alphanumeric identifier assigned to a person."))
                :INITFORM NIL)
               (PREFERREDDELIVERYMETHOD STRING :CIM-NAME
                "PreferredDeliveryMethod" :QUALIFIERS
                ((:DESCRIPTION
                  "The PreferredDeliveryMethod property specifies the preferred method to be used for contacting the person."))
                :INITFORM NIL)
               (PREFERREDLANGUAGE STRING :CIM-NAME "PreferredLanguage"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Based on inetOrgPerson, the person's preferred written or spoken language."))
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
               (AUDIO (ARRAY STRING) :CIM-NAME "Audio" :QUALIFIERS
                ((:DESCRIPTION
                  "The Audio property may be used to store an audio clip of the person.")
                 :OCTET-STRING)
                :INITFORM NIL)
               (BUSINESSCATEGORY (ARRAY STRING) :CIM-NAME "BusinessCategory"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property describes the kind of business performed by an organization.")
                 (:MAX-LEN "128"))
                :INITFORM NIL)
               (CARLICENSE (ARRAY STRING) :CIM-NAME "CarLicense" :QUALIFIERS
                ((:DESCRIPTION
                  "The CarLicense property is used to record the values of the vehicle license or registration plate associated with an individual.")
                 (:MAX-LEN "128"))
                :INITFORM NIL)
               (COMMONNAME (ARRAY STRING) :CIM-NAME "CommonName" :QUALIFIERS
                ((:DESCRIPTION
                  "A CommonName is a (possibly ambiguous) name by which the role is commonly known in some limited scope (such as an organization) and conforms to the naming conventions of the country or culture with which it is associated."))
                :INITFORM NIL)
               (COUNTRYNAME (ARRAY STRING) :CIM-NAME "CountryName" :QUALIFIERS
                ((:DESCRIPTION
                  "The CountryName property specifies a country as defined in ISO 3166."))
                :INITFORM NIL)
               (DEPARTMENTNUMBER (ARRAY STRING) :CIM-NAME "DepartmentNumber"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Based on inetOrgPerson, the DepartmentNumber is a code for department to which a person belongs. This can be strictly numeric (e.g., 1234) or alphanumeric (e.g., ABC/123)."))
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
                  "This property is used for the organization's telegram service.")
                 (:MAX-LEN "128"))
                :INITFORM NIL)
               (DISPLAYNAME (ARRAY STRING) :CIM-NAME "DisplayName" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on inetOrgPerson, the DisplayName property values are used when displaying an entry."))
                :INITFORM NIL)
               (EMPLOYEETYPE (ARRAY STRING) :CIM-NAME "EmployeeType"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Based on inetOrgPerson, the EmployeeType property is used to identify the employer to employee relationship. Typical values used may include 'Contractor', 'Employee', 'Intern', 'Temp', 'External', and 'Unknown' but any value may be used."))
                :INITFORM NIL)
               (FACSIMILETELEPHONENUMBER (ARRAY STRING) :CIM-NAME
                "FacsimileTelephoneNumber" :QUALIFIERS
                ((:DESCRIPTION "The person's facsimile telephone number."))
                :INITFORM NIL)
               (GENERATIONQUALIFIER (ARRAY STRING) :CIM-NAME
                "GenerationQualifier" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on liPerson, the GenerationQualifier property specifies a name qualifier that represents the person's generation (e.g., JR., III, etc.)."))
                :INITFORM NIL)
               (GIVENNAME (ARRAY STRING) :CIM-NAME "GivenName" :QUALIFIERS
                ((:DESCRIPTION
                  "The GivenName property is used for the part of a person's name that is not their surname nor their middle name."))
                :INITFORM NIL)
               (HOMEFAX (ARRAY STRING) :CIM-NAME "HomeFax" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on liPerson, the HomeFax property specifies the person's facsimile telephone number at home."))
                :INITFORM NIL)
               (HOMEPHONE (ARRAY STRING) :CIM-NAME "HomePhone" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on RFC1274, the HomePhone property specifies a home telephone number for the person, e.g. + 44 582 10101).")
                 (:MAX-LEN "32"))
                :INITFORM NIL)
               (HOMEPOSTALADDRESS (ARRAY STRING) :CIM-NAME "HomePostalAddress"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The HomePostalAddress property values specify the home address information required for the physical delivery of postal messages by the postal authority."))
                :INITFORM NIL)
               (INITIALS (ARRAY STRING) :CIM-NAME "Initials" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on inetOrgPerson, the Initials property specifies the first letters of the person's name, typically the property values will exclude the first letter of the surname."))
                :INITFORM NIL)
               (INTERNATIONALISDNNUMBER (ARRAY STRING) :CIM-NAME
                "InternationaliSDNNumber" :QUALIFIERS
                ((:DESCRIPTION "The person's International ISDN number.")
                 (:MAX-LEN "16"))
                :INITFORM NIL)
               (JPEGPHOTO (ARRAY STRING) :CIM-NAME "JPEGPhoto" :QUALIFIERS
                ((:DESCRIPTION
                  "From inetOrgPerson, the JPEG Photo property values may be used for one or more images of a person using the JPEG File Interchange Format."))
                :INITFORM NIL)
               (LABELEDURI (ARRAY STRING) :CIM-NAME "LabeledURI" :QUALIFIERS
                ((:DESCRIPTION
                  "Uniform Resource Identifier with optional label as defined in RFC2079."))
                :INITFORM NIL)
               (LOCALITYNAME (ARRAY STRING) :CIM-NAME "LocalityName"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property contains the name of a locality, such as a city, county or other geographic region."))
                :INITFORM NIL)
               (MAIL (ARRAY STRING) :CIM-NAME "Mail" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on RFC1274, the mail box addresses for the person as defined in RFC822."))
                :INITFORM NIL)
               (MANAGER (ARRAY STRING) :CIM-NAME "Manager" :QUALIFIERS
                ((:DESCRIPTION
                  "The person's manager within the organization. In the case of an LDAP-derived instance, the Manager property value may contain the distinguishedName of the Manager."))
                :INITFORM NIL)
               (MIDDLENAME (ARRAY STRING) :CIM-NAME "MiddleName" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on liPerson, the middle name of the person."))
                :INITFORM NIL)
               (MOBILE (ARRAY STRING) :CIM-NAME "Mobile" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on RFC1274, the Mobile phone property specifies a mobile telephone number for the person, e.g. + 44 582 10101).")
                 (:MAX-LEN "32"))
                :INITFORM NIL)
               (ORGANIZATIONNAME (ARRAY STRING) :CIM-NAME "OrganizationName"
                :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION "The name of the person's organization."))
                :INITFORM NIL)
               (ORGANIZATIONALSTATUS (ARRAY STRING) :CIM-NAME
                "OrganizationalStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on RFC1274, the OrganizationalStatus property specifies a category by which a person is often referred to within an organization. Examples of usage in academia might include undergraduate student, researcher, lecturer, etc."))
                :INITFORM NIL)
               (OTHERMAILBOX (ARRAY STRING) :CIM-NAME "OtherMailbox"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Based on RFC1274, this property may be used for electronic mail box addresses other than RFC822 and X.400."))
                :INITFORM NIL)
               (OU (ARRAY STRING) :CIM-NAME "OU" :QUALIFIERS
                ((:DESCRIPTION
                  "The name of an organizational unit related to the person."))
                :INITFORM NIL)
               (PAGER (ARRAY STRING) :CIM-NAME "Pager" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on RFC1274, the Pager property specifies a pager telephone number for the person, e.g. + 44 582 10101).")
                 (:MAX-LEN "32"))
                :INITFORM NIL)
               (PERSONALTITLE (ARRAY STRING) :CIM-NAME "PersonalTitle"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Based on liPerson, the PersonalTitle property may be used to specify the person's personal title such as Mr., Ms., Dr., Prof. etc."))
                :INITFORM NIL)
               (PHOTO (ARRAY STRING) :CIM-NAME "Photo" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on RFC1274, the Photo property may be used to specify a photograph for the person encoded in G3 fax as explained in recommendation T.4, with an ASN.1 wrapper to make it compatible with an X.400 BodyPart as defined in X.420.")
                 :OCTET-STRING)
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
                  "The PostalAddress property values specify the address information required for the physical delivery of postal messages by the postal authority to the person."))
                :INITFORM NIL)
               (POSTALCODE (ARRAY STRING) :CIM-NAME "PostalCode" :QUALIFIERS
                ((:DESCRIPTION
                  "The PostalCode property specifies the postal code of the organization. If this value is present, it will be part of the object's postal address.")
                 (:MAX-LEN "40"))
                :INITFORM NIL)
               (POSTOFFICEBOX (ARRAY STRING) :CIM-NAME "PostOfficeBox"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The PostOfficeBox property specifies the PO box by which the person will receive physical postal delivery. If present, the property value is part of the object's postal address.")
                 (:MAX-LEN "40"))
                :INITFORM NIL)
               (REGISTEREDADDRESS (ARRAY STRING) :CIM-NAME "RegisteredAddress"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property specifies a postal address suitable for receipt of telegrams or expedited documents, where it is necessary to have the recipient accept delivery."))
                :INITFORM NIL)
               (ROOMNUMBER (ARRAY STRING) :CIM-NAME "RoomNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on RFC1274, the RoomNumber property specifies the room number for the person."))
                :INITFORM NIL)
               (SECRETARY (ARRAY STRING) :CIM-NAME "Secretary" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on RFC1274, the Secretary property may be used to specify a secretary for the person. In the case of an LDAP-derived object instance, the value may be a distinguishedName."))
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
               (SURNAME (ARRAY STRING) :CIM-NAME "Surname" :QUALIFIERS
                ((:DESCRIPTION
                  "The Surname property specifies the linguistic construct that normally is inherited by an individual from the individual's parent or assumed by marriage, and by which the individual is commonly known."))
                :INITFORM NIL)
               (TELEPHONENUMBER (ARRAY STRING) :CIM-NAME "TelephoneNumber"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The TelephoneNumber property specifies a telephone number of the organization, e.g. + 44 582 10101).")
                 (:MAX-LEN "32"))
                :INITFORM NIL)
               (TELETEXTERMINALIDENTIFIER (ARRAY STRING) :CIM-NAME
                "TeletexTerminalIdentifier" :QUALIFIERS
                ((:DESCRIPTION
                  "The TeletexTerminalIdentifier property specifies the Teletex terminal identifier (and, optionally, parameters) for a teletex terminal associated with the organization."))
                :INITFORM NIL)
               (TELEXNUMBER (ARRAY STRING) :CIM-NAME "TelexNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "The TelexNumber property specifies the telex number, country code, and answerback code of a telex terminal for the organization."))
                :INITFORM NIL)
               (THUMBNAILLOGO (ARRAY STRING) :CIM-NAME "ThumbnailLogo"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A small image of the person's organization logo.")
                 :OCTET-STRING)
                :INITFORM NIL)
               (THUMBNAILPHOTO (ARRAY STRING) :CIM-NAME "ThumbnailPhoto"
                :QUALIFIERS
                ((:DESCRIPTION "A small image of the person.") :OCTET-STRING)
                :INITFORM NIL)
               (TITLE (ARRAY STRING) :CIM-NAME "Title" :QUALIFIERS
                ((:DESCRIPTION
                  "The Title property may be used to specify the person's designated position or function of the object within an organization, e.g., Manager, Vice-President, etc."))
                :INITFORM NIL)
               (USERID (ARRAY STRING) :CIM-NAME "UserID" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on RFC1274, the UserID property may be used to specify a computer system login name."))
                :INITFORM NIL)
               (UNIQUEIDENTIFIER (ARRAY STRING) :CIM-NAME "UniqueIdentifier"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A unique identifier that may be assigned in an environment to differentiate between uses of a given named person instance."))
                :INITFORM NIL)
               (USERCERTIFICATE (ARRAY STRING) :CIM-NAME "UserCertificate"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Based on inetOrgPerson and for directory compatibility, the UserCertificate property may be used to specify a public key certificate for the person.")
                 :OCTET-STRING)
                :INITFORM NIL)
               (USERPASSWORD (ARRAY STRING) :CIM-NAME "UserPassword"
                :QUALIFIERS
                ((:DESCRIPTION
                  "In the case of an LDAP-derived instance, the UserPassword property may contain an encrypted password used to access the person's resources in a directory.")
                 :OCTET-STRING)
                :INITFORM NIL)
               (USERPKCS12 (ARRAY STRING) :CIM-NAME "UserPKCS12" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on inetOrgPerson and for directory compatibility, the UserPKCS12 property value may be used to provide a format for exchange of personal identity information. The property values are PFX PDUs stored as Octetstrings.")
                 :OCTET-STRING)
                :INITFORM NIL)
               (USERSMIMECERTIFICATE (ARRAY STRING) :CIM-NAME
                "UserSMIMECertificate" :QUALIFIERS
                ((:DESCRIPTION
                  "Based on inetOrgPerson, the User S/MIME Certificate property may be used to specify the person's an S/MIME (RFC1847) signed message with a zero-length body. It contains the entire certificate chain and the signed attribute that describes their algorithm capabilities. If available, this property is preferred over the UserCertificate property for S/MIME applications.")
                 :OCTET-STRING)
                :INITFORM NIL)
               (X121ADDRESS (ARRAY STRING) :CIM-NAME "X121Address" :QUALIFIERS
                ((:DESCRIPTION "An X.121 address for the organization.")
                 (:MAX-LEN "15"))
                :INITFORM NIL)
               (X500UNIQUEIDENTIFIER (ARRAY STRING) :CIM-NAME
                "X500UniqueIdentifier" :QUALIFIERS
                ((:DESCRIPTION
                  "An X.500 specified unique identifier that may be assigned in an environment to differentiate between uses of a given named person object instance.")
                 :OCTET-STRING)
                :INITFORM NIL))
              (:CIM-NAME "CIM_OtherPersonInformation")
              (:QUALIFIERS (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::User::Org")
               (:DESCRIPTION
                "The OtherPersonInformation class is used to provide additional information about an associated Person instance. This class is defined so as to incorporate commonly-used LDAP attributes to permit implementations to easily derive this information from LDAP-accessible directories.")))