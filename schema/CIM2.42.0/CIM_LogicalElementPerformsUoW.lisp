
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_LogicalElementPerformsUoW.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LOGICALELEMENTPERFORMSUOW (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The LogicalElement performing the UnitOfWork.")
                 :KEY)
                :INITFORM "CIM_LogicalElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The UnitOfWork being performed.") :KEY)
                :INITFORM "CIM_UnitOfWork"))
              (:CIM-NAME "CIM_LogicalElementPerformsUoW")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Metrics::UnitOfWork")
               (:DESCRIPTION
                "This association identifies a specific execution of a UnitOf Work with the specific LogicalElement that is performing/ has performed it. Where the LogicalElementUnitOfWorkDef association describes what an Element can do, this relationship describes what a particular Element is doing or has done.")))