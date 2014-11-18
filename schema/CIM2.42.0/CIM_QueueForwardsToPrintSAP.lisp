
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_QueueForwardsToPrintSAP.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_QUEUEFORWARDSTOPRINTSAP (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The PrintSAP for the PrintService.") :KEY)
                :INITFORM "CIM_PrintSAP")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The PrintQueue that forwards Jobs to the SAP.")
                 :KEY)
                :INITFORM "CIM_PrintQueue"))
              (:CIM-NAME "CIM_QueueForwardsToPrintSAP")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::Printing")
               (:DESCRIPTION
                "This association indicates that the Jobs from a PrintQueue can be sent to the referenced PrintSAP, to be handled by the backing PrintService of the SAP.")))