
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BGPServiceStatistics.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BGPSERVICESTATISTICS (CIM_SERVICESTATISTICS)
              ((STATS NIL :CIM-NAME "Stats" :QUALIFIERS
                ((:DEPRECATED ("CIM_ElementStatisticalData.Stats"))
                 (:OVERRIDE "Stats") (:MAX "1")
                 (:DESCRIPTION "The statistics object for the BGP session.")
                 :WEAK :KEY)
                :INITFORM "CIM_BGPStatistics")
               (ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                ((:DEPRECATED ("CIM_ElementStatisticalData.ManagedElement"))
                 (:OVERRIDE "Element") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The BGPService for which statistics are being gathered.")
                 :KEY)
                :INITFORM "CIM_BGPService"))
              (:CIM-NAME "CIM_BGPServiceStatistics")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ElementStatisticalData")) (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "This association defines statistics collected for a BGP Service. The relationship is deprecated since the class BGPStatistics is deprecated. It is incorrectly associated with a BGPService, but should instead be associated with a BGPProtocolEndpoint using the ElementStatisticalData relationship.")))