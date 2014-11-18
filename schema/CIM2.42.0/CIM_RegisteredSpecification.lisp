
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RegisteredSpecification.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_REGISTEREDSPECIFICATION (CIM_MANAGEDELEMENT)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID shall be constructed using the following 'preferred' algorithm: 
: 
Where and are separated by a colon ':', and where shall include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority. (This is similar to the _ structure of Schema class names.) In addition, to ensure uniqueness, shall not contain a colon (':'). The first colon to appear in InstanceID shall appear between and . is chosen by the organizational entity and should not be re-used to identify different underlying (real-world) elements. 
For DMTF defined instances, shall be set to 'CIM'."))
                :INITFORM NIL)
               (SPECIFICATIONTYPE UINT16 :CIM-NAME "SpecificationType"
                :QUALIFIERS
                ((:DESCRIPTION "The type of specification.")
                 (:VALUE-MAP ("1" "2" "3" "4" ".."))
                 (:VALUES
                  ("Other" "Profile" "Initiative Wrapper" "Mapping"
                   "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RegisteredSpecification.OtherSpecificationType")))
                :INITFORM NIL)
               (OTHERSPECIFICATIONTYPE STRING :CIM-NAME
                "OtherSpecificationType" :QUALIFIERS
                ((:DESCRIPTION
                  "OtherSpecificationType shall be a a free-form string providing a description of the specification type if 1, \"Other\" is specified for the SpecificationType.")
                 (:MAX-LEN "256")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RegisteredSpecification.SpecificationType")))
                :INITFORM NIL)
               (REGISTEREDORGANIZATION UINT16 :CIM-NAME
                "RegisteredOrganization" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The organization that defines this specification. 
\"The Green Grid\" identifies \"The Green Grid Association\"")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "20" "21" ".."))
                 (:VALUES
                  ("Other" "DMTF" "CompTIA" "Consortium for Service Innovation"
                   "FAST" "GGF" "INTAP" "itSMF" "NAC"
                   "Northwest Energy Efficiency Alliance" "SNIA" "TM Forum"
                   "The Open Group" "ANSI" "IEEE" "IETF" "INCITS" "ISO" "W3C"
                   "OGF" "The Green Grid" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RegisteredSpecification.OtherRegisteredOrganization")))
                :INITFORM NIL)
               (OTHERREGISTEREDORGANIZATION STRING :CIM-NAME
                "OtherRegisteredOrganization" :QUALIFIERS
                ((:DESCRIPTION
                  "OtherRegisteredOrganization shall be a a free-form string providing a description of the organization if 1, \"Other\" is specified for the RegisteredOrganization.")
                 (:MAX-LEN "256")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RegisteredSpecification.RegisteredOrganization")))
                :INITFORM NIL)
               (REGISTEREDNAME STRING :CIM-NAME "RegisteredName" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The name of this registered specification. Since multiple versions can exist for the same RegisteredName, the combination of RegisteredName, RegisteredOrganization, and RegisteredVersion shall uniquely identify the registered specification within the scope of the organization. 
The value of this property shall correspond to the name given to the set of versioned constraints by a specification or standard. The value does not identify the name of the document or publishing media, unless it happens to be the same as the name given to the versioned constraints.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (REGISTEREDVERSION STRING :CIM-NAME "RegisteredVersion"
                :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The version describing the creation or last modificationof the specification. The string representing the version shall be in the form: 
M + \".\" + N + \".\" + U 
Where: 
M - The major version (in numeric form). 
N - The minor version (in numeric form). 
U - The update (e.g. errata, patch, ..., in numeric form)."))
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
               (ADVERTISETYPES (ARRAY UINT16) :CIM-NAME "AdvertiseTypes"
                :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "This property identifies the requested network advertisement for specification information. It is used by the advertising services of the WBEM infrastructure to determine what should be advertised, via what mechanisms. The property is an array so that the specification may be advertised using several mechanisms. If an array entry has a value of 2 (Not Advertised), this shall be the only array entry.")
                 (:VALUE-MAP ("1" "2" "3" "4"))
                 (:VALUES ("Other" "Not Advertised" "SLP" "WS-Identify"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RegisteredSpecification.AdvertiseTypeDescriptions")))
                :INITFORM NIL)
               (ADVERTISETYPEDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "AdvertiseTypeDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string identifying the requested network advertisement for specification information for cases where the predefined values in AdvertiseTypes are not sufficient. Each entry in this array corresponds to the entry in the AdvertiseTypes array at the same index, and the two arrays shall have the same number of entries. A non-Null value shall be provided for each array entry that corresponds to an AdvertiseTypes entry with a value of 1 (Other). Other array entries should be Null.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_RegisteredSpecification.AdvertiseTypes")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_RegisteredSpecification")
              (:QUALIFIERS (:VERSION "2.39.0")
               (:UML-PACKAGE-PATH "CIM::Interop")
               (:DESCRIPTION
                "A RegisteredSpecification is used to advertise the implementation of a specification within a WBEM server. The specification may be authored by the DMTF or another standards organization. In this context, specification is used to describe a named and versioned set of constraints. There may be a one to one correspondence between the set of constraints and the document in which they are published. An example of a one to one correspondence is the mechanism used by the DMTF to publish its profiles. An example of one to many documents to specifications is an SMI-S book published by SNIA.")))