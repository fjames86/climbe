
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OpaqueManagementDataCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_OPAQUEMANAGEMENTDATACAPABILITIES
              (CIM_ENABLEDLOGICALELEMENTCAPABILITIES)
              ((MAXAVAILABLESTORAGE UINT64 :CIM-NAME "MaxAvailableStorage"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The maximum number of bytes of opaque management data storage managed by the associated CIM_OpaqueManagementDataService, and hence the maximum value of the AvailableStorage property in the associated CIM_OpaqueManagementDataService.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_OpaqueManagementDataService.AvailableStorage"))
                 (:P-UNIT "byte"))
                :INITFORM NIL)
               (MAXREADLENGTH UINT64 :CIM-NAME "MaxReadLength" :QUALIFIERS
                ((:DESCRIPTION
                  "MaxReadLength indicates the maximum value that the service supports in the Length parameter of the ReadOpaqueManagementData method. Larger extents can be read by successively invoking ReadOpaqueManagementData on chunks of the data and reassembling them in the management client. When this is done, the LockOpaqueManagementData method should be used to prevent modification of the data by other clients between successive reads.")
                 (:P-UNIT "byte"))
                :INITFORM NIL)
               (MAXWRITELENGTH UINT64 :CIM-NAME "MaxWriteLength" :QUALIFIERS
                ((:DESCRIPTION
                  "MaxWriteLength indicates the maximum value that the service supports in the Length parameter of the WriteOpaqueManagementData method. Larger extents can be written by successively invoking WriteOpaqueManagementData on chunks of the data and reassembling them in the management client. When this is done, the LockOpaqueManagementData method should be used to prevent modification of the data by other clients between successive writes.")
                 (:P-UNIT "byte"))
                :INITFORM NIL)
               (TRUNCATIONSUPPORTED BOOLEAN :CIM-NAME "TruncationSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "TruncationSupported indicates whether the associated CIM_OpaqueManagementDataService allows a client to truncate the data in a CIM_OpaqueManagementData instance by reducing the value of its DataSize property.
If TruncationSupported = true, then the Service shall support reduction of the value of CIM_OpaqueManagementData.DataSize
.If TruncationSupported = false or is null, then the Service shall not support reduction of the value of CIM_OpaqueManagementData.DataSize"))
                :INITFORM "false")
               (MAXINSTANCESSUPPORTED UINT16 :CIM-NAME "MaxInstancesSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "MaxInstancesSupported shall indicate the maximum number of opaque management data instances that may exist within the scope of the CIM_OpaqueManagementDataService and managed by the associated instance of the CIM_OpaqueManagementDataService. A value of zero shall indicate that the maximum number of instances is unknown or that the maximum number of instances is not enforced."))
                :INITFORM "0")
               (ELEMENTNAMEEDITSUPPORTED BOOLEAN :CIM-NAME
                "ElementNameEditSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating whether the ElementName can be modified.")
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.INCITS-T11|SWAPI_UNIT_CONFIG_CAPS_T|EditName"))
                 (:MODEL-CORRESPONDENCE ("CIM_ManagedElement.ElementName")))
                :INITFORM NIL)
               (MAXELEMENTNAMELEN UINT16 :CIM-NAME "MaxElementNameLen"
                :QUALIFIERS
                ((:DESCRIPTION "Maximum supported ElementName length.")
                 (:MAX-VALUE "256")
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.INCITS-T11|SWAPI_UNIT_CONFIG_CAPS_T|MaxNameChars"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_FCSwitchCapabilities.ElementNameEditSupported"
                   "CIM_EnabledLogicalElementCapabilities.ElementNameMask")))
                :INITFORM NIL)
               (ELEMENTNAMEMASK STRING :CIM-NAME "ElementNameMask" :QUALIFIERS
                ((:DESCRIPTION
                  "This string expresses the restrictions on ElementName.The mask is expressed as a regular expression.See DMTF standard ABNF with the Management Profile Specification Usage Guide, appendix C for the regular expression syntax permitted. 
Since the ElementNameMask can describe the maximum length of the ElementName,any length defined in the regexp is in addition to the restriction defined in MaxElementNameLen (causing the smaller value to be the maximum length) The ElementName value satisfies the restriction, if and only if it matches the regular expression")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElementCapabilities.MaxElementNameLen")))
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
                :INITFORM NIL)
               (SUPPORTEDEXPORTURISCHEMES (ARRAY UINT16) :CIM-NAME
                "SupportedExportURISchemes" :QUALIFIERS
                ((:DESCRIPTION
                  "This property lists the URI schemes supported by OpaqueManagementDataService.ExportOpaqueManagementDataToURI().")
                 (:VALUE-MAP
                  ("2" "3" "4" "5" "6" "7" "8" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("data" "file" "ftp" "http" "https" "nfs" "tftp"
                   "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (SUPPORTEDIMPORTURISCHEMES (ARRAY UINT16) :CIM-NAME
                "SupportedImportURISchemes" :QUALIFIERS
                ((:DESCRIPTION
                  "This property lists the URI schemes supported by OpaqueManagementDataService.ImportOpaqueManagementDataFromURI().")
                 (:VALUE-MAP
                  ("2" "3" "4" "5" "6" "7" "8" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("data" "file" "ftp" "http" "https" "nfs" "tftp"
                   "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (SUPPORTEDMETHODS (ARRAY UINT16) :CIM-NAME "SupportedMethods"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property advertises the methods that are supported by the service.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" ".." "0x80.."))
                 (:VALUES
                  ("Other" "Create" "Read" "ExportToURI" "Write"
                   "ImportFromURI" "Lock" "ReassignOwnership" "AssignAccess"
                   "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (REQUESTEDSTATESSUPPORTED (ARRAY UINT16) :CIM-NAME
                "RequestedStatesSupported" :QUALIFIERS
                ((:DESCRIPTION
                  "RequestedStatesSupported indicates the possible states that can be requested when using the method RequestStateChange on the EnabledLogicalElement.")
                 (:VALUE-MAP ("2" "3" "4" "6" "7" "8" "9" "10" "11"))
                 (:VALUES
                  ("Enabled" "Disabled" "Shut Down" "Offline" "Test" "Defer"
                   "Quiesce" "Reboot" "Reset"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.RequestStateChange")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_OpaqueManagementDataCapabilities")
              (:QUALIFIERS (:VERSION "2.23.0")
               (:UML-PACKAGE-PATH "CIM::Core::OpaqueManagementData")
               (:DESCRIPTION
                "CIM_OpaqueManagementDataCapabilities describes the capabilities of CIM_OpaqueManagementDataService.")))