
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_AdminAssociation.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_ADMINASSOCIATION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The PRS_ExchangeElement.") :KEY)
                :INITFORM "PRS_ExchangeElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The PRS_Administrative object.") :KEY)
                :INITFORM "PRS_Administrative"))
              (:CIM-NAME "PRS_AdminAssociation")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "Associates PRS_Administrative data with any object derived from PRS_ExchangeElement.")))