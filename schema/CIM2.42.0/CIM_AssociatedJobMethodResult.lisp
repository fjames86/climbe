
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssociatedJobMethodResult.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSOCIATEDJOBMETHODRESULT NIL
              ((JOB NIL :CIM-NAME "Job" :QUALIFIERS
                (:KEY (:MAX "1") (:DESCRIPTION "The associated ConcreteJob."))
                :INITFORM "CIM_ConcreteJob")
               (JOBPARAMETERS NIL :CIM-NAME "JobParameters" :QUALIFIERS
                (:KEY (:MAX "1") (:DESCRIPTION "The associated MethodResult."))
                :INITFORM "CIM_MethodResult"))
              (:CIM-NAME "CIM_AssociatedJobMethodResult")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.31.0")
               (:UML-PACKAGE-PATH "CIM::System::Processing")
               (:DESCRIPTION
                "AssociatedJobMethodResult represents an association between a ConcreteJob and the MethodResult expressing the parameters for the Job when the job was created by side-effect of the execution of an extrinsic method.")))