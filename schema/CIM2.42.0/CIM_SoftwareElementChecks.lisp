
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SoftwareElementChecks.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SOFTWAREELEMENTCHECKS NIL
              ((PHASE UINT16 :CIM-NAME "Phase" :QUALIFIERS
                      ((:DESCRIPTION
                        "The Phase property indicates whether the referenced Check is an in-state or a next-state Check.")
                       (:VALUE-MAP ("0" "1"))
                       (:VALUES ("In-State" "Next-State")))
                      :INITFORM NIL)
               (ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                (:KEY :AGGREGATE (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The SoftwareElement being checked."))
                :INITFORM "CIM_SoftwareElement")
               (CHECK NIL :CIM-NAME "Check" :QUALIFIERS
                (:KEY :WEAK (:DESCRIPTION "The Check for the element."))
                :INITFORM "CIM_Check"))
              (:CIM-NAME "CIM_SoftwareElementChecks")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Application::CheckAction")
               (:DESCRIPTION
                "This association ties a SoftwareElement to a specific Check to validate its state or its movement to the next state. Note that SoftwareElements in a running state cannot transition to another state. Therefore, the value of the Phase property is restricted to 0 (\"In-State\") for SoftwareElements in the running state.")))