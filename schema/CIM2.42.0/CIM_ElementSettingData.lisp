
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ElementSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ELEMENTSETTINGDATA NIL
              ((ISDEFAULT UINT16 :CIM-NAME "IsDefault" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumerated integer indicating that the referenced setting is a default setting for the element, or that this information is unknown.")
                 (:VALUE-MAP ("0" "1" "2"))
                 (:VALUES ("Unknown" "Is Default" "Is Not Default")))
                :INITFORM NIL)
               (ISCURRENT UINT16 :CIM-NAME "IsCurrent" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumerated integer indicating that the referenced setting is currently being used in the operation of the element, or that this information is unknown.")
                 (:VALUE-MAP ("0" "1" "2"))
                 (:VALUES ("Unknown" "Is Current" "Is Not Current")))
                :INITFORM NIL)
               (ISNEXT UINT16 :CIM-NAME "IsNext" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumerated integer indicating whether or not the referenced setting is the next setting to be applied. For example, the application could take place on a re-initialization, reset, reconfiguration request. This could be a permanent setting, or a setting used only one time, as indicated by the flag. If it is a permanent setting then the setting is applied every time the managed element reinitializes, until this flag is manually reset. However, if it is single use, then the flag is automatically cleared after the settings are applied. Also note that if this flag is specified (i.e. set to value other than \"Unknown\"), then this takes precedence over any SettingData that may have been specified as Default. For example: If the managed element is a computer system, and the value of this flag is \"Is Next\", then the setting will be effective next time the system resets. And, unless this flag is changed, it will persist for subsequent system resets. However, if this flag is set to \"Is Next For Single Use\", then this setting will only be used once and the flag would be reset after that to \"Is Not Next\". So, in the above example, if the system reboots in a quick succession, the setting will not be used at the second reboot.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES
                  ("Unknown" "Is Next" "Is Not Next"
                   "Is Next For Single Use")))
                :INITFORM NIL)
               (MANAGEDELEMENT NIL :CIM-NAME "ManagedElement" :QUALIFIERS
                (:KEY (:DESCRIPTION "The managed element.")) :INITFORM
                "CIM_ManagedElement")
               (SETTINGDATA NIL :CIM-NAME "SettingData" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The SettingData object associated with the element."))
                :INITFORM "CIM_SettingData"))
              (:CIM-NAME "CIM_ElementSettingData")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.19.1")
               (:UML-PACKAGE-PATH "CIM::Core::Settings")
               (:DESCRIPTION
                "ElementSettingData represents the association between ManagedElements and applicable setting data. This association also describes whether this is a default or current setting.")))