
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssociatedRemainingExtent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSOCIATEDREMAININGEXTENT (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION "The parent StoragePool in the association.")
                 :KEY)
                :INITFORM "CIM_StoragePool")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The component StorageExtent in the association.")
                 :KEY)
                :INITFORM "CIM_StorageExtent"))
              (:CIM-NAME "CIM_AssociatedRemainingExtent")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.18.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageServices")
               (:DESCRIPTION
                "This association defines that capacity of the StoragePool that is not yet allocated from the StoragePool. This capacity is remaining in the StoragePool for future allocation.StorageExtents associated to a StoragePool using this association shall be BasedOn StorageExtents that are associated to that StoragePool using CIM_AssociatedComponentExtent, but shall not be associated to that StoragePool using the CIM_AssociatedComponentExtent association.")))