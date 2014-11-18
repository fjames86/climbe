
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_UoWMetric.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_UOWMETRIC (CIM_DEPENDENCY)
              ((VALUE STRING :CIM-NAME "Value" :QUALIFIERS
                ((:DESCRIPTION
                  "The value of the Metric for the referenced UnitOfWork. Note that the type of the data and other information are defined by the properties of MetricDefinition."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The UnitOfWork whose Metric value is specified.")
                 :KEY)
                :INITFORM "CIM_UnitOfWork")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The MetricDefinition for this particular UnitOfWork and value. Note that the MetricDefinition must be associated (via UoWMetricDefinition) to the same UnitOfWorkDefinition to which the UnitOfWork is weakly associated.")
                 :KEY)
                :INITFORM "CIM_MetricDefinition"))
              (:CIM-NAME "CIM_UoWMetric")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Metrics::UnitOfWork")
               (:DESCRIPTION
                "This association ties a MetricDefinition to an instance of a UnitOfWork. Its primary purpose is to specify the value of the Metric for the instance of UnitOfWork. It is defined as a Dependency since the Metric value relies on the specific UnitOfWork for context.")))