
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_ExpressionLink.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_EXPRESSIONLINK (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The parent PRS_Expression.") (:MAX "1") :KEY)
                :INITFORM "PRS_Expression")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1")
                 (:DESCRIPTION
                  "The child PRS_ExpressionElement, either a PRS_Expression, PRS_Product or PRS_Statement.")
                 :KEY)
                :INITFORM "PRS_ExpressionElement"))
              (:CIM-NAME "PRS_ExpressionLink")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "Associates a PRS_Expression with PRS_ExpressionElements such as PRS_Expression, PRS_Product, and PRS_Statement.")))