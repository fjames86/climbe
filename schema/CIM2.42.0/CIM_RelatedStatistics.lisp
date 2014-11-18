
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RelatedStatistics.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_RELATEDSTATISTICS NIL
              ((STATS NIL :CIM-NAME "Stats" :QUALIFIERS
                (:KEY (:DESCRIPTION "The statistic information/object."))
                :INITFORM "CIM_StatisticalInformation")
               (RELATEDSTATS NIL :CIM-NAME "RelatedStats" :QUALIFIERS
                (:KEY (:DESCRIPTION "The related statistics or metrics."))
                :INITFORM "CIM_StatisticalInformation"))
              (:CIM-NAME "CIM_RelatedStatistics")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Core::Statistics")
               (:DESCRIPTION
                "CIM_RelatedStatistics is an association that defines hierarchies and/or dependencies of related CIM_Statistical Information classes.")))