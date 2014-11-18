
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DatabaseControlFile.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DATABASECONTROLFILE (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "0") (:MAX "1")
                 (:DESCRIPTION
                  "The parent CommonDatabase for the associated control file.")
                 :KEY)
                :INITFORM "CIM_CommonDatabase")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The LogicalFile that contains control information for the associated CommonDatabase.")
                 :KEY)
                :INITFORM "CIM_LogicalFile"))
              (:CIM-NAME "CIM_DatabaseControlFile")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10")
               (:UML-PACKAGE-PATH "CIM::Database::Storage")
               (:DESCRIPTION
                "CIM_DatabaseControlFile is a specialization of the CIM_Dependency association that identifies the LogicalFiles that provide control information for a Database. As an example, some implementations of CommonDatabase assign particular significance to a small number of files that contain database state and configuration information. This association is intended to provide an efficient means of identifying these files.")))