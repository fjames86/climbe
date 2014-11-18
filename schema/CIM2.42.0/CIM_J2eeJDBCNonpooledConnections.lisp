
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeJDBCNonpooledConnections.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EEJDBCNONPOOLEDCONNECTIONS (CIM_RELATEDSTATISTICALDATA)
              ((DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string describing how the statistics are related."))
                :INITFORM NIL)
               (STATS NIL :CIM-NAME "Stats" :QUALIFIERS
                ((:OVERRIDE "Stats")
                 (:DESCRIPTION "The JDBC resource statistic.") :KEY)
                :INITFORM "CIM_J2eeJDBCStats")
               (RELATEDSTATS NIL :CIM-NAME "RelatedStats" :QUALIFIERS
                ((:OVERRIDE "RelatedStats")
                 (:DESCRIPTION "The related JDBC connection statistics.") :KEY)
                :INITFORM "CIM_J2eeConnectionStats"))
              (:CIM-NAME "CIM_J2eeJDBCNonpooledConnections")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServerStats")
               (:DESCRIPTION
                "CIM_J2eeJDBCNonpooledConnections provides the list of statistics for the non-connections pools that are associated with the referencing JDBC resource statistics.")))