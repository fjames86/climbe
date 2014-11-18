
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DeviceStatistics.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DEVICESTATISTICS (CIM_STATISTICS)
              ((STATS NIL :CIM-NAME "Stats" :QUALIFIERS
                ((:OVERRIDE "Stats") :WEAK
                 (:DESCRIPTION "The statistical object.") :KEY)
                :INITFORM "CIM_DeviceStatisticalInformation")
               (ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                ((:OVERRIDE "Element") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The Device to which the statistics apply.")
                 :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_DeviceStatistics")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Core::Statistics")
               (:DESCRIPTION
                "DeviceStatistics relates the DeviceStatisticalInformation class to the LogicalDevice to which it applies.")))