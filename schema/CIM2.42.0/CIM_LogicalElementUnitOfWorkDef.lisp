
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_LogicalElementUnitOfWorkDef.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LOGICALELEMENTUNITOFWORKDEF (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The LogicalElement that is providing the UnitOfWork.")
                 :KEY)
                :INITFORM "CIM_LogicalElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The UnitOfWorkDefinition associated with the LogicalElement.")
                 :KEY)
                :INITFORM "CIM_UnitOfWorkDefinition"))
              (:CIM-NAME "CIM_LogicalElementUnitOfWorkDef")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Metrics::UnitOfWork")
               (:DESCRIPTION
                "This association links a LogicalElement to the UnitsOfWork that it can perform. For example, a Printer Device may have associated UnitOfWorkDefinitions representing PrintJobs. This is a Dependency relationship since the Definitions are given context by the LogicalElement.")))