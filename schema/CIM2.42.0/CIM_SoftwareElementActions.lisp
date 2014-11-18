
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SoftwareElementActions.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SOFTWAREELEMENTACTIONS NIL
              ((ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                (:KEY :AGGREGATE (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The element that scopes the Action."))
                :INITFORM "CIM_SoftwareElement")
               (ACTION NIL :CIM-NAME "Action" :QUALIFIERS
                (:KEY :WEAK
                 (:DESCRIPTION
                  "The software Action to move or uninstall a SoftwareElement."))
                :INITFORM "CIM_Action"))
              (:CIM-NAME "CIM_SoftwareElementActions")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::CheckAction")
               (:DESCRIPTION
                "This association identifies the Actions for a Software Element.")))