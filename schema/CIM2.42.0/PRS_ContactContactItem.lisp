
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_ContactContactItem.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_CONTACTCONTACTITEM (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The PRS_Contact.") :KEY)
                :INITFORM "PRS_Contact")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1")
                 (:DESCRIPTION
                  "The PRS_ContactItem, either PRS_Person or PRS_Organization. There is always at least one PRS_ContactItem, however it may be either a PRS_Person or PRS_Organization. For that reason, there is a minimum cardinality of one for this property, but a minimum cardinality of zero in the classes derived from this class.")
                 :KEY)
                :INITFORM "PRS_ContactItem"))
              (:CIM-NAME "PRS_ContactContactItem")
              (:QUALIFIERS :ASSOCIATION :ABSTRACT (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "Abstract root class to associate PRS_Person or PRS_Organization and PRS_Contact.")))