
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DeviceSharingCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DEVICESHARINGCAPABILITIES (CIM_CAPABILITIES)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
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
                :INITFORM NIL)
               (SUPPORTEDACCESSMODES (ARRAY UINT16) :CIM-NAME
                "SupportedAccessModes" :QUALIFIERS
                ((:DESCRIPTION
                  "SupportedAccess describes the types of shared access that are supported for the referenced LogicalDevice.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "Other" "No Access" "Exclusive Access"
                   "Shared Read" "Shared Full" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SharingDependency.CurrentAccess"
                   "CIM_DeviceSharingCapabilities.OtherSupportedAccessModes")))
                :INITFORM NIL)
               (OTHERSUPPORTEDACCESSMODES (ARRAY STRING) :CIM-NAME
                "OtherSupportedAccessModes" :QUALIFIERS
                ((:DESCRIPTION
                  "A string value describing SupportedAccess when it has a value of \"Other\".")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DeviceSharingCapabilities.SupportedAccessModes")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_DeviceSharingCapabilities")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Device::SCSI")
               (:DESCRIPTION
                "A class derived from Capabilities that describes the type of access supported for a shared device.")))