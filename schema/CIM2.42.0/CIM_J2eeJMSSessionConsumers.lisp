
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_J2eeJMSSessionConsumers.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_J2EEJMSSESSIONCONSUMERS (CIM_RELATEDSTATISTICALDATA)
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
                 (:DESCRIPTION "The related JMS consumer statistics.") :KEY)
                :INITFORM "CIM_J2eeJMSConsumerStats"))
              (:CIM-NAME "CIM_J2eeJMSSessionConsumers")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::J2eeAppServerStats")
               (:DESCRIPTION
                "CIM_J2eeJMSSessionConsumers identifies the JMS consumer statistics that are associated with the referencing JMS session statistics.")))