
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SystemAdministrator.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SYSTEMADMINISTRATOR (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The administered system.") :KEY)
                :INITFORM "CIM_System")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The UserEntity that provides the admininstrative function for the associated system.")
                 :KEY)
                :INITFORM "CIM_UserEntity"))
              (:CIM-NAME "CIM_SystemAdministrator")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::User::Org")
               (:DESCRIPTION
                "CIM_SystemAdministrator is an association used to identify the UserEntity as a system administrator of a CIM_System.")))