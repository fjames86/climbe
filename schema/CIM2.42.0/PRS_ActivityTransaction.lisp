
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_ActivityTransaction.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_ACTIVITYTRANSACTION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The PRS_Activity.") :KEY)
                :INITFORM "PRS_Activity")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The PRS_Transaction.") :KEY)
                :INITFORM "PRS_Transaction"))
              (:CIM-NAME "PRS_ActivityTransaction")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION "Associates PRS_Activity with PRS_Transaction.")))