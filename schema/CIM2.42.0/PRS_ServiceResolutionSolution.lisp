
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_ServiceResolutionSolution.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_SERVICERESOLUTIONSOLUTION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The PRS_ServiceIncident.") :KEY)
                :INITFORM "PRS_ServiceIncident")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The PRS_Solution. PRS_Solution must be associated with at least one Resolution.")
                 :KEY)
                :INITFORM "PRS_Solution"))
              (:CIM-NAME "PRS_ServiceResolutionSolution")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "Associates PRS_ServiceIncident to PRS_Solution to describe the Resolutions proposed by the Service Provider.")))