
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ReferencedSpecification.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_REFERENCEDSPECIFICATION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                (:KEY (:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The RegisteredSpecification that is referenced by the Dependent Registeredspecification."))
                :INITFORM "CIM_RegisteredSpecification")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                (:KEY (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "A RegisteredSpecification that references another specification."))
                :INITFORM "CIM_RegisteredSpecification"))
              (:CIM-NAME "CIM_ReferencedSpecification")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.37.0")
               (:UML-PACKAGE-PATH "CIM::Interop")
               (:DESCRIPTION
                "Associates two instances of RegisteredSpecification where one of the represented specifications references the other.")))