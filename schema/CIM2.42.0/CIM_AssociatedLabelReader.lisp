
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssociatedLabelReader.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSOCIATEDLABELREADER (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The LabelReader.")
                 :KEY)
                :INITFORM "CIM_LabelReader")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The Device that is dependent on the Reader Device.")
                 :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_AssociatedLabelReader")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageLib")
               (:DESCRIPTION
                "A LogicalDevice may use or require one or more LabelReaders, to scan barcodes or otherwise identify entities. This relationship is described by the AssociatedLabelReader dependency.")))