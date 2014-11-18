
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_Categorization.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_CATEGORIZATION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The PRS_Category used for classification.")
                 :KEY)
                :INITFORM "PRS_Category")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1")
                 (:DESCRIPTION
                  "The specific PRS_Reference, PRS_Problem or PRS_Resolution classified by this association.")
                 :KEY)
                :INITFORM "PRS_SolutionElement"))
              (:CIM-NAME "PRS_Categorization")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "PRS_Categorization associates PRS_Reference, PRS_Problem or PRS_Resolution with a PRS_Category for classification purposes. For example, a Category named 'Printing Issues' can be defined for a Problem using the Categorization association between a PRS_Problem and a PRS_Category.")))