
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_StatementFeature.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_STATEMENTFEATURE (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The PRS_Statement.")
                 :KEY)
                :INITFORM "PRS_Statement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The PRS_Feature.")
                 :KEY)
                :INITFORM "PRS_Feature"))
              (:CIM-NAME "PRS_StatementFeature")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION "Associates PRS_Statement with PRS_Feature.")))