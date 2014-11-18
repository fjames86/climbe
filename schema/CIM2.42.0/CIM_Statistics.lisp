
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Statistics.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_STATISTICS NIL
              ((STATS NIL :CIM-NAME "Stats" :QUALIFIERS
                (:KEY (:DESCRIPTION "The statistic information/object."))
                :INITFORM "CIM_StatisticalInformation")
               (ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The ManagedElement for which statistical or metric data is defined."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_Statistics")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Core::Statistics")
               (:DESCRIPTION
                "CIM_Statistics is an association that relates Managed Elements to the StatisticalGroup(s) that apply to them.")))