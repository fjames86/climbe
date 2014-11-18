
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ElementCapacity.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ELEMENTCAPACITY NIL
              ((CAPACITY NIL :CIM-NAME "Capacity" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "PhysicalCapacity describes the minimum and maximum requirements, and ability to support different types of hardware for a PhysicalElement."))
                :INITFORM "CIM_PhysicalCapacity")
               (ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                (:KEY (:MIN "1")
                 (:DESCRIPTION "The PhysicalElement being described."))
                :INITFORM "CIM_PhysicalElement"))
              (:CIM-NAME "CIM_ElementCapacity")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Misc")
               (:DESCRIPTION
                "ElementCapacity associates a PhysicalCapacity object with one or more PhysicalElements. It serves to associate a description of min/max hardware requirements or capabilities (stored as a kind of PhysicalCapacity), with the PhysicalElements being described.")))