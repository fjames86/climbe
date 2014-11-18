
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_USBPortOnHub.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_USBPORTONHUB (CIM_PORTONDEVICE)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The Hub that includes the USBPort.") :KEY)
                :INITFORM "CIM_USBHub")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1")
                 (:DESCRIPTION "The Port on the USBHub.") :KEY)
                :INITFORM "CIM_USBPort"))
              (:CIM-NAME "CIM_USBPortOnHub")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::USB")
               (:DESCRIPTION
                "USBPortOnHub associates a USBPort or connection point with the USBHub that includes it.")))