
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssociatedSensor.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSOCIATEDSENSOR (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The Sensor.") :KEY)
                :INITFORM "CIM_Sensor")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The ManagedSystemElement for which information is measured by the Sensor.")
                 :KEY)
                :INITFORM "CIM_ManagedSystemElement"))
              (:CIM-NAME "CIM_AssociatedSensor")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.19.1")
               (:UML-PACKAGE-PATH "CIM::Device::Sensors")
               (:DESCRIPTION
                "The CIM_AssociatedCooling relationship indicates what ManagedSystemElement(s) the fan or cooling device is providingcooling for.")))