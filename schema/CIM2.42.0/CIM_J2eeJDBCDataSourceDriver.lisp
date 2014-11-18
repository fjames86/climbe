
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeJDBCDataSourceDriver.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EEJDBCDATASOURCEDRIVER (CIM_HOSTEDDEPENDENCY)
              ((DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1")
                 (:DESCRIPTION "The hosted ManagedElement.") :KEY)
                :INITFORM "CIM_J2eeJDBCDataSource")
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The scoping ManagedElement.") :KEY)
                :INITFORM "CIM_J2eeJDBCDriver"))
              (:CIM-NAME "CIM_J2eeJDBCDataSourceDriver")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServer")
               (:DESCRIPTION
                "CIM_J2eeJDBCDataSourceDriver associates the JDBC driver with a JDBC data source.")))