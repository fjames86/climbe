
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AccessLabelReader.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ACCESSLABELREADER (CIM_ASSOCIATEDLABELREADER)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The LabelReader.")
                 :KEY)
                :INITFORM "CIM_LabelReader")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The MediaAccessDevice that is dependent on the Reader Device.")
                 :KEY)
                :INITFORM "CIM_MediaAccessDevice"))
              (:CIM-NAME "CIM_AccessLabelReader")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageLib")
               (:DESCRIPTION
                "AccessLabelReader is used to indicate that one or more Label Readers works in conjunction with MediaAccessDevices, to identify PhysicalMedia before read/write.")))