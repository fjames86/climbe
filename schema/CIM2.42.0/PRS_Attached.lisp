
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_Attached.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_ATTACHED (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The PRS_Attachment.")
                 :KEY)
                :INITFORM "PRS_Attachment")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1")
                 (:DESCRIPTION "The PRS_ExchangeElement.") :KEY)
                :INITFORM "PRS_ExchangeElement"))
              (:CIM-NAME "PRS_Attached")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "Associates PRS_Attachment with PRS_ExchangeElement.")))