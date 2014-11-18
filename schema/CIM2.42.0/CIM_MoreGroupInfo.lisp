
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MoreGroupInfo.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MOREGROUPINFO (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The Group which has more information.") :KEY)
                :INITFORM "CIM_Group")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "Additional data concerning the Group.") :KEY)
                :INITFORM "CIM_OtherGroupInformation"))
              (:CIM-NAME "CIM_MoreGroupInfo")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::User::Group")
               (:DESCRIPTION
                "CIM_MoreGroupInfo is an association used to extend the information in a CIM_Group class instance.")))