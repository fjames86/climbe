
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MetricDefForME.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_METRICDEFFORME (CIM_DEPENDENCY)
              ((METRICCOLLECTIONENABLED UINT16 :CIM-NAME
                "MetricCollectionEnabled" :QUALIFIERS
                ((:DESCRIPTION
                  "MetricCollectionEnabled indicates whether the metric defined by the referenced CIM_BaseMetricDefinition is being collected for the referenced CIM_ManagedElement. A value of 2 \"Enabled\" shall indicate the metric is being collected. A value of 3 \"Disabled\" shall indicate the metric is not being collected. When collection of a metric is re-enabled, the metric is re-initialized such that any values for a current access metric reflect data collected after the time at which collection was re-enabled.")
                 (:VALUE-MAP ("2" "3" "4" ".." "32768..65535"))
                 (:VALUES
                  ("Enabled" "Disabled" "Reserved" "DMTF Reserved"
                   "Vendor Reserved")))
                :INITFORM "2")
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The CIM_ManagedElement that can have metrics of this type associated with it.")
                 :KEY)
                :INITFORM "CIM_ManagedElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "A CIM_BaseMetricDefinition for a CIM_ManagedElement.")
                 :KEY)
                :INITFORM "CIM_BaseMetricDefinition"))
              (:CIM-NAME "CIM_MetricDefForME")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Metrics::BaseMetric")
               (:DESCRIPTION
                "This association ties a CIM_BaseMetricDefinition to a CIM_ManagedElement to define metrics for the latter. The metrics definition is given context by the ManagedElement, which is why the definition is dependent on the element.")))