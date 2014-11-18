
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PhysicalStatistics.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PHYSICALSTATISTICS (CIM_STATISTICS)
              ((STATS NIL :CIM-NAME "Stats" :QUALIFIERS
                ((:OVERRIDE "Stats") :WEAK
                 (:DESCRIPTION "The statistical object.") :KEY)
                :INITFORM "CIM_PhysicalStatisticalInformation")
               (ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                ((:OVERRIDE "Element") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The PhysicalElement to which the statistics apply.")
                 :KEY)
                :INITFORM "CIM_PhysicalElement"))
              (:CIM-NAME "CIM_PhysicalStatistics")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Core::Statistics")
               (:DESCRIPTION
                "PhysicalStatistics relates the PhysicalStatisticalInformation class to the PhysicalElement to which it applies.")))