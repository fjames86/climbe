
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DeviceSoftware.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DEVICESOFTWARE (CIM_DEPENDENCY)
              ((PURPOSE UINT16 :CIM-NAME "Purpose" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumerated integer that indicates the role that this software plays in regards to its associated Device. For example, this software could be instrumentation (value=5) or firmware (value=6).")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7" "8"))
                 (:VALUES
                  ("Unknown" "Other" "Driver" "Configuration Software"
                   "Application Software" "Instrumentation" "Firmware" "BIOS"
                   "Boot ROM"))
                 (:MAPPING-STRINGS ("MIF.DMTF|SubComponent Software|001.2"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DeviceSoftware.PurposeDescription")))
                :INITFORM NIL)
               (PURPOSEDESCRIPTION STRING :CIM-NAME "PurposeDescription"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string that provides more information for the Purpose property, for example, \"Application Software\".")
                 (:MODEL-CORRESPONDENCE ("CIM_DeviceSoftware.Purpose")))
                :INITFORM NIL)
               (LOADEDONDEVICE BOOLEAN :CIM-NAME "LoadedOnDevice" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean that indicates that the software is 'burned into' or otherwise located on the hardware of the LogicalDevice."))
                :INITFORM NIL)
               (UPGRADEABLEONDEVICE BOOLEAN :CIM-NAME "UpgradeableOnDevice"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean that indicates whether the software is upgradeable, when it is LoadedOnDevice. Software that is loaded as part of the OperatingSystem is typically changeable and upgradeable. However, when DeviceSoftware is burned into EEPROM or a chip that realizes the LogicalDevice, then it might not be upgradeable. This property indicates the ability to update and upgrade DeviceSoftware."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The SoftwareElement.")
                 :KEY)
                :INITFORM "CIM_SoftwareElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The LogicalDevice that requires or uses the software.")
                 :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_DeviceSoftware")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::DeviceElements")
               (:DESCRIPTION
                "The DeviceSoftware relationship identifies any software that is associated with a Device such as drivers, configuration, or application software, or firmware.")))