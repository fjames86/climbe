
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DatabaseStorage.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DATABASESTORAGE (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The database that makes use of the associated DatabaseStorageArea.")
                 :KEY)
                :INITFORM "CIM_CommonDatabase")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "A DatabaseStorageArea that is used by the associated CommonDatabase. A DatabaseStorageArea must only be used by a single database.")
                 :KEY)
                :INITFORM "CIM_DatabaseStorageArea"))
              (:CIM-NAME "CIM_DatabaseStorage")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Database::Storage")
               (:DESCRIPTION
                "Databases are comprised of a collection of logical storage areas that are represented by instances of the DatabaseStorageArea class. The DatabaseStorage class represents the relationship between a CommonDatabase and the storage areas that it uses.")))