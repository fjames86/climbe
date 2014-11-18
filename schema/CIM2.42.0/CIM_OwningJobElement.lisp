
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OwningJobElement.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_OWNINGJOBELEMENT NIL
              ((OWNINGELEMENT NIL :CIM-NAME "OwningElement" :QUALIFIERS
                (:KEY (:MAX "1")
                 (:DESCRIPTION
                  "The ManagedElement responsible for the creation of the Job."))
                :INITFORM "CIM_ManagedElement")
               (OWNEDELEMENT NIL :CIM-NAME "OwnedElement" :QUALIFIERS
                (:KEY (:DESCRIPTION "The Job created by the ManagedElement."))
                :INITFORM "CIM_Job"))
              (:CIM-NAME "CIM_OwningJobElement")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::System::Processing")
               (:DESCRIPTION
                "OwningJobElement represents an association between a Job and the ManagedElement responsible for the creation of the Job. This association may not be possible, given that the execution of jobs can move between systems and that the lifecycle of the creating entity may not persist for the total duration of the job. However, this can be very useful information when available. This association defines a more specific 'owner' than is provided by the CIM_Job.Owner string.")
               (:MODEL-CORRESPONDENCE ("CIM_Job.Owner"))))