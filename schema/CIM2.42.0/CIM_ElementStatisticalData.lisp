
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ElementStatisticalData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ELEMENTSTATISTICALDATA NIL
              ((MANAGEDELEMENT NIL :CIM-NAME "ManagedElement" :QUALIFIERS
                (:KEY (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The ManagedElement for which statistical or metric data is defined."))
                :INITFORM "CIM_ManagedElement")
               (STATS NIL :CIM-NAME "Stats" :QUALIFIERS
                (:KEY (:DESCRIPTION "The statistic information/object."))
                :INITFORM "CIM_StatisticalData"))
              (:CIM-NAME "CIM_ElementStatisticalData")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Core::Statistics")
               (:DESCRIPTION
                "CIM_ElementStatisticalData is an association that relates a ManagedElement to its StatisticalData. Note that the cardinality of the ManagedElement reference is Min(1), Max(1). This cardinality mandates the instantiation of the ElementStatisticalData association for the referenced instance of CIM_StatisticalData. ElementStatisticalData describes the existence requirements and context for the CIM_StatisticalData, relative to a specific ManagedElement.")))