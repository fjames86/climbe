
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PickerLabelReader.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PICKERLABELREADER (CIM_ASSOCIATEDLABELREADER)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The LabelReader.")
                 :KEY)
                :INITFORM "CIM_LabelReader")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The PickerElement that is dependent on the Reader Device.")
                 :KEY)
                :INITFORM "CIM_PickerElement"))
              (:CIM-NAME "CIM_PickerLabelReader")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageLib")
               (:DESCRIPTION
                "PickerLabelReader is used to indicate that one or more Label Readers works in conjunction with PickerElements, to identify PhysicalMedia as they are being picked/placed.")))