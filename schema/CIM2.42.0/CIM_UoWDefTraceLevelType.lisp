
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_UoWDefTraceLevelType.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_UOWDEFTRACELEVELTYPE NIL
              ((TRACELEVELTYPE NIL :CIM-NAME "TraceLevelType" :QUALIFIERS
                (:KEY (:MAX "1")
                 (:DESCRIPTION
                  "The trace level type description that is implemented by the UnitOfWorkDefinition."))
                :INITFORM "CIM_TraceLevelType")
               (UOWDEFN NIL :CIM-NAME "UoWDefn" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The UnitOfWorkDefinition which is refined by the instance of TraceLevelType."))
                :INITFORM "CIM_UnitOfWorkDefinition"))
              (:CIM-NAME "CIM_UoWDefTraceLevelType")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Metrics::UnitOfWork")
               (:DESCRIPTION
                "Refers to the refinement of the UnitOfWorkDefinition: the trace level type. It is not required that a UnitOfWork be associated to a TraceLevelType. But if it is associated, only one Type can be specified for the Definition. In contrast, TraceLevelTypes can be reused for multiple Definitions.")))