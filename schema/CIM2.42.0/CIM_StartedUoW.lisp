
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_StartedUoW.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_STARTEDUOW (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The Definition object for the UnitOfWork.")
                 :KEY)
                :INITFORM "CIM_UnitOfWorkDefinition")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION
                  "An instance of a UnitOfWork that has started executing.")
                 :KEY)
                :INITFORM "CIM_UnitOfWork"))
              (:CIM-NAME "CIM_StartedUoW")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Metrics::UnitOfWork")
               (:DESCRIPTION
                "This association links a UnitOfWork (which is a 'started' transaction) to its Definition.")))