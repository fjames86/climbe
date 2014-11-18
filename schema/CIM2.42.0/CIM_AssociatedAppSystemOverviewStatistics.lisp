
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssociatedAppSystemOverviewStatistics.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSOCIATEDAPPSYSTEMOVERVIEWSTATISTICS
              (CIM_ELEMENTSTATISTICALDATA)
              ((MANAGEDELEMENT NIL :CIM-NAME "ManagedElement" :QUALIFIERS
                ((:OVERRIDE "ManagedElement") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The application system for which the overview is defined.")
                 :KEY)
                :INITFORM "CIM_ApplicationSystem")
               (STATS NIL :CIM-NAME "Stats" :QUALIFIERS
                ((:OVERRIDE "Stats") (:MAX "1")
                 (:DESCRIPTION
                  "The application system runtime statistical overview.")
                 :KEY)
                :INITFORM "CIM_StatisticalRuntimeOverview"))
              (:CIM-NAME "CIM_AssociatedAppSystemOverviewStatistics")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::AppRuntime")
               (:DESCRIPTION
                "The link to the runtime overview statistics of an application system.")))