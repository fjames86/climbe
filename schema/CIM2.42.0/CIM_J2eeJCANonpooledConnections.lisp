
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeJCANonpooledConnections.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EEJCANONPOOLEDCONNECTIONS (CIM_RELATEDSTATISTICALDATA)
              ((DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string describing how the statistics are related."))
                :INITFORM NIL)
               (STATS NIL :CIM-NAME "Stats" :QUALIFIERS
                ((:OVERRIDE "Stats")
                 (:DESCRIPTION "The JCA resource statistic.") :KEY)
                :INITFORM "CIM_J2eeJCAStats")
               (RELATEDSTATS NIL :CIM-NAME "RelatedStats" :QUALIFIERS
                ((:OVERRIDE "RelatedStats")
                 (:DESCRIPTION "The related JCA connection statistics.") :KEY)
                :INITFORM "CIM_J2eeConnectionStats"))
              (:CIM-NAME "CIM_J2eeJCANonpooledConnections")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServerStats")
               (:DESCRIPTION
                "CIM_J2eeJCANonpooledConnections provides the list of statistics for the non-connections pools that are associated with the referencing JCA resource statistics.")))