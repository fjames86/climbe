
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SwitchesAmong.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SWITCHESAMONG (CIM_FORWARDSAMONG)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The switch port.")
                 :KEY)
                :INITFORM "CIM_SwitchPort")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "The switching service.") :KEY)
                :INITFORM "CIM_SwitchService"))
              (:CIM-NAME "CIM_SwitchesAmong")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::SwitchingBridging")
               (:DESCRIPTION
                "A SwitchService switches frames between SwitchPorts. This association makes that relationship explicit.")))