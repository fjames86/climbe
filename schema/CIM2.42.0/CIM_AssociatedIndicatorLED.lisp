
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssociatedIndicatorLED.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSOCIATEDINDICATORLED (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION
                  "The ManagedSystemElement that has an associated LED.")
                 :KEY)
                :INITFORM "CIM_ManagedSystemElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The LED.") :KEY)
                :INITFORM "CIM_IndicatorLED"))
              (:CIM-NAME "CIM_AssociatedIndicatorLED")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Device::LED")
               (:DESCRIPTION
                "ManagedSystemElements may have zero or more IndicatorLEDs associated with them, in order to indicate problem situations. This relationship is indicated by the AssociatedIndicatorLED dependency.")))