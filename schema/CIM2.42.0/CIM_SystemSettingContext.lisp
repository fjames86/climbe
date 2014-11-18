
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SystemSettingContext.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SYSTEMSETTINGCONTEXT NIL
              ((CONTEXT NIL :CIM-NAME "Context" :QUALIFIERS
                ((:DEPRECATED ("CIM_ConcreteComponent.GroupComponent")) :KEY
                 :AGGREGATE
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated. Deprecated description: The Configuration object that aggregates the Setting."))
                :INITFORM "CIM_SystemConfiguration")
               (SETTING NIL :CIM-NAME "Setting" :QUALIFIERS
                ((:DEPRECATED ("CIM_ConcreteComponent.PartComponent")) :KEY
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated. Deprecated description: An aggregated Setting."))
                :INITFORM "CIM_SystemSetting"))
              (:CIM-NAME "CIM_SystemSettingContext")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_ConcreteComponent"))
               (NIL "true") (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Settings")
               (:DESCRIPTION
                "Note: The Configuration and SystemConfiguration classes are deprecated in lieu of using a ConcreteComponent relationship to indicate a hierarchy of Settings or SettingData instances. Therefore, the aggregation of SystemSettings into System Configurations is replaced by the ConcreteComponent relationship between instances of Settings and SettingData. 
Deprecated description: This relationship associates System-specific Configuration objects with System-specific Setting objects, similar to the SettingContext association.")))