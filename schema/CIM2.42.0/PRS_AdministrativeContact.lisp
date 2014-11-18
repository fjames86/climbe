
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_AdministrativeContact.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_ADMINISTRATIVECONTACT (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The PRS_Administrative instance.") :KEY)
                :INITFORM "PRS_Administrative")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1")
                 (:DESCRIPTION "The PRS_Contact.") :KEY)
                :INITFORM "PRS_Contact"))
              (:CIM-NAME "PRS_AdministrativeContact")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION "Associates PRS_Administrative and PRS_Contact.")))