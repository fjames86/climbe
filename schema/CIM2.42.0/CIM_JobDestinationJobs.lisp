
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_JobDestinationJobs.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_JOBDESTINATIONJOBS (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The JobDestination, possibly a queue.") :KEY)
                :INITFORM "CIM_JobDestination")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The Job that is in the Job queue/Destination.")
                 :KEY)
                :INITFORM "CIM_Job"))
              (:CIM-NAME "CIM_JobDestinationJobs")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::Processing")
               (:DESCRIPTION
                "An association describing where a Job is submitted for processing, ie to which JobDestination.")))