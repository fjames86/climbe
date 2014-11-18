
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PrinterServicingQueue.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRINTERSERVICINGQUEUE (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "A destination Printer for Jobs enqueued on the Dependent Queue.")
                 :KEY)
                :INITFORM "CIM_Printer")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "A Queue that is providing Jobs to the Printer.")
                 :KEY)
                :INITFORM "CIM_PrintQueue"))
              (:CIM-NAME "CIM_PrinterServicingQueue")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::Printing")
               (:DESCRIPTION
                "This association indicates that PrintJobs can be passed to a Printer from a particular Queue.")))