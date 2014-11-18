
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProtectedExtentBasedOn.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PROTECTEDEXTENTBASEDON (CIM_BASEDON)
              ((STARTINGADDRESS UINT64 :CIM-NAME "StartingAddress" :QUALIFIERS
                ((:OVERRIDE "StartingAddress")
                 (:DESCRIPTION
                  "The starting logical block address of the underlying StorageExtent from which this protected StorageExtent is derived. In SCC, this is equivalent to the START LBA_P field in the Redundancy Group P_Extent Descriptor.")
                 (:MAPPING-STRINGS ("MIF.DMTF|Physical Extent|001.2")))
                :INITFORM NIL)
               (NUMBEROFBLOCKS UINT64 :CIM-NAME "NumberOfBlocks" :QUALIFIERS
                ((:DESCRIPTION
                  "The size of the protected space. Note that this is limited by the Antecedent->NumberOfBlocks, but is included explicitly to provide for the DMTF MIF mapping. In SCC, this is equivalent to the NUMBER OF LBA_P(s) field in the Redundancy Group P_Extent Descriptor.")
                 (:MAPPING-STRINGS ("MIF.DMTF|Physical Extent|001.3"))
                 (:MODEL-CORRESPONDENCE ("CIM_StorageExtent.NumberOfBlocks")))
                :INITFORM NIL)
               (BLOCKSIZE UINT64 :CIM-NAME "BlockSize" :QUALIFIERS
                ((:DESCRIPTION
                  "The block size of the protected space. Note that this is limited by the Antecedent->BlockSize. In SCC, this is equivalent to the NUMBER OF BYTES PER LBA_P field in the Redundancy Group P_Extent Descriptor.")
                 (NIL "Bytes")
                 (:MAPPING-STRINGS ("MIF.DMTF|Physical Extent|001.4"))
                 (:MODEL-CORRESPONDENCE ("CIM_StorageExtent.BlockSize"))
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
               (ENDINGADDRESS UINT64 :CIM-NAME "EndingAddress" :QUALIFIERS
                ((:DESCRIPTION
                  "EndingAddress indicates where in lower level storage, the higher level Extent ends. This property is useful when mapping non-contiguous Extents into a higher level grouping."))
                :INITFORM NIL)
               (ORDERINDEX UINT16 :CIM-NAME "OrderIndex" :QUALIFIERS
                ((:DESCRIPTION
                  "If there is an order to the BasedOn associations that describe how a higher level StorageExtent is assembled, the OrderIndex property indicates this. When an order exists, the instances of BasedOn with the same Dependent value (i.e., the same higher level Extent) should place unique values in the OrderIndex property. The lowest value implies the first member of the collection of lower level Extents, and increasing values imply successive members of the collection. If there is no ordered relationship, a value of zero should be specified. An example of the use of this property is to define a RAID-0 striped array of 3 disks. The resultant RAID array is a StorageExtent that is dependent on (BasedOn) the StorageExtents that describe each of the 3 disks. The OrderIndex of each BasedOn association from the disk Extents to the RAID array could be specified as 1, 2 and 3 to indicate the order in which the disk Extents are used to access the RAID data."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The underlying StorageExtent.") :KEY)
                :INITFORM "CIM_StorageExtent")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The Protected Space is built on this StorageExtent.")
                 :KEY)
                :INITFORM "CIM_StorageExtent"))
              (:CIM-NAME "CIM_ProtectedExtentBasedOn")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageExtents")
               (:DESCRIPTION
                "Protected StorageExtents map to an underlying StorageExtent. This mapping includes information about the placement of check data on the underlying extent. The mapping is made explicit in this association.")))