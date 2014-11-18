
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PhysicalElementLocation.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PHYSICALELEMENTLOCATION (CIM_ELEMENTLOCATION)
              ((ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                ((:OVERRIDE "Element")
                 (:DESCRIPTION
                  "The PhysicalElement whose location is specified.")
                 :KEY)
                :INITFORM "CIM_PhysicalElement")
               (PHYSICALLOCATION NIL :CIM-NAME "PhysicalLocation" :QUALIFIERS
                ((:OVERRIDE "PhysicalLocation") (:MAX "1")
                 (:DESCRIPTION "The location of the PhysicalElement.") :KEY)
                :INITFORM "CIM_Location"))
              (:CIM-NAME "CIM_PhysicalElementLocation")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Physical")
               (:DESCRIPTION
                "PhysicalElementLocation associates a PhysicalElement with a Location object for inventory or replacement purposes.")))