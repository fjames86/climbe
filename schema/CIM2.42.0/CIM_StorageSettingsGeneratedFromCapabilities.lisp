
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_StorageSettingsGeneratedFromCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_STORAGESETTINGSGENERATEDFROMCAPABILITIES
              (CIM_SETTINGASSOCIATEDTOCAPABILITIES)
              ((DEFAULTSETTING BOOLEAN :CIM-NAME "DefaultSetting" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "If an element whose characteristics are described by the associated Capabilities instance has a dependent element created or modified without specifying an associated SettingData instance, then the default SettingData will be used in that operation."))
                :INITFORM "false")
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The StorageCapabilities.") :KEY)
                :INITFORM "CIM_StorageCapabilities")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The temporary and client generated StorageSetting.")
                 :KEY)
                :INITFORM "CIM_StorageSetting"))
              (:CIM-NAME "CIM_StorageSettingsGeneratedFromCapabilities")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageServices")
               (:DESCRIPTION
                "This association define StorageSettings that reflect the capabilities of the associated StorageCapabilities. The associated StorageSetting may not define the operational characteristics (through settings properties) of any storage element. StorageSettingsGeneratedFromCapabilities is the association between instances of StorageCapabilities and those instances of StorageSetting that have been created from the StorageCapabilities instance using the StorageCapabilities \"CreateSetting\" method. These settings have a StorageSetting.ChangeableType of \"Changeable - Transient\" or \"Changeable - Persistent\" The settings associated by this class reflect the capabilities from which they are generated. These setting SHALL be associated with one StorageCapabilities. 
A generated setting can be deleted by the implementation at any time if it is a a StorageSetting of \"Changed - Transient\" ChangeableType. 
A client should not use this association to find transient Settings to subsequently modify and/or use because that would increase the likelihood of setting contention across clients. Instead the implementation uses this association to define transient settings, which can be located through any means, that have special temporal based life cycle. 
DefaultSetting is meaningless in this class.")))