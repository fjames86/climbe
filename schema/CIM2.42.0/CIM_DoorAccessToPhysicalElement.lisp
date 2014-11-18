
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DoorAccessToPhysicalElement.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DOORACCESSTOPHYSICALELEMENT (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The Door that provides access.") :KEY)
                :INITFORM "CIM_Door")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The PhysicalElement that is accessed.") :KEY)
                :INITFORM "CIM_PhysicalElement"))
              (:CIM-NAME "CIM_DoorAccessToPhysicalElement")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::UserDevices")
               (:DESCRIPTION
                "Doors provide access to PhysicalElements for hot swap, repair and similar activities. The entities accessed through a Door are indicated in this relationship.")))