
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Dependency.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DEPENDENCY NIL
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "Antecedent represents the independent object in this association."))
                :INITFORM "CIM_ManagedElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "Dependent represents the object that is dependent on the Antecedent."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_Dependency")
              (:QUALIFIERS :ASSOCIATION :ABSTRACT (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::CoreElements")
               (:DESCRIPTION
                "CIM_Dependency is a generic association used to establish dependency relationships between ManagedElements.")))