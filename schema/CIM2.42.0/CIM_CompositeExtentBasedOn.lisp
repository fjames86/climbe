
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CompositeExtentBasedOn.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COMPOSITEEXTENTBASEDON (CIM_BASEDON)
              ((ORDERINDEX UINT16 :CIM-NAME "OrderIndex" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "OrderIndex")
                 (:DESCRIPTION
                  "Order matters to composite extents. An example of the use of this property is when defining a RAID-0 striped array of 3 disks. The resultant RAID array is a composite extent that is dependent on (as described by CompositeExtentBasedOn) the StorageExtents that represent each of the 3 disks. The OrderIndex of each CompositeExtentBasedOn association from the disk Extents to the RAID array could be specified as 1, 2 and 3 to indicate the order in which the disk Extents are used to access the RAID data.")
                 (:MAPPING-STRINGS ("MIF.DMTF|Protected Space Extent|001.1")))
                :INITFORM NIL)
               (LBASMAPPEDBYDECREMENTING BOOLEAN :CIM-NAME
                "LBAsMappedByDecrementing" :QUALIFIERS
                ((:DESCRIPTION
                  "True if logical blocks in the underlying StorageExtents are mapped in decrementing order. This property corresponds to the INCDEC value in the SCSI SCC-2 Volume Set PS_Extent Descriptor."))
                :INITFORM NIL)
               (LBAMAPPINGINCLUDESCHECKDATA BOOLEAN :CIM-NAME
                "LBAMappingIncludesCheckData" :QUALIFIERS
                ((:DESCRIPTION
                  "True if the logical block mapping algorithm includes check data bytes. This property corresponds to the NOCHKSKIP attribute in the SCC-2 Volume Set PS_Extent Descriptor."))
                :INITFORM NIL)
               (NUMBEROFBLOCKS UINT64 :CIM-NAME "NumberOfBlocks" :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of blocks that will be consumed on the Dependent Extent. This is limited by the Antecedent's NumberOfBlocks, but is included explicitly to provide for the DMTF MIF mapping. In SCSI SCC, this is equivalent to the NUMBER OF LBA_PS(s) field in the Volume Set PS_Extent Descriptor.")
                 (:MAPPING-STRINGS ("MIF.DMTF|Protected Space Extent|001.3"))
                 (:MODEL-CORRESPONDENCE ("CIM_StorageExtent.NumberOfBlocks")))
                :INITFORM NIL)
               (BLOCKSIZE UINT64 :CIM-NAME "BlockSize" :QUALIFIERS
                ((:DESCRIPTION
                  "The Dependent's BlockSize is limited by the Antecedent's. In SCSI SCC, this is equivalent to the NUMBER OF BYTES PER LBA_PS field in the RedundancyGroup P_Extent Descriptor.")
                 (NIL "Bytes")
                 (:MAPPING-STRINGS ("MIF.DMTF|Protected Space Extent|001.4"))
                 (:MODEL-CORRESPONDENCE ("CIM_StorageExtent.BlockSize"))
                 (:P-UNIT "byte"))
                :INITFORM NIL)
               (USERDATASTRIPEDEPTH UINT64 :CIM-NAME "UserDataStripeDepth"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Number of bytes which form the stripe size for the Dependent StorageExtent. If the CompositeExtent is concatenated instead of striped, then UserDataStripeDepth should be set to zero.")
                 (NIL "Bytes")
                 (:MAPPING-STRINGS ("MIF.DMTF|Protected Space Extent|001.6"))
                 (:P-UNIT "byte"))
                :INITFORM NIL)
               (UNITSBEFORECHECKDATAINTERLEAVE UINT64 :CIM-NAME
                "UnitsBeforeCheckDataInterleave" :QUALIFIERS
                ((:DESCRIPTION
                  "Number of bytes of user data to skip before starting the check data interleave.")
                 (NIL "Bytes")
                 (:MAPPING-STRINGS ("MIF.DMTF|Physical Extent|001.6"))
                 (:P-UNIT "byte"))
                :INITFORM NIL)
               (UNITSOFCHECKDATA UINT64 :CIM-NAME "UnitsOfCheckData"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Number of bytes to be reserved for check data.")
                 (NIL "Bytes")
                 (:MAPPING-STRINGS ("MIF.DMTF|Physical Extent|001.7"))
                 (:P-UNIT "byte"))
                :INITFORM NIL)
               (UNITSOFUSERDATA UINT64 :CIM-NAME "UnitsOfUserData" :QUALIFIERS
                ((:DESCRIPTION "Number of bytes to be reserved for user data.")
                 (NIL "Bytes")
                 (:MAPPING-STRINGS ("MIF.DMTF|Physical Extent|001.8"))
                 (:P-UNIT "byte"))
                :INITFORM NIL)
               (STARTINGADDRESS UINT64 :CIM-NAME "StartingAddress" :QUALIFIERS
                ((:DESCRIPTION
                  "StartingAddress indicates where in lower level storage, the higher level Extent begins."))
                :INITFORM NIL)
               (ENDINGADDRESS UINT64 :CIM-NAME "EndingAddress" :QUALIFIERS
                ((:DESCRIPTION
                  "EndingAddress indicates where in lower level storage, the higher level Extent ends. This property is useful when mapping non-contiguous Extents into a higher level grouping."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The underlying StorageExtent.") :KEY)
                :INITFORM "CIM_StorageExtent")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The StorageExtent which is built on the StorageExtent.")
                 :KEY)
                :INITFORM "CIM_StorageExtent"))
              (:CIM-NAME "CIM_CompositeExtentBasedOn")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.19.0")
               (:CLASS-CONSTRAINT ("inv: self.Dependent.IsComposite = true"))
               (:UML-PACKAGE-PATH "CIM::Device::StorageExtents")
               (:DESCRIPTION
                "This specialization defines how data is striped across StorageExtents. Additionally, it includes information on distribution of check data so that the 'usual case' RAID devices can be created in one step.")))