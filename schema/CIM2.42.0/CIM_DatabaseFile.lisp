
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DatabaseFile.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DATABASEFILE (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The single CommonDatabase instance that uses the referenced LogicalFile.")
                 :KEY)
                :INITFORM "CIM_CommonDatabase")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "One of any number of LogicalFile instances that are utilized by the referenced CommonDatabase.")
                 :KEY)
                :INITFORM "CIM_LogicalFile"))
              (:CIM-NAME "CIM_DatabaseFile")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Database::Storage")
               (:DESCRIPTION
                "DatabaseFile captures the relationship between a database and the supporting files that make up the database as well as the purpose served by the files within the context of the database.")))