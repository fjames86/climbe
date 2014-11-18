
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MoreRoleInfo.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MOREROLEINFO (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The Role which has more information.") :KEY)
                :INITFORM "CIM_Role")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "Additional data concerning the Role.") :KEY)
                :INITFORM "CIM_OtherRoleInformation"))
              (:CIM-NAME "CIM_MoreRoleInfo")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::User::Role")
               (:DESCRIPTION
                "CIM_MoreRoleInfo is an association used to extend the information in a CIM_Role class instance.")))