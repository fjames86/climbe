
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_ResolutionResource.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_RESOLUTIONRESOURCE (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The PRS_Resource.")
                 :KEY)
                :INITFORM "PRS_Resource")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The PRS_Resolution.")
                 :KEY)
                :INITFORM "PRS_Resolution"))
              (:CIM-NAME "PRS_ResolutionResource")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION "Associates PRS_Resolution with PRS_Resource.")))