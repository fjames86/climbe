
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RealizesDiskPartition.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_REALIZESDISKPARTITION (CIM_REALIZESEXTENT)
              ((STARTINGADDRESS UINT64 :CIM-NAME "StartingAddress" :QUALIFIERS
                ((:DESCRIPTION
                  "The starting address on the PhysicalComponent where the StorageExtent begins. Ending address of the StorageExtent is determined using the NumberOfBlocks and Block Size properties of the StorageExtent object."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "The PhysicalMedia on which the Extent is realized.")
                 :KEY)
                :INITFORM "CIM_PhysicalMedia")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The DiskPartition that is located on the Media.")
                 :KEY)
                :INITFORM "CIM_DiskPartition"))
              (:CIM-NAME "CIM_RealizesDiskPartition")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageExtents")
               (:DESCRIPTION
                "DiskPartitions can be directly realized on a PhysicalMedia. This is used to model the creation of Partitions on a raw SCSI or IDE drive, using the fdisk (DOS and Unix) or pdisk (Unix) command. The StartingAddress of the DiskPartition on the PhysicalMedia is also specified as a property of this relationship. An alternative is that Partitions can be BasedOn StorageVolumes, such as a VolumeSet or a Volume exposed by a hardware RAID cabinet. The latter relationship is modeled using the DiskPartitionBasedOnVolume association.")))