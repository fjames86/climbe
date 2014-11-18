
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_UnixProcessStatistics.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_UNIXPROCESSSTATISTICS (CIM_STATISTICS)
              ((ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                ((:OVERRIDE "Element") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The Process for which statistical or metric data is defined.")
                 :KEY)
                :INITFORM "CIM_UnixProcess")
               (STATS NIL :CIM-NAME "Stats" :QUALIFIERS
                ((:OVERRIDE "Stats") :WEAK
                 (:DESCRIPTION
                  "The UNIX Process statistical information/object.")
                 :KEY)
                :INITFORM "CIM_UnixProcessStatisticalInformation"))
              (:CIM-NAME "CIM_UnixProcessStatistics")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::Unix")
               (:DESCRIPTION
                "CIM_UnixProcessStatistics is an association that relates a CIM_UnixProcess to its StatisticalInformation.")))