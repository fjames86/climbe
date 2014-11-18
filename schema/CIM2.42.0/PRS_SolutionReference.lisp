
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_SolutionReference.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_SOLUTIONREFERENCE (PRS_SOLUTIONHASELEMENT)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The PRS_Solution root object of the Solution.")
                 :KEY)
                :INITFORM "PRS_Solution")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The PRS_Reference aggregated into the Solution.")
                 :KEY)
                :INITFORM "PRS_Reference"))
              (:CIM-NAME "PRS_SolutionReference")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "PRS_SolutionReference aggregates a Reference into a Solution.")))