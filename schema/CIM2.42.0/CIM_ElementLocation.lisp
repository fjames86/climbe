
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ElementLocation.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ELEMENTLOCATION NIL
              ((ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The ManagedElement whose location is specified."))
                :INITFORM "CIM_ManagedElement")
               (PHYSICALLOCATION NIL :CIM-NAME "PhysicalLocation" :QUALIFIERS
                (:KEY (:DESCRIPTION "The location of the element.")) :INITFORM
                "CIM_Location"))
              (:CIM-NAME "CIM_ElementLocation")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Physical")
               (:DESCRIPTION
                "ElementLocation associates a ManagedElement with a location for positioning, inventory, maintenance and similar purposes. PhysicalElements can certainly have locations. They are explicitly defined in a subclass, PhysicalElement Location. However, other ManagedElements can also be associated with locations. For example, Organizations can be 'in' one or more locations, or Services can be restricted to a location.")))