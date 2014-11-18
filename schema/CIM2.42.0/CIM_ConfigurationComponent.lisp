
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ConfigurationComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CONFIGURATIONCOMPONENT NIL
              ((CONFIGGROUP NIL :CIM-NAME "ConfigGroup" :QUALIFIERS
                ((:DEPRECATED ("CIM_ConcreteComponent.GroupComponent")) :KEY
                 :AGGREGATE
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated. Deprecated description: The Configuration that aggregates additional Configurations."))
                :INITFORM "CIM_Configuration")
               (CONFIGCOMPONENT NIL :CIM-NAME "ConfigComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ConcreteComponent.PartComponent")) :KEY
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated. Deprecated description: A Configuration that is part of a \"higher-level\" Configuration."))
                :INITFORM "CIM_Configuration"))
              (:CIM-NAME "CIM_ConfigurationComponent")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_ConcreteComponent"))
               (NIL "true") (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Settings")
               (:DESCRIPTION
                "Note: The Configuration class is being deprecated in lieu of using a ConcreteComponent relationship to indicate a hierarchy of instances of Setting or SettingData. Deprecated description: ConfigurationComponent aggregates \"lower-level\" Configuration objects into a \"high-level\" Configuration. This association enables the assembly of complex configurations by grouping together simpler ones. For example, a logon policy for the United States could consist of two Configuration groups, one for the East Coast and one for the West Coast. Each of these groups could in turn consist of multiple Configurations to handle different aspects of the logon process.")))