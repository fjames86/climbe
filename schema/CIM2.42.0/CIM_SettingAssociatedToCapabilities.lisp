
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SettingAssociatedToCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SETTINGASSOCIATEDTOCAPABILITIES (CIM_DEPENDENCY)
              ((DEFAULTSETTING BOOLEAN :CIM-NAME "DefaultSetting" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "If an element whose characteristics are described by the associated Capabilities instance has a dependent element created or modified without specifying an associated SettingData instance, then the default SettingData will be used in that operation."))
                :INITFORM "false")
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The Capabilities.")
                 :KEY)
                :INITFORM "CIM_Capabilities")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The Setting.") :KEY)
                :INITFORM "CIM_SettingData"))
              (:CIM-NAME "CIM_SettingAssociatedToCapabilities")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.11.0")
               (:UML-PACKAGE-PATH "CIM::System::FilesystemServices")
               (:DESCRIPTION
                "This association defines settings that can be used to create or modify elements. Unlike ElementSettingData, these settings are not used to express the characteristics of existing managed elements. 
Typically, the capabilities associated with this class define the characteristics of a service in creating or modifying elements that are dependent on the service directly or indirectly. A CIM Client may use this association to find SettingData instances that can be used to create or modify these dependent elements.")))