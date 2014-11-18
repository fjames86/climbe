
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_SolutionExpression.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_SOLUTIONEXPRESSION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The PRS_SolutionElement.") :KEY)
                :INITFORM "PRS_SolutionElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1")
                 (:DESCRIPTION "The PRS_Expression.") :KEY)
                :INITFORM "PRS_Expression"))
              (:CIM-NAME "PRS_SolutionExpression")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "Associates PRS_SolutionElements (PRS_Reference, PRS_Problem or PRS_Resolution) with PRS_Expressions.")))