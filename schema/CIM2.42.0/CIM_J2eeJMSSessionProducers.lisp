
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeJMSSessionProducers.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EEJMSSESSIONPRODUCERS (CIM_RELATEDSTATISTICALDATA)
              ((DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string describing how the statistics are related."))
                :INITFORM NIL)
               (STATS NIL :CIM-NAME "Stats" :QUALIFIERS
                ((:OVERRIDE "Stats") (:MIN "1")
                 (:DESCRIPTION "The JMS session statistic.") :KEY)
                :INITFORM "CIM_J2eeJMSSessionStats")
               (RELATEDSTATS NIL :CIM-NAME "RelatedStats" :QUALIFIERS
                ((:OVERRIDE "RelatedStats")
                 (:DESCRIPTION "The related JMS producer statistics.") :KEY)
                :INITFORM "CIM_J2eeJMSProducerStats"))
              (:CIM-NAME "CIM_J2eeJMSSessionProducers")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServerStats")
               (:DESCRIPTION
                "CIM_J2eeJMSSessionProducers identifies the JMS producer statistics that are associated with the referencing JMS session statistics.")))