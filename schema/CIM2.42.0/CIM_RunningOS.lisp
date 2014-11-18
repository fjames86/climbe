
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RunningOS.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_RUNNINGOS (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "The OperatingSystem currently running on the ComputerSystem.")
                 :KEY)
                :INITFORM "CIM_OperatingSystem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "The ComputerSystem.") :KEY)
                :INITFORM "CIM_ComputerSystem"))
              (:CIM-NAME "CIM_RunningOS")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::OperatingSystem")
               (:DESCRIPTION
                "RunningOS indicates the currently executing OperatingSystem. At most one OperatingSystem can execute at any time on a ComputerSystem. 'At most one' is specified, since the Computer System may not be currently booted, or its OperatingSystem may be unknown.")))