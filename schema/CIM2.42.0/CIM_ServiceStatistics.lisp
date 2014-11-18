
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ServiceStatistics.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SERVICESTATISTICS (CIM_STATISTICS)
              ((STATS NIL :CIM-NAME "Stats" :QUALIFIERS
                ((:OVERRIDE "Stats") :WEAK
                 (:DESCRIPTION "The statistical object.") :KEY)
                :INITFORM "CIM_ServiceStatisticalInformation")
               (ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                ((:OVERRIDE "Element") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The Service to which the statistics apply.")
                 :KEY)
                :INITFORM "CIM_Service"))
              (:CIM-NAME "CIM_ServiceStatistics")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Core::Statistics")
               (:DESCRIPTION
                "ServiceStatistics relates the ServiceStatisticalInformation class to the Service to which it applies.")))