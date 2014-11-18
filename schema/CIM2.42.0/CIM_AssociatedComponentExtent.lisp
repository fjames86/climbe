
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssociatedComponentExtent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSOCIATEDCOMPONENTEXTENT (CIM_COMPONENT)
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
              (:CIM-NAME "CIM_AssociatedComponentExtent")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.18.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageServices")
               (:DESCRIPTION
                "This association defines the capacity, expressed in StorageExtents, that together represents the entire capacity collected in a StoragePool. The capacity represented by StorageExtents may represent capacity that is allocated or unallocated. 
StorageExtents associated to a StoragePool using this association shall not be also be associated to that StoragePool using the CIM_AssociatedRemainingExtent association.")))