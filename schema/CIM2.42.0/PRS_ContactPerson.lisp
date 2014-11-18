
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_ContactPerson.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_CONTACTPERSON (PRS_CONTACTCONTACTITEM)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The PRS_Contact.") :KEY)
                :INITFORM "PRS_Contact")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1")
                 (:DESCRIPTION "The PRS_Person.") :KEY)
                :INITFORM "PRS_Person"))
              (:CIM-NAME "PRS_ContactPerson")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION "Associates PRS_Contact and PRS_Person.")))