
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SoftwareIdentity.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SOFTWAREIDENTITY (CIM_LOGICALELEMENT)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (MAJORVERSION UINT16 :CIM-NAME "MajorVersion" :QUALIFIERS
                ((:DESCRIPTION
                  "The major number component of the software's version information - for example, '12' from version 12.1(3)T. This property is defined as a numeric value to allow the determination of 'newer' vs. 'older' releases. A 'newer' major release is indicated by a larger numeric value."))
                :INITFORM NIL)
               (MINORVERSION UINT16 :CIM-NAME "MinorVersion" :QUALIFIERS
                ((:DESCRIPTION
                  "The minor number component of the software's version information - for example, '1' from version 12.1(3)T. This property is defined as a numeric value to allow the determination of 'newer' vs. 'older' releases. A 'newer' minor release is indicated by a larger numeric value."))
                :INITFORM NIL)
               (REVISIONNUMBER UINT16 :CIM-NAME "RevisionNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "The revision or maintenance release component of the software's version information - for example, '3' from version 12.1(3)T. This property is defined as a numeric value to allow the determination of 'newer' vs. 'older' releases. A 'newer' revision is indicated by a larger numeric value."))
                :INITFORM NIL)
               (BUILDNUMBER UINT16 :CIM-NAME "BuildNumber" :QUALIFIERS
                ((:DESCRIPTION "The build number of the software.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.LargeBuildNumber"
                   "CIM_SoftwareIdentity.IsLargeBuildNumber")))
                :INITFORM NIL)
               (LARGEBUILDNUMBER UINT64 :CIM-NAME "LargeBuildNumber"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The build number of the software if IsLargeBuildNumber is TRUE. TheLargeBuildNumber property should be used for all future implementations.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.BuildNumber"
                   "CIM_SoftwareIdentity.IsLargeBuildNumber")))
                :INITFORM NIL)
               (ISLARGEBUILDNUMBER BOOLEAN :CIM-NAME "IsLargeBuildNumber"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The IsLargeBuildNumber property is used to indicate if the BuildNumber of LargeBuildNumber property contains the value of the software build. A value of TRUE shall indicate that the build number is represented by the LargeBuildNumber property. A value of FALSE shall indicate that the build number is represented by the BuildNumber property.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.BuildNumber"
                   "CIM_SoftwareIdentity.LargeBuildNumber")))
                :INITFORM "false")
               (VERSIONSTRING STRING :CIM-NAME "VersionString" :QUALIFIERS
                ((:DESCRIPTION
                  "A string representing the complete software version information - for example, '12.1(3)T'. This string and the numeric major/minor/revision/build properties are complementary. Since vastly different representations and semantics exist for versions, it is not assumed that one representation is sufficient to permit a client to perform computations (i.e., the values are numeric) and a user to recognize the software's version (i.e., the values are understandable and readable). Hence, both numeric and string representations of version are provided."))
                :INITFORM NIL)
               (MANUFACTURER STRING :CIM-NAME "Manufacturer" :QUALIFIERS
                ((:DESCRIPTION "Manufacturer of this software.")) :INITFORM
                NIL)
               (SERIALNUMBER STRING :CIM-NAME "SerialNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "A manufacturer-allocated number used to identify the software."))
                :INITFORM NIL)
               (RELEASEDATE DATETIME :CIM-NAME "ReleaseDate" :QUALIFIERS
                ((:DESCRIPTION "The date the software was released."))
                :INITFORM NIL)
               (ISENTITY BOOLEAN :CIM-NAME "IsEntity" :QUALIFIERS
                ((:DESCRIPTION
                  "The IsEntity property is used to indicate whether the SoftwareIdentity corresponds to a discrete copy of the software component or is being used to convey descriptive and identifying information about software that is not present in the management domain.A value of TRUE shall indicate that the SoftwareIdentity instance corresponds to a discrete copy of the software component. A value of FALSE shall indicate that the SoftwareIdentity instance does not correspond to a discrete copy of the Software."))
                :INITFORM "false")
               (EXTENDEDRESOURCETYPE UINT16 :CIM-NAME "ExtendedResourceType"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The binary format type of the installation package of the software. This property can be used to locate a SoftwareInstallationService capable of installing this software.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" ".."
                   "0x8000.."))
                 (:VALUES
                  ("Unknown" "Other" "Not Applicable" "Linux RPM" "HP-UX Depot"
                   "Windows MSI" "Solaris Package" "Macintosh Disk Image"
                   "Debian linux Package" "VMware vSphere Installation Bundle"
                   "VMware Software Bulletin" "HP Smart Component"
                   "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.OtherExtendedResourceTypeDescription"
                   "CIM_SoftwareIdentity.MinExtendedResourceTypeMajorVersion"
                   "CIM_SoftwareIdentity.MinExtendedResourceTypeMinorVersion"
                   "CIM_SoftwareIdentity.MinExtendedResourceTypeRevisionNumber"
                   "CIM_SoftwareIdentity.MinExtendedResourceTypeBuildNumber"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypes")))
                :INITFORM NIL)
               (OTHEREXTENDEDRESOURCETYPEDESCRIPTION STRING :CIM-NAME
                "OtherExtendedResourceTypeDescription" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the binary format type of the installation package of the software when the ExtendedResourceType property has a value of 1 (Other).")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.ExtendedResourceType"
                   "CIM_SoftwareIdentity.MinExtendedResourceTypeMajorVersion"
                   "CIM_SoftwareIdentity.MinExtendedResourceTypeMinorVersion"
                   "CIM_SoftwareIdentity.MinExtendedResourceTypeRevisionNumber"
                   "CIM_SoftwareIdentity.MinExtendedResourceTypeBuildNumber"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypes")))
                :INITFORM NIL)
               (MINEXTENDEDRESOURCETYPEMAJORVERSION UINT16 :CIM-NAME
                "MinExtendedResourceTypeMajorVersion" :QUALIFIERS
                ((:DESCRIPTION
                  "This property represents the major number component of the minimum version of the installer, represented by the ExtendedResourceType property, that is required to install this software.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.ExtendedResourceType"
                   "CIM_SoftwareIdentity.OtherExtendedResourceTypeDescription"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypes"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypesMajorVersions")))
                :INITFORM NIL)
               (MINEXTENDEDRESOURCETYPEMINORVERSION UINT16 :CIM-NAME
                "MinExtendedResourceTypeMinorVersion" :QUALIFIERS
                ((:DESCRIPTION
                  "This property represents the minor number component of the minimum version of the installer, represented by theExtendedResourceType property, that is required to install this software.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.ExtendedResourceType"
                   "CIM_SoftwareIdentity.OtherExtendedResourceTypeDescription"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypes"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypesMinorVersions")))
                :INITFORM NIL)
               (MINEXTENDEDRESOURCETYPEREVISIONNUMBER UINT16 :CIM-NAME
                "MinExtendedResourceTypeRevisionNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "This property represents the Revision number component of the minimum version of the installer, represented by theExtendedResourceType property, that is required to install this software.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.ExtendedResourceType"
                   "CIM_SoftwareIdentity.OtherExtendedResourceTypeDescription"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypes"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypesRevisionNumbers")))
                :INITFORM NIL)
               (MINEXTENDEDRESOURCETYPEBUILDNUMBER UINT16 :CIM-NAME
                "MinExtendedResourceTypeBuildNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "This property represents the Build number component of the minimum version of the installer, represented by theExtendedResourceType property, that is required to install this software.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.ExtendedResourceType"
                   "CIM_SoftwareIdentity.OtherExtendedResourceTypeDescription"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypes"
                   "CIM_SoftwareInstallationServiceCapabilities.SupportedExtendedResourceTypesBuildNumbers")))
                :INITFORM NIL)
               (INSTALLDATE DATETIME :CIM-NAME "InstallDate" :QUALIFIERS
                ((:DESCRIPTION
                  "A datetime value that indicates when the object was installed. Lack of a value does not indicate that the object is not installed.")
                 (:MAPPING-STRINGS ("MIF.DMTF|ComponentID|001.5")))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                ((:DESCRIPTION
                  "The Name property defines the label by which the object is known. When subclassed, the Name property can be overridden to be a Key property.")
                 (:MAX-LEN "1024"))
                :INITFORM NIL)
               (STATUS STRING :CIM-NAME "Status" :QUALIFIERS
                ((:DEPRECATED ("CIM_ManagedSystemElement.OperationalStatus"))
                 (:DESCRIPTION
                  "A string indicating the current status of the object. Various operational and non-operational statuses are defined. This property is deprecated in lieu of OperationalStatus, which includes the same semantics in its enumeration. This change is made for 3 reasons: 
1) Status is more correctly defined as an array. This definition overcomes the limitation of describing status using a single value, when it is really a multi-valued property (for example, an element might be OK AND Stopped. 
2) A MaxLen of 10 is too restrictive and leads to unclear enumerated values. 
3) The change to a uint16 data type was discussed when CIM V2.0 was defined. However, existing V1.0 implementations used the string property and did not want to modify their code. Therefore, Status was grandfathered into the Schema. Use of the deprecated qualifier allows the maintenance of the existing property, but also permits an improved definition using OperationalStatus.")
                 (:VALUE-MAP
                  ("OK" "Error" "Degraded" "Unknown" "Pred Fail" "Starting"
                   "Stopping" "Service" "Stressed" "NonRecover" "No Contact"
                   "Lost Comm" "Stopped"))
                 (:MAX-LEN "10"))
                :INITFORM NIL)
               (HEALTHSTATE UINT16 :CIM-NAME "HealthState" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the current health of the element. This attribute expresses the health of this element but not necessarily that of its subcomponents. The possible values are 0 to 30, where 5 means the element is entirely healthy and 30 means the element is completely non-functional. The following continuum is defined: 
\"Non-recoverable Error\" (30) - The element has completely failed, and recovery is not possible. All functionality provided by this element has been lost. 
\"Critical Failure\" (25) - The element is non-functional and recovery might not be possible. 
\"Major Failure\" (20) - The element is failing. It is possible that some or all of the functionality of this component is degraded or not working. 
\"Minor Failure\" (15) - All functionality is available but some might be degraded. 
\"Degraded/Warning\" (10) - The element is in working order and all functionality is provided. However, the element is not working to the best of its abilities. For example, the element might not be operating at optimal performance or it might be reporting recoverable errors. 
\"OK\" (5) - The element is fully functional and is operating within normal operational parameters and without error. 
\"Unknown\" (0) - The implementation cannot report on HealthState at this time. 
DMTF has reserved the unused portion of the continuum for additional HealthStates in the future.")
                 (:VALUE-MAP
                  ("0" "5" "10" "15" "20" "25" "30" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "OK" "Degraded/Warning" "Minor failure"
                   "Major failure" "Critical failure" "Non-recoverable error"
                   "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (COMMUNICATIONSTATUS UINT16 :CIM-NAME "CommunicationStatus"
                :QUALIFIERS
                ((:DESCRIPTION
                  "CommunicationStatus indicates the ability of the instrumentation to communicate with the underlying ManagedElement. CommunicationStatus consists of one of the following values: Unknown, None, Communication OK, Lost Communication, or No Contact. 
A Null return indicates the implementation (provider) does not implement this property. 
\"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"Not Available\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"Communication OK \" indicates communication is established with the element, but does not convey any quality of service. 
\"No Contact\" indicates that the monitoring system has knowledge of this element, but has never been able to establish communications with it. 
\"Lost Communication\" indicates that the Managed Element is known to exist and has been contacted successfully in the past, but is currently unreachable.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Not Available" "Communication OK"
                   "Lost Communication" "No Contact" "DMTF Reserved"
                   "Vendor Reserved")))
                :INITFORM NIL)
               (DETAILEDSTATUS UINT16 :CIM-NAME "DetailedStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "DetailedStatus compliments PrimaryStatus with additional status detail. It consists of one of the following values: Not Available, No Additional Information, Stressed, Predictive Failure, Error, Non-Recoverable Error, SupportingEntityInError. Detailed status is used to expand upon the PrimaryStatus of the element. 
A Null return indicates the implementation (provider) does not implement this property. 
\"Not Available\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"No Additional Information\" indicates that the element is functioning normally as indicated by PrimaryStatus = \"OK\". 
\"Stressed\" indicates that the element is functioning, but needs attention. Examples of \"Stressed\" states are overload, overheated, and so on. 
\"Predictive Failure\" indicates that an element is functioning normally but a failure is predicted in the near future. 
\"Non-Recoverable Error \" indicates that this element is in an error condition that requires human intervention. 
\"Supporting Entity in Error\" indicates that this element might be \"OK\" but that another element, on which it is dependent, is in error. An example is a network service or endpoint that cannot function due to lower-layer networking problems.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" ".." "0x8000.."))
                 (:VALUES
                  ("Not Available" "No Additional Information" "Stressed"
                   "Predictive Failure" "Non-Recoverable Error"
                   "Supporting Entity in Error" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.PrimaryStatus"
                   "CIM_ManagedSystemElement.HealthState")))
                :INITFORM NIL)
               (OPERATINGSTATUS UINT16 :CIM-NAME "OperatingStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "OperatingStatus provides a current status value for the operational condition of the element and can be used for providing more detail with respect to the value of EnabledState. It can also provide the transitional states when an element is transitioning from one state to another, such as when an element is transitioning between EnabledState and RequestedState, as well as other transitional conditions.
OperatingStatus consists of one of the following values: Unknown, Not Available, In Service, Starting, Stopping, Stopped, Aborted, Dormant, Completed, Migrating, Emmigrating, Immigrating, Snapshotting. Shutting Down, In Test 
A Null return indicates the implementation (provider) does not implement this property. 
\"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"None\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"Servicing\" describes an element being configured, maintained, cleaned, or otherwise administered. 
\"Starting\" describes an element being initialized. 
\"Stopping\" describes an element being brought to an orderly stop. 
\"Stopped\" and \"Aborted\" are similar, although the former implies a clean and orderly stop, while the latter implies an abrupt stop where the state and configuration of the element might need to be updated. 
\"Dormant\" indicates that the element is inactive or quiesced. 
\"Completed\" indicates that the element has completed its operation. This value should be combined with either OK, Error, or Degraded in the PrimaryStatus so that a client can tell if the complete operation Completed with OK (passed), Completed with Error (failed), or Completed with Degraded (the operation finished, but it did not complete OK or did not report an error). 
\"Migrating\" element is being moved between host elements. 
\"Immigrating\" element is being moved to new host element. 
\"Emigrating\" element is being moved away from host element. 
\"Shutting Down\" describes an element being brought to an abrupt stop. 
\"In Test\" element is performing test functions. 
\"Transitioning\" describes an element that is between states, that is, it is not fully available in either its previous state or its next state. This value should be used if other values indicating a transition to a specific state are not applicable.
\"In Service\" describes an element that is in service and operational.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Not Available" "Servicing" "Starting" "Stopping"
                   "Stopped" "Aborted" "Dormant" "Completed" "Migrating"
                   "Emigrating" "Immigrating" "Snapshotting" "Shutting Down"
                   "In Test" "Transitioning" "In Service" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM NIL)
               (PRIMARYSTATUS UINT16 :CIM-NAME "PrimaryStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "PrimaryStatus provides a high level status value, intended to align with Red-Yellow-Green type representation of status. It should be used in conjunction with DetailedStatus to provide high level and detailed health status of the ManagedElement and its subcomponents. 
PrimaryStatus consists of one of the following values: Unknown, OK, Degraded or Error. \"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"OK\" indicates the ManagedElement is functioning normally. 
\"Degraded\" indicates the ManagedElement is functioning below normal. 
\"Error\" indicates the ManagedElement is in an Error condition.")
                 (:VALUE-MAP ("0" "1" "2" "3" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "OK" "Degraded" "Error" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.DetailedStatus"
                   "CIM_ManagedSystemElement.HealthState")))
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
               (TARGETOPERATINGSYSTEMS (ARRAY STRING) :CIM-NAME
                "TargetOperatingSystems" :QUALIFIERS
                ((:DESCRIPTION
                  "Specifies the target operating systems of the software. This property should be used when a target operating system is not listed in the TargetOSTypes array values."))
                :INITFORM NIL)
               (LANGUAGES (ARRAY STRING) :CIM-NAME "Languages" :QUALIFIERS
                ((:DESCRIPTION
                  "The language editions supported by the software. The language codes defined in ISO 639 should be used."))
                :INITFORM NIL)
               (CLASSIFICATIONS (ARRAY UINT16) :CIM-NAME "Classifications"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An array of enumerated integers that classify this software. For example, the software MAY be instrumentation (value=5) or firmware and diagnostic software (10 and 7). The use of value 6, Firmware/BIOS, is being deprecated. Instead, either the value 10 (Firmware) and/or 11 (BIOS/FCode) SHOULD be used. The value 13, Software Bundle, identifies a software package consisting of multiple discrete software instances that can be installed individually or together.
Each contained software instance is represented by an instance of SoftwareIdentity that is associated to this instance of SoftwareIdentityinstance via a Component association.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("Unknown" "Other" "Driver" "Configuration Software"
                   "Application Software" "Instrumentation" "Firmware/BIOS"
                   "Diagnostic Software" "Operating System" "Middleware"
                   "Firmware" "BIOS/FCode" "Support/Service Pack"
                   "Software Bundle" "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.ClassificationDescriptions")))
                :INITFORM NIL)
               (CLASSIFICATIONDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "ClassificationDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of free-form strings providing more detailed explanations for any of the entries in the Classifications array. Note that each entry is related to one in the Classifications array located at the same index.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.Classifications")))
                :INITFORM NIL)
               (TARGETTYPES (ARRAY STRING) :CIM-NAME "TargetTypes" :QUALIFIERS
                ((:DESCRIPTION
                  "An array of strings that describes the compatible installer(s). The purpose of the array elements is to establish compatibility between a SoftwareIdentity and a SoftwareInstallationService that can install the SoftwareIdentity by comparing the values of the array elements of this property to the values of SoftwareInstallationServiceCapabilities.SupportedTargetTypes[] property's array elements.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareInstallationServiceCapabilities.SupportedTargetTypes")))
                :INITFORM NIL)
               (IDENTITYINFOVALUE (ARRAY STRING) :CIM-NAME "IdentityInfoValue"
                :QUALIFIERS
                ((:DESCRIPTION
                  "IdentityInfoValue captures additional information that MAY be used by an organization to describe or identify a software instance within the context of the organization. For example, large organizations may have several ways to address or identify a particular instance of software depending on where it is stored; a catalog, a web site, or for whom it is intended; development, customer service, etc. The indexed array property IdentityInfoValue contains 0 or more strings that contain a specific identity info string value. IdentityInfoValue is mapped and indexed to IdentityInfoType. When the IdentityInfoValue property is implemented, the IdentityInfoType property MUST be implemented and shall be formatted using the algorithm provided in the IdentityInfoType property Description.")
                 (:ARRAYTYPE "Indexed") (:MAX-LEN "256")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.IdentityInfoType")))
                :INITFORM NIL)
               (IDENTITYINFOTYPE (ARRAY STRING) :CIM-NAME "IdentityInfoType"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An indexed array of fixed-form strings that provide the description of the type of information that is stored in the corresponding component of the IdentityInfoValue array. The elements of this property array describe the type of the value in the corresponding elements of the IndetityInfoValue array. When the IdentityInfoValue property is implemented, the IdentityInfoType property MUST be implemented. To insure uniqueness the IdentityInfoType property SHOULD be formatted using the following algorithm: < OrgID > : < LocalID > Where < OrgID > and < LocalID > are separated by a colon (:), and where < OrgID > MUST include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the IdentityInfoType or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the < Schema Name > _ < Class Name > structure of Schema class names.) In addition, to ensure uniqueness, < OrgID > MUST NOT contain a colon (:). When using this algorithm, the first colon to appear in IdentityInfoType MUST appear between < OrgID > and < LocalID > . < LocalID > is chosen by the business entity and SHOULD NOT be reused to identify different underlying software elements.")
                 (:ARRAYTYPE "Indexed") (:MAX-LEN "256")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SoftwareIdentity.IdentityInfoValue")))
                :INITFORM NIL)
               (TARGETOSTYPES (ARRAY UINT16) :CIM-NAME "TargetOSTypes"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The TargetOSTypes property specifies the target operating systems supported by the software. When the target operating system of the software is not listed in the enumeration values, TargetOperatingSystems[] property should be used to specify the target operating system.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25"
                   "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37"
                   "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49"
                   "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61"
                   "62" "63" "64" "65" "66" "67" "68" "69" "70" "71" "72" "73"
                   "74" "75" "76" "77" "78" "79" "80" "81" "82" "83" "84" "85"
                   "86" "87" "88" "89" "90" "91" "92" "93" "94" "95" "96" "97"
                   "98" "99" "100" "101" "102" "103" "104" "105" "106" "107"
                   "108" "109" "110" "111" "113" "114" "115" "116"))
                 (:VALUES
                  ("Unknown" "Other" "MACOS" "ATTUNIX" "DGUX" "DECNT"
                   "Tru64 UNIX" "OpenVMS" "HPUX" "AIX" "MVS" "OS400" "OS/2"
                   "JavaVM" "MSDOS" "WIN3x" "WIN95" "WIN98" "WINNT" "WINCE"
                   "NCR3000" "NetWare" "OSF" "DC/OS" "Reliant UNIX"
                   "SCO UnixWare" "SCO OpenServer" "Sequent" "IRIX" "Solaris"
                   "SunOS" "U6000" "ASERIES" "HP NonStop OS" "HP NonStop OSS"
                   "BS2000" "LINUX" "Lynx" "XENIX" "VM" "Interactive UNIX"
                   "BSDUNIX" "FreeBSD" "NetBSD" "GNU Hurd" "OS9" "MACH Kernel"
                   "Inferno" "QNX" "EPOC" "IxWorks" "VxWorks" "MiNT" "BeOS"
                   "HP MPE" "NextStep" "PalmPilot" "Rhapsody" "Windows 2000"
                   "Dedicated" "OS/390" "VSE" "TPF" "Windows (R) Me"
                   "Caldera Open UNIX" "OpenBSD" "Not Applicable" "Windows XP"
                   "z/OS" "Microsoft Windows Server 2003"
                   "Microsoft Windows Server 2003 64-Bit" "Windows XP 64-Bit"
                   "Windows XP Embedded" "Windows Vista" "Windows Vista 64-Bit"
                   "Windows Embedded for Point of Service"
                   "Microsoft Windows Server 2008"
                   "Microsoft Windows Server 2008 64-Bit" "FreeBSD 64-Bit"
                   "RedHat Enterprise Linux" "RedHat Enterprise Linux 64-Bit"
                   "Solaris 64-Bit" "SUSE" "SUSE 64-Bit" "SLES" "SLES 64-Bit"
                   "Novell OES" "Novell Linux Desktop"
                   "Sun Java Desktop System" "Mandriva" "Mandriva 64-Bit"
                   "TurboLinux" "TurboLinux 64-Bit" "Ubuntu" "Ubuntu 64-Bit"
                   "Debian" "Debian 64-Bit" "Linux 2.4.x" "Linux 2.4.x 64-Bit"
                   "Linux 2.6.x" "Linux 2.6.x 64-Bit" "Linux 64-Bit"
                   "Other 64-Bit" "Microsoft Windows Server 2008 R2"
                   "VMware ESXi" "Microsoft Windows 7" "CentOS 32-bit"
                   "CentOS 64-bit" "Oracle Linux 32-bit" "Oracle Linux 64-bit"
                   "eComStation 32-bitx" "Microsoft Windows Server 2011"
                   "Microsoft Windows Server 2012" "Microsoft Windows 8"
                   "Microsoft Windows 8 64-bit"
                   "Microsoft Windows Server 2012 R2"))
                 (:MODEL-CORRESPONDENCE ("CIM_OperatingSystem.OSType")))
                :INITFORM NIL)
               (OPERATIONALSTATUS (ARRAY UINT16) :CIM-NAME "OperationalStatus"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the current statuses of the element. Various operational statuses are defined. Many of the enumeration's values are self-explanatory. However, a few are not and are described here in more detail. 
\"Stressed\" indicates that the element is functioning, but needs attention. Examples of \"Stressed\" states are overload, overheated, and so on. 
\"Predictive Failure\" indicates that an element is functioning nominally but predicting a failure in the near future. 
\"In Service\" describes an element being configured, maintained, cleaned, or otherwise administered. 
\"No Contact\" indicates that the monitoring system has knowledge of this element, but has never been able to establish communications with it. 
\"Lost Communication\" indicates that the ManagedSystem Element is known to exist and has been contacted successfully in the past, but is currently unreachable. 
\"Stopped\" and \"Aborted\" are similar, although the former implies a clean and orderly stop, while the latter implies an abrupt stop where the state and configuration of the element might need to be updated. 
\"Dormant\" indicates that the element is inactive or quiesced. 
\"Supporting Entity in Error\" indicates that this element might be \"OK\" but that another element, on which it is dependent, is in error. An example is a network service or endpoint that cannot function due to lower-layer networking problems. 
\"Completed\" indicates that the element has completed its operation. This value should be combined with either OK, Error, or Degraded so that a client can tell if the complete operation Completed with OK (passed), Completed with Error (failed), or Completed with Degraded (the operation finished, but it did not complete OK or did not report an error). 
\"Power Mode\" indicates that the element has additional power model information contained in the Associated PowerManagementService association. 
\"Relocating\" indicates the element is being relocated.
OperationalStatus replaces the Status property on ManagedSystemElement to provide a consistent approach to enumerations, to address implementation needs for an array property, and to provide a migration path from today's environment to the future. This change was not made earlier because it required the deprecated qualifier. Due to the widespread use of the existing Status property in management applications, it is strongly recommended that providers or instrumentation provide both the Status and OperationalStatus properties. Further, the first value of OperationalStatus should contain the primary status for the element. When instrumented, Status (because it is single-valued) should also provide the primary status of the element.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Other" "OK" "Degraded" "Stressed"
                   "Predictive Failure" "Error" "Non-Recoverable Error"
                   "Starting" "Stopping" "Stopped" "In Service" "No Contact"
                   "Lost Communication" "Aborted" "Dormant"
                   "Supporting Entity in Error" "Completed" "Power Mode"
                   "Relocating" "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.StatusDescriptions")))
                :INITFORM NIL)
               (STATUSDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "StatusDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "Strings describing the various OperationalStatus array values. For example, if \"Stopping\" is the value assigned to OperationalStatus, then this property may contain an explanation as to why an object is being stopped. Note that entries in this array are correlated with those at the same array index in OperationalStatus.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.OperationalStatus")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_SoftwareIdentity")
              (:QUALIFIERS (:VERSION "2.28.0")
               (:CLASS-CONSTRAINT
                ("inv:self.IsLargeBuildNumber=true implies self.BuildNumber = null and self.LargeBuildNumber <> null"
                 "inv:self.IsLargeBuildNumber=false implies self.LargeBuildNumber=null"))
               (:UML-PACKAGE-PATH "CIM::Core::Software")
               (:DESCRIPTION
                "SoftwareIdentity provides descriptive information about a software component for asset tracking and/or installation dependency management. When the IsEntity property has the value TRUE, the instance of SoftwareIdentity represents an individually identifiable entity similar to Physical Element. SoftwareIdentity does NOT indicate whether the software is installed, executing, etc. This extra information may be provided through specialized associations to Software Identity. For instance, both InstalledSoftwareIdentity and ElementSoftwareIdentity may be used to indicate that the software identified by this class is installed. SoftwareIdentity is used when managing the software components of a ManagedElement that is the management focus. Since software may be acquired, SoftwareIdentity can be associated with a Product using the ProductSoftwareComponent relationship. The Application Model manages the deployment and installation of software via the classes, SoftwareFeatures and SoftwareElements. SoftwareFeature and SoftwareElement are used when the software component is the management focus. The deployment/installation concepts are related to the asset/identity one. In fact, a SoftwareIdentity may correspond to a Product, or to one or more SoftwareFeatures or SoftwareElements - depending on the granularity of these classes and the deployment model. The correspondence of Software Identity to Product, SoftwareFeature or SoftwareElement is indicated using the ConcreteIdentity association. Note that there may not be sufficient detail or instrumentation to instantiate ConcreteIdentity. And, if the association is instantiated, some duplication of information may result. For example, the Vendor described in the instances of Product and SoftwareIdentity MAY be the same. However, this is not necessarily true, and it is why vendor and similar information are duplicated in this class. 
Note that ConcreteIdentity can also be used to describe the relationship of the software to any LogicalFiles that result from installing it. As above, there may not be sufficient detail or instrumentation to instantiate this association.")))