
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DoorAccessToDevice.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DOORACCESSTODEVICE (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The Door that provides access.") :KEY)
                :INITFORM "CIM_Door")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The LogicalDevice that is accessed.") :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_DoorAccessToDevice")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::UserDevices")
               (:DESCRIPTION
                "Doors provide access to PhysicalElements for hot swap, repair and similar activities. In turn, PhysicalElements 'Realize' LogicalDevices. Since it may not be possible to define all the PhysicalElements that exist, and optimizing the retrieval of Devices 'behind' the Door may be desirable, the DoorAccessTo Device association provides a shortcut mechanism for defining the LogicalDevices ('hardware') accessed through a Door.")))