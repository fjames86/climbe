
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RealizesTapePartition.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_REALIZESTAPEPARTITION (CIM_REALIZESEXTENT)
              ((STARTINGADDRESS UINT64 :CIM-NAME "StartingAddress" :QUALIFIERS
                ((:DESCRIPTION
                  "The starting address on the PhysicalComponent where the StorageExtent begins. Ending address of the StorageExtent is determined using the NumberOfBlocks and Block Size properties of the StorageExtent object."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "The PhysicalTape on which the Partition is realized.")
                 :KEY)
                :INITFORM "CIM_PhysicalTape")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The TapePartition that is located on the Media.")
                 :KEY)
                :INITFORM "CIM_TapePartition"))
              (:CIM-NAME "CIM_RealizesTapePartition")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageExtents")
               (:DESCRIPTION
                "TapePartitions are realized on PhysicalTape. This relationship is made explicit by the RealizesTapePartition association.")))