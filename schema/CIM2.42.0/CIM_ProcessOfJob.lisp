
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProcessOfJob.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PROCESSOFJOB (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "Execution of the Job results in the creation of the Process referenced as PartComponent. The Job aggregates the Process(es) that are created when it is executed.")
                 :KEY)
                :INITFORM "CIM_Job")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The Process that results from the execution of the Job.")
                 :KEY)
                :INITFORM "CIM_Process"))
              (:CIM-NAME "CIM_ProcessOfJob")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::System::Processing")
               (:DESCRIPTION
                "ProcessOfJob describes that the referenced Process is the result of the execution of the Job. A Job may cause multiple Processes to run, perhaps on different operating systems. This is allowed by the '*' cardinality of the Process reference. Note that a Process can result from only one Job - hence, the '0..1' cardinality on Job.")))