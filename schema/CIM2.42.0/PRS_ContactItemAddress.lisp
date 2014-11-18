
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_ContactItemAddress.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_CONTACTITEMADDRESS (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The PRS_ContactItem.") :KEY)
                :INITFORM "PRS_ContactItem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The PRS_Address.")
                 :KEY)
                :INITFORM "PRS_Address"))
              (:CIM-NAME "PRS_ContactItemAddress")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION "Associates PRS_ContactItem with PRS_Address.")))