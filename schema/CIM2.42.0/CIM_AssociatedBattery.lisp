
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssociatedBattery.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSOCIATEDBATTERY (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The Battery.") :KEY)
                :INITFORM "CIM_Battery")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The LogicalDevice that needs or is associated with the Battery.")
                 :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_AssociatedBattery")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::CoolingAndPower")
               (:DESCRIPTION
                "A LogicalDevice might use or require one or more Batteries. This relationship is described by the AssociatedBattery dependency. It is also possible to model the individual Batteries that comprise a UPS, using this association.")))