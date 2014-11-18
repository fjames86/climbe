
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DiskPartitionBasedOnVolume.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DISKPARTITIONBASEDONVOLUME (CIM_BASEDON)
              ((STARTINGADDRESS UINT64 :CIM-NAME "StartingAddress" :QUALIFIERS
                ((:DESCRIPTION
                  "StartingAddress indicates where in lower level storage, the higher level Extent begins."))
                :INITFORM NIL)
               (ENDINGADDRESS UINT64 :CIM-NAME "EndingAddress" :QUALIFIERS
                ((:DESCRIPTION
                  "EndingAddress indicates where in lower level storage, the higher level Extent ends. This property is useful when mapping non-contiguous Extents into a higher level grouping."))
                :INITFORM NIL)
               (ORDERINDEX UINT16 :CIM-NAME "OrderIndex" :QUALIFIERS
                ((:DESCRIPTION
                  "If there is an order to the BasedOn associations that describe how a higher level StorageExtent is assembled, the OrderIndex property indicates this. When an order exists, the instances of BasedOn with the same Dependent value (i.e., the same higher level Extent) should place unique values in the OrderIndex property. The lowest value implies the first member of the collection of lower level Extents, and increasing values imply successive members of the collection. If there is no ordered relationship, a value of zero should be specified. An example of the use of this property is to define a RAID-0 striped array of 3 disks. The resultant RAID array is a StorageExtent that is dependent on (BasedOn) the StorageExtents that describe each of the 3 disks. The OrderIndex of each BasedOn association from the disk Extents to the RAID array could be specified as 1, 2 and 3 to indicate the order in which the disk Extents are used to access the RAID data."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The StorageVolume.") :KEY)
                :INITFORM "CIM_StorageVolume")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The DiskPartition which is built on the Volume.")
                 :KEY)
                :INITFORM "CIM_DiskPartition"))
              (:CIM-NAME "CIM_DiskPartitionBasedOnVolume")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageExtents")
               (:DESCRIPTION
                "DiskPartitions should be BasedOn a single StorageVolume (for example, exposed by a hardware RAID cabinet), an SCC VolumeSet, or realized directly in PhysicalMedia. The first two relationships are made explicit in this association. The latter is conveyed by the RealizesDiskPartition association.")))