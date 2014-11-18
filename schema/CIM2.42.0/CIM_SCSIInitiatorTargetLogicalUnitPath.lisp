
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SCSIInitiatorTargetLogicalUnitPath.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SCSIINITIATORTARGETLOGICALUNITPATH NIL
              ((OSDEVICENAME STRING :CIM-NAME "OSDeviceName" :QUALIFIERS
                ((:DESCRIPTION
                  "The OS Device Name for this path. Only applicable if the ExposedPathDeviceFiles property is true in the instance of SCSIMultipathConfigurationCapabilities associated with the LogicalDevice/RedundancySet this instance is a member of.")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_PATH_LOGICAL_UNIT_PROPERTIES|deviceFileName")))
                :INITFORM NIL)
               (ADMINISTRATIVEWEIGHT UINT32 :CIM-NAME "AdministrativeWeight"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "A value assigned by an administrator specifying a preference to assign to a path. The drivers will actively use all available paths with the highest weight. This allows an administrator to assign a subset of available paths for load balanced access and reserve the others as backup paths. For symmetric access devices, all paths are considered 'available'. For asymmetric access devices, all paths in active target port groups are considered available.")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_PATH_LOGICAL_UNIT_PROPERTIES|weight")))
                :INITFORM NIL)
               (STATE UINT32 :CIM-NAME "State" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The state of this path. Values are defined as follows: 
Unknown - the path is unavailable,but the cause is not known. 
Active - The path is okay and active. 
Passive - The path is okay, but is associated with a target port of target port group in standby access state. Only applies to devices with asymmetric access. 
Disabled - The path is disabled by administrative request (DisablePathLU). 
Path Error - The path is unusable due to an error on this path and no SCSI status was received. 
Logical Unit Error - A SCSI status was received for an I/O through this path indicating a logical unit error. 
Reserved - The path is unavailable due to a SCSI reservation. 
Removed - The path is unavailable because the OS or drivers marked the pathunusable. 
Transitioning - the path is transitioning between two valid states. 
The only valid values a client can specify are Disabled and Active. All other states are determined by the underlying implementation; attempts to set them should be given an error response.")
                 (:VALUE-MAP ("0" "2" "3" "4" "5" "6" "7" "8" "9"))
                 (:VALUES
                  ("Unknown" "Active" "Passive" "Disabled" "Path Error"
                   "Logical Unit Error" "Reserved" "Removed" "Transitioning"))
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_PATH_LOGICAL_UNIT_PROPERTIES|pathState")))
                :INITFORM NIL)
               (ADMINISTRATIVEOVERRIDE UINT16 :CIM-NAME
                "AdministrativeOverride" :QUALIFIERS
                ((:DESCRIPTION
                  "AdministrativeOverride allows an administrator to select a single path, force all I/O to this path, and disables load balancing. The steady-state value is 'No override in effect'. When an administrator sets an override for a particular path, that path's AdministrativeOverride is set to 'Overridding' and all other paths to same logical unit are assigned a value of 'Overridden'. This property is changed using the OverridePath method in SCSIPathConfigurationService.")
                 (:VALUE-MAP ("2" "3" "4"))
                 (:VALUES ("Overriding" "Overridden" "No override in effect"))
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_MULTIPATH_LOGICAL_UNIT_PROPERTIES|overridePath"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SCSIPathConfigurationService.SetOverridePath")))
                :INITFORM NIL)
               (LOGICALUNITNUMBER UINT16 :CIM-NAME "LogicalUnitNumber"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The SCSI Logical Unit Number. This is the unit number with values below 16,384 used in management applications. It is not the full SCSI SAM 8-byte logical unit number structure. Using the terminology from the T10 SCSI specifications, this is the LU number with a value between 0 and 255 using the Peripheral device addressing method with Bus Identifier zero or a LU number between 0 and 16,383 using the Flat space (AKA volume set) addressing method.")
                 (:MAX-VALUE "16383")
                 (:MAPPING-STRINGS
                  ("MP_API.SNIA|MP_MULTIPATH_LOGICAL_UNIT_PROPERTIES|overridePathMP_API.SNIA|MP_CancelOverridePath"
                   "MP_API.SNIA|MP_SetOverridePath")))
                :INITFORM NIL)
               (INITIATOR NIL :CIM-NAME "Initiator" :QUALIFIERS
                (:KEY (:DESCRIPTION "An initiator endpoint.")) :INITFORM
                "CIM_SCSIProtocolEndpoint")
               (TARGET NIL :CIM-NAME "Target" :QUALIFIERS
                (:KEY (:DESCRIPTION "A target endpoint.")) :INITFORM
                "CIM_SCSIProtocolEndpoint")
               (LOGICALUNIT NIL :CIM-NAME "LogicalUnit" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "A subclass of LogicalDevice representing a SCSI Logical Unit (such as StorageVolume or TapeDrive)."))
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_SCSIInitiatorTargetLogicalUnitPath")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageDevices")
               (:DESCRIPTION
                "An association that models a host driver path to a SCSI logical unit. Each permutation of initiator and target ProtocolEndpoints and logical units is considered a separate path. This class describes end-to-end path behavior such as properties and operations commonly used in multipath management.")))