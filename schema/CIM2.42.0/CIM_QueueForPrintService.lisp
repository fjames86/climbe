
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_QueueForPrintService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_QUEUEFORPRINTSERVICE (CIM_DEPENDENCY)
              ((QUEUEACCEPTINGFROMSERVICE BOOLEAN :CIM-NAME
                "QueueAcceptingFromService" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates that the PrintService can accept Jobs and place them on the Queue.")
                 (:MAPPING-STRINGS
                  ("RFC2911.IETF|Printer.printer-is-accepting-jobs")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The PrintQueue that the Service utilizes.")
                 :KEY)
                :INITFORM "CIM_PrintQueue")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The PrintService that puts Jobs on the Queue.")
                 :KEY)
                :INITFORM "CIM_PrintService"))
              (:CIM-NAME "CIM_QueueForPrintService")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.14.0")
               (:UML-PACKAGE-PATH "CIM::Device::Printing")
               (:DESCRIPTION
                "This association indicates that a PrintService utilizes a particular PrintQueue.")))