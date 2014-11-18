
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SystemStatistics.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SYSTEMSTATISTICS (CIM_STATISTICS)
              ((STATS NIL :CIM-NAME "Stats" :QUALIFIERS
                ((:OVERRIDE "Stats") :WEAK
                 (:DESCRIPTION "The statistical object.") :KEY)
                :INITFORM "CIM_SystemStatisticalInformation")
               (ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                ((:OVERRIDE "Element") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The System to which the statistics apply.")
                 :KEY)
                :INITFORM "CIM_System"))
              (:CIM-NAME "CIM_SystemStatistics")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Core::Statistics")
               (:DESCRIPTION
                "SystemStatistics relates the SystemStatisticalInformation class to the System to which it applies.")))