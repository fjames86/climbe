
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_StorageSettingsAssociatedToCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_STORAGESETTINGSASSOCIATEDTOCAPABILITIES
              (CIM_SETTINGASSOCIATEDTOCAPABILITIES)
              ((DEFAULTSETTING BOOLEAN :CIM-NAME "DefaultSetting" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "If an element whose characteristics are described by the associated Capabilities instance has a dependent element created or modified without specifying an associated SettingData instance, then the default SettingData will be used in that operation."))
                :INITFORM "false")
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The StorageCapabilities.") :KEY)
                :INITFORM "CIM_StorageCapabilities")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The fixed and predefined StorageSetting.")
                 :KEY)
                :INITFORM "CIM_StorageSetting"))
              (:CIM-NAME "CIM_StorageSettingsAssociatedToCapabilities")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.11.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageServices")
               (:DESCRIPTION
                "This association define StorageSettings that reflect the capabilities of the associated StorageCapabilities. The associated StorageSetting may not define the operational characteristics (through settings properties) of any storage element. Certain StorageSetting instances can be defined as \"Fixed = Not Changeable\" by using the \"ChangeableType\" attribute. \"Fixed\" settings have this special association. This association should be defined between \"Fixed - Not Changeable\" instances of StorageSetting with the StorageCapabilities instances that are associated with the StoragePools which support the storage characteristics described by the StorageSetting instance. 
Fixed settings may be associated to many StorageCapabilities.")))