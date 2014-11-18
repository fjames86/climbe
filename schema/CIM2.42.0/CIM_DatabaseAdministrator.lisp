
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DatabaseAdministrator.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DATABASEADMINISTRATOR (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The database that is being administered.")
                 :KEY)
                :INITFORM "CIM_CommonDatabase")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The user entity that is responsible for the administration of the database.")
                 :KEY)
                :INITFORM "CIM_UserEntity"))
              (:CIM-NAME "CIM_DatabaseAdministrator")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Database::System")
               (:DESCRIPTION
                "The DatabaseAdministrator association identifies a UserEntity as a database administrator of a CommonDatabase. 
The current version of CIM includes a UserContact class that is concrete and extends from UserEntity. UserContact contains the information that is needed to contact a database administrator. The DatabaseAdministrator association should be implemented through the UserContact class in favor of creating a vendor-specific concrete class to define database administrator contact information for the database administrator.")))