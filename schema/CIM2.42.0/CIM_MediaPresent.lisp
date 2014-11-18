
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MediaPresent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MEDIAPRESENT (CIM_DEPENDENCY)
              ((FIXEDMEDIA BOOLEAN :CIM-NAME "FixedMedia" :QUALIFIERS
                ((:DESCRIPTION
                  "Boolean indicating that the accessed StorageExtent is fixed in the MediaAccessDevice and can not be ejected."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The MediaAccessDevice.") :KEY)
                :INITFORM "CIM_MediaAccessDevice")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The StorageExtent accessed using the MediaAccessDevice.")
                 :KEY)
                :INITFORM "CIM_StorageExtent"))
              (:CIM-NAME "CIM_MediaPresent")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageExtents")
               (:DESCRIPTION
                "Where a StorageExtent must be accessed through a MediaAccess Device, this relationship is described by the MediaPresent association.")
               (:MAPPING-STRINGS ("MIF.DMTF|Storage Devices|001.8"))))