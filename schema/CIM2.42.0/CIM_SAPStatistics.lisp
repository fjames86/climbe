
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SAPStatistics.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SAPSTATISTICS (CIM_STATISTICS)
              ((STATS NIL :CIM-NAME "Stats" :QUALIFIERS
                ((:OVERRIDE "Stats") :WEAK
                 (:DESCRIPTION "The statistical object.") :KEY)
                :INITFORM "CIM_SAPStatisticalInformation")
               (ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                ((:OVERRIDE "Element") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The ServiceAccessPoint to which the statistics apply.")
                 :KEY)
                :INITFORM "CIM_ServiceAccessPoint"))
              (:CIM-NAME "CIM_SAPStatistics")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Core::Statistics")
               (:DESCRIPTION
                "SAPStatistics relates the SAPStatisticalInformation class to the ServiceAccessPoint to which it applies.")))