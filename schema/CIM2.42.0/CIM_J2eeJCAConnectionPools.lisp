
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeJCAConnectionPools.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EEJCACONNECTIONPOOLS (CIM_RELATEDSTATISTICALDATA)
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
                 (:DESCRIPTION "The related JCA connection pool statistics.")
                 :KEY)
                :INITFORM "CIM_J2eeConnectionPoolStats"))
              (:CIM-NAME "CIM_J2eeJCAConnectionPools")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServerStats")
               (:DESCRIPTION
                "CIM_J2eeJCAConnectionPools provides the list of statistics about the connections pools that are associated with the referencing JCA resource statistics.")))