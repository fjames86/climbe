
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PrinterServicingJob.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRINTERSERVICINGJOB (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The destination Printer for a PrintJob.") :KEY)
                :INITFORM "CIM_Printer")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The PrintJob.") :KEY)
                :INITFORM "CIM_PrintJob"))
              (:CIM-NAME "CIM_PrinterServicingJob")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::Printing")
               (:DESCRIPTION
                "This association indicates that a Printer is currently servicing a particular PrintJob.")))