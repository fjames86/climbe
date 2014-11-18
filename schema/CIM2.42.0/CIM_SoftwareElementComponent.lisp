
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SoftwareElementComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SOFTWAREELEMENTCOMPONENT (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The parent element in the association.") :KEY)
                :INITFORM "CIM_SoftwareElement")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The child element in the association.") :KEY)
                :INITFORM "CIM_SoftwareElement"))
              (:CIM-NAME "CIM_SoftwareElementComponent")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::DeploymentModel")
               (:DESCRIPTION
                "SoftwareElements may have an arbitrarily complex hierarchy. SoftwareElementComponent is used to construct that hierarchy. It should not be used to represent dependency.")))