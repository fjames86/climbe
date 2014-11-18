
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeJDBCResourceUsesDataSource.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EEJDBCRESOURCEUSESDATASOURCE (CIM_HOSTEDDEPENDENCY)
              ((DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The JDBC Resource that requires a Data Source.")
                 :KEY)
                :INITFORM "CIM_J2eeJDBCResource")
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION
                  "The Data Source that is being used by a JDBC Resource.")
                 (:MAX "1") :KEY)
                :INITFORM "CIM_J2eeJDBCDataSource"))
              (:CIM-NAME "CIM_J2eeJDBCResourceUsesDataSource")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServer")
               (:DESCRIPTION
                "CIM_J2eeJDBCResourceUsesDataSource is an association that identifies the JDBC data sources that are available to a CIM_J2eeJDBCResource.")))