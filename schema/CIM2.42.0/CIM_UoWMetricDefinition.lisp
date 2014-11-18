
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_UoWMetricDefinition.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_UOWMETRICDEFINITION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION
                  "The UnitOfWorkDefinition where the Metric applies.")
                 :KEY)
                :INITFORM "CIM_UnitOfWorkDefinition")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The MetricDefinition for a particular UnitOfWork.")
                 :KEY)
                :INITFORM "CIM_MetricDefinition"))
              (:CIM-NAME "CIM_UoWMetricDefinition")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Metrics::UnitOfWork")
               (:DESCRIPTION
                "An association that describes the Metrics related to a UnitOfWorkDefinition. This is a Dependency relationship since the MetricDefinition relies on the UnitOfWorkDefinition for context. At least one context must be defined for a MetricDefinition, hence the Min (1) qualifier is placed on the UnitOfWorkDefinition reference.")))