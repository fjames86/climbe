
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SystemAdministratorGroup.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SYSTEMADMINISTRATORGROUP (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The administered system.") :KEY)
                :INITFORM "CIM_System")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The Group of administrators.") :KEY)
                :INITFORM "CIM_Group"))
              (:CIM-NAME "CIM_SystemAdministratorGroup")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::User::Group")
               (:DESCRIPTION
                "CIM_SystemAdministratorGroup is an association used to identify a Group that has system administrator responsibilities for a CIM_System.")))