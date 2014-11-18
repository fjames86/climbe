
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ElementConfiguration.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ELEMENTCONFIGURATION NIL
              ((ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_ElementSettingData.ManagedElement"
                   "CIM_ElementSetting.Element"))
                 :KEY
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated. Deprecated description: The ManagedSystemElement."))
                :INITFORM "CIM_ManagedSystemElement")
               (CONFIGURATION NIL :CIM-NAME "Configuration" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_ElementSettingData.SettingData"
                   "CIM_ElementSetting.Setting"))
                 :KEY
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated. Deprecated description: The Configuration object that groups the Settings and dependencies that are associated with the ManagedSystemElement."))
                :INITFORM "CIM_Configuration"))
              (:CIM-NAME "CIM_ElementConfiguration")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ElementSettingData" "CIM_ElementSetting"))
               (:VERSION "2.10.0") (:UML-PACKAGE-PATH "CIM::Core::Settings")
               (:DESCRIPTION
                "Note: The Configuration class is being deprecated in lieu of using a ConcreteComponent relationship to indicate a hierarchy of Setting or SettingData instances. This association allows the reuse of the element to Setting or SettingData associations instead of defining a peer association specifically for Configurations. 
Deprecated description: This association relates a Configuration object to one or more ManagedSystemElements. The Configuration object represents a certain behavior or a desired functional state for the associated ManagedSystemElements.")))