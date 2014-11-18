
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SystemAdministratorRole.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SYSTEMADMINISTRATORROLE (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The administered system.") :KEY)
                :INITFORM "CIM_System")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The system administration role.") :KEY)
                :INITFORM "CIM_Role"))
              (:CIM-NAME "CIM_SystemAdministratorRole")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::User::Role")
               (:DESCRIPTION
                "CIM_SystemAdministratorRole is an association used to identify a system administrator Role for a CIM_System.")))