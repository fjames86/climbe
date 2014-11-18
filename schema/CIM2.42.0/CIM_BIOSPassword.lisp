
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BIOSPassword.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BIOSPASSWORD (CIM_BIOSATTRIBUTE)
              ((MINLENGTH UINT64 :CIM-NAME "MinLength" :QUALIFIERS
                ((:DESCRIPTION
                  "This property specifies the minimum string length allowed when modifying this BIOS attribute. A value of NULL SHALL be defined as zero.")
                 (:MODEL-CORRESPONDENCE ("CIM_BIOSPassword.MaxLength")))
                :INITFORM NIL)
               (MAXLENGTH UINT64 :CIM-NAME "MaxLength" :QUALIFIERS
                ((:DESCRIPTION
                  "This property specifies the maximum string length allowed when modifying this BIOS attribute. A value of NULL defines the maximum length is unknown. A value of 0 defines the maximum length as 18446744073709551615, the limitation of the property definition as uint64.")
                 (:MODEL-CORRESPONDENCE ("CIM_BIOSPassword.MinLength")))
                :INITFORM NIL)
               (PASSWORDENCODING UINT32 :CIM-NAME "PasswordEncoding"
                :QUALIFIERS
                ((:DESCRIPTION
                  "PasswordEncoding specifies encoding tag used to denote the format the password string was createdor set with \"kbd\" denotes a string in hexadecimal format containing keyboard scan code input. An example of a password structured in this format would be \"321539191E1F1F11181320\", which is the representation of \"my password\" in US English keyboard scan codes. \"ascii\" denotes clear text that shall comply with the ASCII character set. Character encodings from \" \" (decimal 32) to \"~\" (decimal 126) are supported. An example would be \"my password\".\"pin\" denotes that only numeric input in ASCII text is allowed for the password instance. An example would be \"1234\".")
                 (:VALUE-MAP ("2" "3" "4" "5" ".." "65536..4294967295"))
                 (:VALUES
                  ("ascii" "kbd" "pin" "Unicode" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BIOSServiceCapabilities.SupportedPasswordEncodings")))
                :INITFORM NIL)
               (ISSET BOOLEAN :CIM-NAME "IsSet" :QUALIFIERS
                ((:DESCRIPTION
                  "This property returns TRUE if the current password instance is non-blank and FALSE otherwise. This property is provided because the Value property is always defined as NULL for password instances."))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following &apos;preferred&apos; algorithm: <OrgID>:<LocalID>Where <OrgID> and <LocalID> are separated by a colon &apos;:&apos;, and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (&apos;:&apos;). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. <LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above &apos;preferred&apos; algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. For DMTF defined instances, the &apos;preferred&apos; algorithm MUST be used with the <OrgID> set to &apos;CIM&apos;."))
                :INITFORM NIL)
               (ATTRIBUTENAME STRING :CIM-NAME "AttributeName" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "A string identifying the structured element name for a BIOS attribute using the format \"<OrgID>:<identifier>\" in which <OrgID>, does contain a colon (\":\"). The value of <OrgID> is a copyrighted, trademarked or otherwise unique name that is owned by the entity defining the <identifier>, or is a registered ID that is assigned to the entity by a recognized global authority. For DMTF defined identifiers, the <OrgID> is set to 'DMTF' and the <identifier> is specified in the BIOS Attribute Registry."))
                :INITFORM NIL)
               (ISORDEREDLIST BOOLEAN :CIM-NAME "IsOrderedList" :QUALIFIERS
                ((:DESCRIPTION
                  "This property specifies that the Attribute represented makes up an ordered selection list with elements in the CurrentValue array. The element zero shall be first or least numbered element and incrementally increase to the end of the array. The least or first element may represent the highest priority in the ordered list.")
                 (:MODEL-CORRESPONDENCE ("CIM_BIOSAttribute.CurrentValue")))
                :INITFORM NIL)
               (ISREADONLY BOOLEAN :CIM-NAME "IsReadOnly" :QUALIFIERS
                ((:DESCRIPTION
                  "This property specifies if the underlying system BIOS or BIOSService will not allow the Attribute to be modified through calls tothe methods CIM_BIOSService.SetBIOSAttribute or CIM_BIOSService.SetBIOSDefaults. This does not mean the Attribute can not be modified through other means. Only that the CIM interfaceis not capable of making a change"))
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
               (CURRENTVALUE (ARRAY STRING) :CIM-NAME "CurrentValue"
                :QUALIFIERS
                ((:OVERRIDE "CurrentValue")
                 (:DESCRIPTION "CurrentValue shall return an empty array.")
                 :REQUIRED)
                :INITFORM NIL)
               (PENDINGVALUE (ARRAY STRING) :CIM-NAME "PendingValue"
                :QUALIFIERS
                (:REQUIRED (:OVERRIDE "PendingValue")
                 (:DESCRIPTION "PendingValue shall return an empty array."))
                :INITFORM NIL)
               (DEFAULTVALUE (ARRAY STRING) :CIM-NAME "DefaultValue"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An array of strings representing the default value or values of the BIOS Attribute."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_BIOSPassword")
              (:QUALIFIERS (:VERSION "2.27.0")
               (:UML-PACKAGE-PATH "CIM::System::BIOS")
               (:DESCRIPTION
                "The CIM_BIOSPassword object may be used to instantiate detail information about manageable BIOS-based passwords.")))