
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MorePersonInfo.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MOREPERSONINFO (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The Person which has more information.") :KEY)
                :INITFORM "CIM_Person")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "Additional data concerning the Person.") :KEY)
                :INITFORM "CIM_OtherPersonInformation"))
              (:CIM-NAME "CIM_MorePersonInfo")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::User::Org")
               (:DESCRIPTION
                "CIM_MorePersonInfo is an association used to extend the information in a CIM_Person class instance.")))