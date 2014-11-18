
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_SolutionCategory.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_SOLUTIONCATEGORY (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The PRS_Solution being classified.") :KEY)
                :INITFORM "PRS_Solution")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The specific PRS_Category being used to classify the Solution.")
                 :KEY)
                :INITFORM "PRS_Category"))
              (:CIM-NAME "PRS_SolutionCategory")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "PRS_SolutionCategory associates PRS_Solution with a PRS_Category for classification purposes.")))