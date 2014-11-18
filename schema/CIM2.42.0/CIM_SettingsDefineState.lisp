
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SettingsDefineState.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SETTINGSDEFINESTATE NIL
              ((MANAGEDELEMENT NIL :CIM-NAME "ManagedElement" :QUALIFIERS
                (:KEY (:DESCRIPTION "The managed element.")) :INITFORM
                "CIM_ManagedElement")
               (SETTINGDATA NIL :CIM-NAME "SettingData" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The SettingData object that provides additional information about the current state and configuration of the ManagedElement."))
                :INITFORM "CIM_SettingData"))
              (:CIM-NAME "CIM_SettingsDefineState")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Core::Settings")
               (:DESCRIPTION
                "SettingsDefineState is used to associate an instance of SettingData with an instance of ManagedElement. This association indicates that the SettingData instance provides additional information about the Current State of the associated ManagedElement. State is broadly defined to include the configuration, status, capabilities, and other information of an instance. 
Use of the same instance of SettingData to represent more than one of Current State (SettingsDefineState) and Desired State (ElementSettingData) and Possible State (SettingsDefineCapabilities) for a ManagedElement is not recommended.")))