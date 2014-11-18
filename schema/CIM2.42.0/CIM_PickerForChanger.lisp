
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PickerForChanger.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PICKERFORCHANGER (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The PickerElement that accesses StorageMediaLocations to deliver Media to the Changer.")
                 :KEY)
                :INITFORM "CIM_PickerElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "The ChangerDevice.") :KEY)
                :INITFORM "CIM_ChangerDevice"))
              (:CIM-NAME "CIM_PickerForChanger")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageLib")
               (:DESCRIPTION
                "PickerForChanger indicates the PickerElement(s) that access StorageMediaLocations and deliver PhysicalMedia to the Changer, for movement through the System. A Changer may have several Pickers for faster exchange of Media.")))