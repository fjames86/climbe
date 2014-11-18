
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_SolutionHasElement.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_SOLUTIONHASELEMENT (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The PRS_Solution root object of the Solution.")
                 :KEY)
                :INITFORM "PRS_Solution")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The PRS_Reference, PRS_Problem or PRS_Resolution aggregated into the Solution by this association.")
                 :KEY)
                :INITFORM "PRS_SolutionElement"))
              (:CIM-NAME "PRS_SolutionHasElement")
              (:QUALIFIERS :ASSOCIATION :ABSTRACT (NIL "true")
               (:VERSION "2.6.0") (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "PRS_SolutionHasElement is an abstract base class for associating PRS_Solution with objects derived from PRS_SolutionElement. This association class allows all PRS_Reference, PRS_Problem and PRS_Resolution objects to be retrieved with a single query.")))