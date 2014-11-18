
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SubUoWDef.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SUBUOWDEF (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The parent UnitOfWorkDefinition.") :KEY)
                :INITFORM "CIM_UnitOfWorkDefinition")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The sub-UnitOfWorkDefinition.") :KEY)
                :INITFORM "CIM_UnitOfWorkDefinition"))
              (:CIM-NAME "CIM_SubUoWDef")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Metrics::UnitOfWork")
               (:DESCRIPTION
                "This association defines the sub-UnitsOfWork (the sub- transactions) for a particular UnitOfWorkDefinition. For example, an 'AddOrder' UnitOfWork could have sub-Units of 'ValidateCustomer', 'ValidatePartNumber', 'UpdateDatabase', etc. This is a Dependency relationship since the sub-UnitsOf Work are put in context relative to the parent Unit. It is not an aggregation relationship - since (using another example) a 'DatabaseWrite' transaction is likely to be dependent upon a 'DiskWrite', but the two transactions are separate concepts and one is not 'contained' by the other.")))