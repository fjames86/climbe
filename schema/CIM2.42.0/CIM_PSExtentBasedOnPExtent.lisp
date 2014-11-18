
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PSExtentBasedOnPExtent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PSEXTENTBASEDONPEXTENT (CIM_BASEDON)
              ((STARTINGADDRESS UINT64 :CIM-NAME "StartingAddress" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_CompositeExtentBasedOn.StartingAddress"
                   "CIM_ProtectedExtentBasedOn.StartingAddress"))
                 (:OVERRIDE "StartingAddress")
                 (:DESCRIPTION
                  "The starting logical block address of the PhysicalExtent from which this ProtectedSpaceExtent is derived.")
                 (:MAPPING-STRINGS ("MIF.DMTF|Protected Space Extent|001.2")))
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
                ((:DEPRECATED
                  ("CIM_CompositeExtentBasedOn.Antecedent"
                   "CIM_ProtectedExtentBasedOn.Antecedent"))
                 (:OVERRIDE "Antecedent") (:DESCRIPTION "The PhysicalExtent.")
                 :KEY)
                :INITFORM "CIM_PhysicalExtent")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_CompositeExtentBasedOn.Dependent"
                   "CIM_ProtectedExtentBasedOn.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The ProtectedSpaceExtent which is built on the Physical Extent.")
                 :KEY)
                :INITFORM "CIM_ProtectedSpaceExtent"))
              (:CIM-NAME "CIM_PSExtentBasedOnPExtent")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED
                ("CIM_ProtectedExtentBasedOn" "CIM_CompositeExtentBasedOn"))
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Device::SccExtents")
               (:DESCRIPTION
                "Covered by ProtectedExtentBasedOn or CompositeExtentBasedOn, since PhysicalExtent itself is deprecated in lieu of these associations. ProtectedSpaceExtents are BasedOn a PhysicalExtent. This relationship is made explicit by this association.")))