
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ConcreteComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CONCRETECOMPONENT (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION "The parent element in the association.") :KEY)
                :INITFORM "CIM_ManagedElement")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The child element in the association.") :KEY)
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_ConcreteComponent")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::CoreElements")
               (:DESCRIPTION
                "CIM_ConcreteComponent is a generic association used to establish 'part of' relationships between ManagedElements. It is defined as a concrete subclass of the abstract CIM_Component class, to be used in place of many specific subclasses of Component that add no semantics, that is subclasses that do not clarify the type of composition, update cardinalities, or add or remove qualifiers. Note that when you define additional semantics for Component, this class must not be subclassed. Specific semantics continue to be defined as subclasses of the abstract CIM_Component. ConcreteComponent is limited in its use as a concrete form of a general composition. 

It was deemed more prudent to create this concrete subclass than to change Component from an abstract to a concrete class. Industry usage and impact could not be anticipated.")))