
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SoftwareInstallationServiceCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SOFTWAREINSTALLATIONSERVICECAPABILITIES (CIM_CAPABILITIES)
              ((CANADDTOCOLLECTION BOOLEAN :CIM-NAME "CanAddToCollection"
                :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "This property indicates whether SoftwareInstallationService.InstallFromSoftwareIdentity supports adding a SoftwareIdentity to a Collection."))
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
               (SUPPORTEDASYNCHRONOUSACTIONS (ARRAY UINT16) :CIM-NAME
                "SupportedAsynchronousActions" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "Enumeration indicating what operations will be executed as asynchronous jobs. If an operation is included in both this and SupportedSynchronousActions then the underlying implementation is indicating that it may or may not create a job. If a Job is created, then the methods in SoftwareInstallationService return a reference to that Job as the Job parameter.")
                 (:VALUE-MAP ("2" "3" "4" "5"))
                 (:VALUES
                  ("None supported" "Install From Software Identity"
                   "Install from ByteStream" "Install from URI"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareInstallationServiceCapabilities.SupportedSynchronousActions")))
                :INITFORM NIL)
               (SUPPORTEDSYNCHRONOUSACTIONS (ARRAY UINT16) :CIM-NAME
                "SupportedSynchronousActions" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "Enumeration indicating what operations will be executed without the creation of a job. If an operation is included in both this and SupportedAsynchronousActions then the underlying instrumentation is indicating that it may or may not create a job.")
                 (:VALUE-MAP ("2" "3" "4" "5"))
                 (:VALUES
                  ("None supported" "Install From Software Identity"
                   "Install from ByteStream" "Install from URI"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareInstallationServiceCapabilities.SupportedAsynchronousActions")))
                :INITFORM NIL)
               (SUPPORTEDTARGETTYPES (ARRAY STRING) :CIM-NAME
                "SupportedTargetTypes" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "An array containing a list of SoftwareIdentity.TargetType properties that this service 'knows' how to install. TargetType is an application specific string which is invariant across version or name changes of the SoftwareIdentity and so can be used by a client to select Software Identities compatible with this service. 
If the service is generic (for example an OS installer), this array will be empty.")
                 (:MODEL-CORRESPONDENCE ("CIM_SoftwareIdentity.TargetTypes")))
                :INITFORM NIL)
               (SUPPORTEDEXTENDEDRESOURCETYPES (ARRAY UINT16) :CIM-NAME
                "SupportedExtendedResourceTypes" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "An array containing a list of the binary format types that this service 'knows' how to install. The Values for this property are the subset of CIM_SoftwareIdentityResource.ExtendedResourceTypes that apply to the 'Installer and Payload', 'Installer' and ' Installability Checker' ResourceTypes. For example, an a Windows system, this property may be set to '4' indicating 'Windows MSI'. This property should be set to '2' (Not Applicable) if this service is not OS specific.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" ".."
                   "0x8000.."))
                 (:VALUES
                  ("Unknown" "Other" "Not Applicable" "Linux RPM" "HP-UX Depot"
                   "Windows MSI" "Solaris Package" "Macintosh Disk Image"
                   "Debian linux Package" "VMware vSphere Installation Bundle"
                   "VMware Software Bulletin" "HP Smart Component"
                   "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.ExtendedResourceType"
                   "CIM_SoftwareInstallationServiceCapabilities.OtherSupportedExtendedResourceTypeDescriptions"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypesMajorVersions"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypesMinorVersions"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypesRevisionNumbers"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypesbuildNumbers")))
                :INITFORM NIL)
               (SUPPORTEDINSTALLOPTIONS (ARRAY UINT16) :CIM-NAME
                "SupportedInstallOptions" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration indicating the specific install related optionssupported by this service. Since this is an array, multiple values may be specified. See the InstallOptions parameter of theSoftwareInstallationService.InstallFromSoftwareIdentity method for the description of these values.")
                 (:VALUE-MAP
                  ("2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" ".."
                   "32768..65535"))
                 (:VALUES
                  ("Defer target/system reset" "Force installation" "Install"
                   "Update" "Repair" "Reboot" "Password" "Uninstall" "Log"
                   "SilentMode" "AdministrativeMode" "ScheduleInstallAt"
                   "DMTF Reserved" "Vendor Specific"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareInstallationService.InstallFromSoftwareIdentity")))
                :INITFORM NIL)
               (OTHERSUPPORTEDEXTENDEDRESOURCETYPEDESCRIPTIONS (ARRAY STRING)
                :CIM-NAME "OtherSupportedExtendedResourceTypeDescriptions"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the binary format types that this service 'knows' how to install when the corresponding SupportedExtendedResourceTypes array includes the value 1 (Other).")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.ExtendedResourceType"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypes"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypesMajorVersions"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypesMinorVersions"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypesRevisionNumbers"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypesbuildNumbers")))
                :INITFORM NIL)
               (SUPPORTEDEXTENDEDRESOURCETYPESMAJORVERSIONS (ARRAY UINT16)
                :CIM-NAME "SupportedExtendedResourceTypesMajorVersions"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property represents the major number component of the installer version supported by the SoftwareInstallationService.The installer format is represented by the element at the same index in the SupportedExtendedResourceTypes array.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.ExtendedResourceType"
                   "CIM_SoftwareIdentity.MinExtendedResourceTypeMajorVersion"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypes")))
                :INITFORM NIL)
               (SUPPORTEDEXTENDEDRESOURCETYPESMINORVERSIONS (ARRAY UINT16)
                :CIM-NAME "SupportedExtendedResourceTypesMinorVersions"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property represents the minor number component of the installer version supported by the SoftwareInstallationService.The installer format is represented by the element at the same index in the SupportedExtendedResourceTypes array.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.ExtendedResourceType"
                   "CIM_SoftwareIdentity.MinExtendedResourceTypeMinorVersion"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypes")))
                :INITFORM NIL)
               (SUPPORTEDEXTENDEDRESOURCETYPESREVISIONNUMBERS (ARRAY UINT16)
                :CIM-NAME "SupportedExtendedResourceTypesRevisionNumbers"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property represents the revision number component of the installer version supported by the SoftwareInstallationService.The installer format is represented by the element at the same index in the SupportedExtendedResourceTypes array.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.ExtendedResourceType"
                   "CIM_SoftwareIdentity.MinExtendedResourceTypeRevisionNumber"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypes")))
                :INITFORM NIL)
               (SUPPORTEDEXTENDEDRESOURCETYPESBUILDNUMBERS (ARRAY UINT16)
                :CIM-NAME "SupportedExtendedResourceTypesBuildNumbers"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This property represents the build number component of the installer version supported by the SoftwareInstallationService.The installer format is represented by the element at the same index in the SupportedExtendedResourceTypes array.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.ExtendedResourceType"
                   "CIM_SoftwareIdentity.MinExtendedResourceTypeBuildNumber"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypes")))
                :INITFORM NIL)
               (SUPPORTEDURISCHEMES (ARRAY UINT16) :CIM-NAME
                "SupportedURISchemes" :QUALIFIERS
                ((:DESCRIPTION
                  "This property lists the URI schemes supported by the SoftwareInstallationService.")
                 (:VALUE-MAP
                  ("2" "3" "4" "5" "6" "7" "8" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("data" "file" "ftp" "http" "https" "nfs" "tftp"
                   "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_SoftwareInstallationServiceCapabilities")
              (:QUALIFIERS (:VERSION "2.28.0")
               (:UML-PACKAGE-PATH "CIM::Core::Software")
               (:DESCRIPTION
                "A subclass of capabilities that defines the capabilities of a SoftwareInstallationService. A single instance of SoftwareInstallationServiceCapabilities is associated with a SoftwareInstallationService using ElementCapabilities.")))