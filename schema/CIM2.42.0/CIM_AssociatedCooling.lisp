
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssociatedCooling.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSOCIATEDCOOLING (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The CoolingDevice.")
                 :KEY)
                :INITFORM "CIM_CoolingDevice")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The ManagedSystemElement being cooled.") :KEY)
                :INITFORM "CIM_ManagedSystemElement"))
              (:CIM-NAME "CIM_AssociatedCooling")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.19.1")
               (:UML-PACKAGE-PATH "CIM::Device::CoolingAndPower")
               (:DESCRIPTION
                "The CIM_AssociatedCooling relationship indicates what ManagedSystemElement(s) the fan or cooling device is providingcooling for.")))