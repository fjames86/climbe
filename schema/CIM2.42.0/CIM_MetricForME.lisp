
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MetricForME.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_METRICFORME (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "ManagedElement to which the metric values belong.")
                 :KEY)
                :INITFORM "CIM_ManagedElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "A metric value for the ManagedElement.") :KEY)
                :INITFORM "CIM_BaseMetricValue"))
              (:CIM-NAME "CIM_MetricForME")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Metrics::BaseMetric")
               (:DESCRIPTION
                "This association links a ManagedElement to the metric values being maintained for it.")))