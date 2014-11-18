
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SettingContext.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SETTINGCONTEXT NIL
              ((CONTEXT NIL :CIM-NAME "Context" :QUALIFIERS
                ((:DEPRECATED ("CIM_ConcreteComponent.GroupComponent")) :KEY
                 :AGGREGATE
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated. Deprecated description: The Configuration object that aggregates the Setting."))
                :INITFORM "CIM_Configuration")
               (SETTING NIL :CIM-NAME "Setting" :QUALIFIERS
                ((:DEPRECATED ("CIM_ConcreteComponent.PartComponent")) :KEY
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated. Deprecated description: An aggregated Setting."))
                :INITFORM "CIM_Setting"))
              (:CIM-NAME "CIM_SettingContext")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_ConcreteComponent"))
               (NIL "true") (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Settings")
               (:DESCRIPTION
                "Note: The Configuration class is being deprecated in lieu of using a ConcreteComponent relationship to indicate a hierarchy of instances of Setting or SettingData. Therefore, the aggregation of Settings into Configurations is replaced by the ConcreteComponent relationship between instances of Settings and SettingData. 
Deprecated description: This relationship associates Configuration objects with Setting objects. For example, Settings of a NetworkAdapter could change based on the site or network to which its hosting ComputerSystem is attached. In this case, the ComputerSystem would have two different Configuration objects, corresponding to the differences in network configuration for the two network segments. Configuration A would aggregate a Setting object for the NetworkAdapter when operating on segment \"ANet\", whereas Configuration B would aggregate a different NetworkAdapter Setting object, specific to segment \"BNet\". Note that many Settings of the computer are independent of the network Configuration. For example, both Configurations A and B would aggregate the same Setting object for the MonitorResolution of the ComputerSystem.")))