
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RealizesExtent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_REALIZESEXTENT (CIM_REALIZES)
              ((STARTINGADDRESS UINT64 :CIM-NAME "StartingAddress" :QUALIFIERS
                ((:DESCRIPTION
                  "The starting address on the PhysicalComponent where the StorageExtent begins. Ending address of the StorageExtent is determined using the NumberOfBlocks and Block Size properties of the StorageExtent object."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "The PhysicalComponent on which the Extent is realized.")
                 :KEY)
                :INITFORM "CIM_PhysicalComponent")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The StorageExtent that is located on the Component.")
                 :KEY)
                :INITFORM "CIM_StorageExtent"))
              (:CIM-NAME "CIM_RealizesExtent")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageExtents")
               (:DESCRIPTION
                "StorageExtents can be realized by PhysicalComponents. For example, disks or tapes are realized by PhysicalMedia. Memory is realized by PhysicalMemory. This relationship of Extents to PhysicalComponents is made explicit by the RealizesExtent association. In addition, the StartingAddress of the StorageExtent on the Component is specified here.")))