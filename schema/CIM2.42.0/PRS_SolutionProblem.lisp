
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_SolutionProblem.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_SOLUTIONPROBLEM (PRS_SOLUTIONHASELEMENT)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The PRS_Solution root object of the Solution.")
                 :KEY)
                :INITFORM "PRS_Solution")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The PRS_Problem aggregated into the Solution.")
                 :KEY)
                :INITFORM "PRS_Problem"))
              (:CIM-NAME "PRS_SolutionProblem")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "PRS_SolutionProblem aggregates a Problem into a Solution.")))