
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DependencyContext.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DEPENDENCYCONTEXT NIL
              ((CONTEXT NIL :CIM-NAME "Context" :QUALIFIERS
                ((:DEPRECATED ("No value")) :KEY :AGGREGATE
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated. Deprecated description: The Configuration object that aggregates the Dependency."))
                :INITFORM "CIM_Configuration")
               (DEPENDENCY NIL :CIM-NAME "Dependency" :QUALIFIERS
                ((:DEPRECATED ("No value")) :KEY
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated. Deprecated description: An aggregated Dependency."))
                :INITFORM "CIM_Dependency"))
              (:CIM-NAME "CIM_DependencyContext")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value")) (NIL "true")
               (:VERSION "2.10.0") (:UML-PACKAGE-PATH "CIM::Core::Settings")
               (:DESCRIPTION
                "Note: The Configuration class is being deprecated in lieu of using a ConcreteComponent relationship to indicate a hierarchy of Setting or SettingData instances. Therefore, this association is also deprecated but it is deprecated to \"No value\" because there are no equivalent relationships currently defined for the Setting or SettingData classes. This association is an anomaly because it defines what cannot be expressed for the components of the Configuration. Also, it singles out the Dependency association as opposed to allowing any relationships to be defined as \"settings\". Its use in the industry is discouraged. 
Deprecated description: This relationship associates a Dependency with one or more Configuration objects. For example, dependencies for a ComputerSystem could change based on the site or network to which the System is attached.")))