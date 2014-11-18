
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_ServiceActivity.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_SERVICEACTIVITY (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The PRS_ServiceIncident.") :KEY)
                :INITFORM "PRS_ServiceIncident")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The PRS_Activity.")
                 :KEY)
                :INITFORM "PRS_Activity"))
              (:CIM-NAME "PRS_ServiceActivity")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "Associates PRS_ServiceIncident to PRS_Activity.")))