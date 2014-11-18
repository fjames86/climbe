
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MetricInstance.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_METRICINSTANCE (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The CIM_BaseMetricDefinition for this particular CIM_BaseMetricValue.")
                 :KEY)
                :INITFORM "CIM_BaseMetricDefinition")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "A CIM_BaseMetricValue instance holding the Value.")
                 :KEY)
                :INITFORM "CIM_BaseMetricValue"))
              (:CIM-NAME "CIM_MetricInstance")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Metrics::BaseMetric")
               (:DESCRIPTION
                "Weak association of metric value objects with their metric definition. This association ties an instance of CIM_BaseMetricValue to its CIM_BaseMetricDefinition; it is weak because the existence of a CIM_BaseMetricValue depends on the existence of its associated CIM_BaseMetricDefinition: An instance of CIM_BaseMetricValue must not exist without being associated to its corresponding CIM_BaseMetricDefinition.")))