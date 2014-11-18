
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ElementSoftwareIdentity.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ELEMENTSOFTWAREIDENTITY (CIM_DEPENDENCY)
              ((UPGRADECONDITION UINT16 :CIM-NAME "UpgradeCondition"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the element's ability to upgrade this software asset.
'Resides off element'(2), indicates the persistence of the software is outside of the element. Typically for a element this software is part of the OperatingSystem is typically upgradeable.
'Owner Upgradeable' (3), indicates the persistence of the software is on the element and is upgradeable by the owner.
'FactoryUpgradeable' (4),indicates the persistence of the software is on the element and is upgradeable by the manufacturer.
'Not Upgradeable' (5), indicates the presistence of the software is on the element and is not upgradeable. (i.e. burned into a non replaceable ROM chip.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" ".." "0x8000..0xFFFF"))
                 (:VALUES
                  ("Unknown" "Other" "Resides off device" "Owner Upgradeable"
                   "Factory Upgradeable" "Not Upgradeable" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ElementSoftwareIdentity.OtherUpgradeCondition")))
                :INITFORM NIL)
               (OTHERUPGRADECONDITION STRING :CIM-NAME "OtherUpgradeCondition"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Describes the upgrade condition, when UpgradeCondition is set to 1 (\"Other\").")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ElementSoftwareIdentity.UpgradeCondition")))
                :INITFORM NIL)
               (ELEMENTSOFTWARESTATUS (ARRAY UINT16) :CIM-NAME
                "ElementSoftwareStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "A collection of properties describing the status of the software on the managed element. Multiple properties could be set at the same time. For example a ElementSoftwareStatus could have \"Installed\", \"Default\", \"Current\" and \"FallBack\" set at the same time. 
\"Current\" indicates that the software is currently running on or for the Managed Element. 
\"Next\" indicates that the software will run after the next reset or reboot unless superseded by a software with a status of \"SingleUse\". 
\"FallBack\" indicates that the software will be run if the software which has a status of \"Next\" or \"SingleUse\" fails to run. 
\"Default\" indicates the default version of the software that was originally shipped by the manufacturer. 
\"Installed\" indicates that the software is persistently located and is available for use on the Managed Element. 
\"SingleUse\" indicates that the software will run only after the next reset or reboot but will not run after the subsequent reset or reboot. 
\"Available\" indicates that the software is available for installation on the Managed Element. 
\"Supports\"indicates that the software will work with or operate the Managed Element but is or will be installed on a different Managed Element.")
                 (:VALUE-MAP
                  ("0" "2" "3" "4" "5" "6" "7" "8" "9" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "Current" "Next" "FallBack" "Default" "Installed"
                   "Single Use" "Available" "Supports" "DMTF Reserved"
                   "Vendor Reserved")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "A LogicalElement's Software Asset.") :KEY)
                :INITFORM "CIM_SoftwareIdentity")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The ManagedElement that requires or uses the software.")
                 :KEY)
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_ElementSoftwareIdentity")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.20.0")
               (:UML-PACKAGE-PATH "CIM::Core::Software")
               (:DESCRIPTION
                "ElementSoftwareIdentity allows a Managed Element to report its software related asset information (firmware, drivers, configuration software, and etc.)")))