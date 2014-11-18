
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssociatedDatabaseSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSOCIATEDDATABASESYSTEM (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION
                  "The database system that is responsible for the database.")
                 :KEY)
                :INITFORM "CIM_DatabaseSystem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The database.") :KEY)
                :INITFORM "CIM_CommonDatabase"))
              (:CIM-NAME "CIM_AssociatedDatabaseSystem")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Database::System")
               (:DESCRIPTION
                "The CIM_AssociatedDatabaseSystem association identifies the database system that is responsible for the database.")))