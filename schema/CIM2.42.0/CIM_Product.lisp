
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Product.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRODUCT (CIM_MANAGEDELEMENT)
              ((NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:KEY (:DESCRIPTION "Commonly used Product name.")
                 (:MAX-LEN "256")
                 (:MAPPING-STRINGS ("MIF.DMTF|ComponentID|001.2"))
                 (:MODEL-CORRESPONDENCE ("PRS_Product.ProductName")))
                :INITFORM NIL)
               (IDENTIFYINGNUMBER STRING :CIM-NAME "IdentifyingNumber"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "Product identification such as a serial number on software, a die number on a hardware chip, or (for non-commercial Products) a project number.")
                 (:MAX-LEN "64")
                 (:MAPPING-STRINGS ("MIF.DMTF|ComponentID|001.4")))
                :INITFORM NIL)
               (VENDOR STRING :CIM-NAME "Vendor" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The name of the Product's supplier, or entity selling the Product (the manufacturer, reseller, OEM, etc.). Corresponds to the Vendor property in the Product object in the DMTF Solution Exchange Standard.")
                 (:MAX-LEN "256")
                 (:MAPPING-STRINGS ("MIF.DMTF|ComponentID|001.1"))
                 (:MODEL-CORRESPONDENCE ("PRS_Product.Vendor")))
                :INITFORM NIL)
               (VERSION STRING :CIM-NAME "Version" :QUALIFIERS
                (:KEY (:DESCRIPTION "Product version information.")
                 (:MAX-LEN "64")
                 (:MAPPING-STRINGS ("MIF.DMTF|ComponentID|001.3"))
                 (:MODEL-CORRESPONDENCE ("PRS_Product.Version")))
                :INITFORM NIL)
               (SKUNUMBER STRING :CIM-NAME "SKUNumber" :QUALIFIERS
                ((:DESCRIPTION "Product SKU (stock keeping unit) information.")
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (WARRANTYSTARTDATE DATETIME :CIM-NAME "WarrantyStartDate"
                :QUALIFIERS
                ((:DESCRIPTION
                  "If this Product is under warranty, the start date of the warranty.")
                 (:MAPPING-STRINGS ("MIF.DMTF|FRU|002.9"))
                 (:MODEL-CORRESPONDENCE ("CIM_Product.WarrantyDuration")))
                :INITFORM NIL)
               (WARRANTYDURATION UINT32 :CIM-NAME "WarrantyDuration"
                :QUALIFIERS
                ((:DESCRIPTION
                  "If this Product is under warranty, the duration of the warranty in days.")
                 (NIL "Days") (:MAPPING-STRINGS ("MIF.DMTF|FRU|002.10"))
                 (:MODEL-CORRESPONDENCE ("CIM_Product.WarrantyStartDate"))
                 (:P-UNIT "day"))
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
              (:CIM-NAME "CIM_Product")
              (:QUALIFIERS (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Core::ProductFRU")
               (:DESCRIPTION
                "CIM_Product is a concrete class that aggregates PhysicalElements, software (SoftwareIdentity and SoftwareFeatures), Services and/or other Products, and is acquired as a unit. Acquisition implies an agreement between supplier and consumer which may have implications to Product licensing, support and warranty. Non-commercial (e.g., in-house developed Products) should also be identified as an instance of CIM_Product. 
Note that software is handled a bit differently in the list of aggregated entities, above. This is because software can be viewed as a tangible asset (similar to PhysicalElements) AND/ OR as a set of features that make up a Product and are deployed. These are two different concepts, usually managed by different units in a business' organization. When software 'features' are described, the CIM_SoftwareFeature class from the Application Model is instantiated (where Features are Weak to/scoped by a Product). When a specific piece of software is acquired and perhaps warrantied as part of a Product, this is addressed by the class, SoftwareIdentity.")))