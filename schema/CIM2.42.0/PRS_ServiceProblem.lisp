
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_ServiceProblem.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_SERVICEPROBLEM (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The PRS_ServiceIncident.") :KEY)
                :INITFORM "PRS_ServiceIncident")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "The PRS_Problem.") :KEY)
                :INITFORM "PRS_Problem"))
              (:CIM-NAME "PRS_ServiceProblem")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "Associates PRS_ServiceIncident to PRS_Problem to describe the Problem being submitted to the Service Provider.")))