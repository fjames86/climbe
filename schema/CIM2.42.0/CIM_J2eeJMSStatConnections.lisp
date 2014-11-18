
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeJMSStatConnections.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EEJMSSTATCONNECTIONS (CIM_RELATEDSTATISTICALDATA)
              ((DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string describing how the statistics are related."))
                :INITFORM NIL)
               (STATS NIL :CIM-NAME "Stats" :QUALIFIERS
                ((:OVERRIDE "Stats") (:MIN "1")
                 (:DESCRIPTION "The JMS resource statistic.") :KEY)
                :INITFORM "CIM_J2eeJMSStats")
               (RELATEDSTATS NIL :CIM-NAME "RelatedStats" :QUALIFIERS
                ((:OVERRIDE "RelatedStats")
                 (:DESCRIPTION "The related JMS connection statistics.") :KEY)
                :INITFORM "CIM_J2eeJMSConnectionStats"))
              (:CIM-NAME "CIM_J2eeJMSStatConnections")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServerStats")
               (:DESCRIPTION
                "CIM_J2eeJMSStatConnections provides the list of JMS connection statistics that are associated with the referencing JMS resource statistics.")))