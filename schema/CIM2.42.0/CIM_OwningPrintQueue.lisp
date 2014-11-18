
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OwningPrintQueue.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_OWNINGPRINTQUEUE (CIM_JOBDESTINATIONJOBS)
              ((QUEUEPOSITION UINT32 :CIM-NAME "QueuePosition" :QUALIFIERS
                ((:DESCRIPTION
                  "The position of the PrintJob on the Queue. The head of the Queue is indicated by a value of 1 with higher values being used to represent Jobs that are further away from the head of the Queue. A QueuePosition of 0 indicates that the Job has completed (either with or without error).")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Job-Monitoring-MIB.jmNumberOfInterveningJobs"
                   "MIB.IETF|Job-Monitoring-MIB.jmJobState"
                   "RFC2911.IETF|Job.number-of-intervening-jobs"
                   "RFC2911.IETF|Job.job-state")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The PrintQueue on which the Job is held.")
                 :KEY)
                :INITFORM "CIM_PrintQueue")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") :WEAK (:DESCRIPTION "The PrintJob.")
                 :KEY)
                :INITFORM "CIM_PrintJob"))
              (:CIM-NAME "CIM_OwningPrintQueue")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.14.0")
               (:UML-PACKAGE-PATH "CIM::Device::Printing")
               (:DESCRIPTION
                "This association indicates which Queue holds a PrintJob and where the Job is located within that Queue. A Job can remain on its final Queue when it has been printed with a PrintJobStatus of \"Complete\" or \"Completed With Error\".")))