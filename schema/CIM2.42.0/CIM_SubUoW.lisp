
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SubUoW.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SUBUOW (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "The parent executing/executed UnitOfWork. On the execution side, it is expected that a sub-Unit is associated with only one parent UnitOfWork.")
                 :KEY)
                :INITFORM "CIM_UnitOfWork")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The sub-UnitOfWork. On the execution side, it is expected that a sub-Unit is associated with only one parent UnitOfWork.")
                 :KEY)
                :INITFORM "CIM_UnitOfWork"))
              (:CIM-NAME "CIM_SubUoW")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Metrics::UnitOfWork")
               (:DESCRIPTION
                "Similar to the SubUoWDef association (which describes the relationship between definitional UnitsOfWork), this association identifies the executional UnitOfWork Dependencies. It associates executing/executed UnitsOfWork with their parent Units. In most cases, the SubUoW reflects the execution side of the relationship defined in SubUoWDef. However, there may be cases where the SubUoWDef is not defined, but for a particular UnitOfWork, the SubUoW relationship is valid. Therefore, it is not a requirement (but it is desirable) that there be a corresponding SubUoWDef for each instance of SubUoW.")))