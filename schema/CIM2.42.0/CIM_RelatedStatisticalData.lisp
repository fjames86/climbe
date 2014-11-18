
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RelatedStatisticalData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_RELATEDSTATISTICALDATA NIL
              ((DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string describing how the statistics are related."))
                :INITFORM NIL)
               (STATS NIL :CIM-NAME "Stats" :QUALIFIERS
                (:KEY (:DESCRIPTION "The statistic information/object."))
                :INITFORM "CIM_StatisticalData")
               (RELATEDSTATS NIL :CIM-NAME "RelatedStats" :QUALIFIERS
                (:KEY (:DESCRIPTION "The related statistics.")) :INITFORM
                "CIM_StatisticalData"))
              (:CIM-NAME "CIM_RelatedStatisticalData")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Core::Statistics")
               (:DESCRIPTION
                "CIM_RelatedStatisticalData is an association that defines hierarchies and/or dependencies of related CIM_Statistical Data classes.")))