
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Component.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COMPONENT NIL
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:KEY :AGGREGATE
                 (:DESCRIPTION "The parent element in the association."))
                :INITFORM "CIM_ManagedElement")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                (:KEY (:DESCRIPTION "The child element in the association."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_Component")
              (:QUALIFIERS :ASSOCIATION :ABSTRACT (NIL "true")
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Core::CoreElements")
               (:DESCRIPTION
                "CIM_Component is a generic association used to establish 'part of' relationships between Managed Elements. For example, it could be used to define the components or parts of a System.")))