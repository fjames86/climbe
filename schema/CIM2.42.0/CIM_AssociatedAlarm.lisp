
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssociatedAlarm.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSOCIATEDALARM (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The AlarmDevice.")
                 :KEY)
                :INITFORM "CIM_AlarmDevice")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The LogicalDevice that is alarmed.") :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_AssociatedAlarm")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::Sensors")
               (:DESCRIPTION
                "LogicalDevices may have one or more AlarmDevices associated with them, in order to indicate problem situations. This relationship is indicated by the AssociatedAlarm dependency.")))