
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PhysicalAssetCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PHYSICALASSETCAPABILITIES (CIM_CAPABILITIES)
              ((FRUINFOSUPPORTED BOOLEAN :CIM-NAME "FRUInfoSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether the PartNumber, Serial Number, Model, Manufacturer, and SKU properties of PhysicalElement are non-null, non-blank values, and the availability of the complete FRU information.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PhysicalElement.PartNumber"
                   "CIM_PhysicalElement.SerialNumber"
                   "CIM_PhysicalElement.Model"
                   "CIM_PhysicalElement.Manufacturer"
                   "CIM_PhysicalElement.SKU")))
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "The user friendly name for this instance of Capabilities. In addition, the user friendly name can be used as a index property for a search of query. (Note: Name does not have to be unique within a namespace.)"))
                :INITFORM NIL)
               (CAPTION STRING :CIM-NAME "Caption" :QUALIFIERS
                ((:DESCRIPTION
                  "The Caption property is a short textual description (one- line string) of the object.")
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION
                  "The Description property provides a textual description of the object."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_PhysicalAssetCapabilities")
              (:QUALIFIERS (:VERSION "2.18.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Misc")
               (:DESCRIPTION
                "PhysicalAssetCapabilities describes the capabilities of representing the FRU related information of the associated instance of the CIM_PhysicalElement subclass.")))