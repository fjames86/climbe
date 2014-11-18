
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ConcreteDependency.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CONCRETEDEPENDENCY (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "Antecedent represents the independent object in this association.")
                 :KEY)
                :INITFORM "CIM_ManagedElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "Dependent represents the object that is dependent on the Antecedent.")
                 :KEY)
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_ConcreteDependency")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::CoreElements")
               (:DESCRIPTION
                "CIM_ConcreteDependency is a generic association used to establish dependency relationships between ManagedElements. It is defined as a concrete subclass of the abstract CIM_Dependency class, to be used in place of many specific subclasses of Dependency that add no semantics, that is subclasses that do not clarify the type of dependency, update cardinalities, or add or remove qualifiers. Note that when you define additional semantics for Dependency, this class must not be subclassed. Specific semantics continue to be defined as subclasses of the abstract CIM_Dependency. ConcreteDependency is limited in its use as a concrete form of a general dependency. 

It was deemed more prudent to create this concrete subclass than to change Dependency from an abstract to a concrete class. Dependency already had multiple abstract subclasses in the CIM Schema, and wider industry usage and impact could not be anticipated.")))