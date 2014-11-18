
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_VolumeSetBasedOnPSExtent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_VOLUMESETBASEDONPSEXTENT (CIM_BASEDON)
              ((LBASMAPPEDBYDECREMENTING BOOLEAN :CIM-NAME
                "LBAsMappedByDecrementing" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_CompositeExtentBasedOn.LBAsMappedByDecrementing"))
                 (:DESCRIPTION
                  "True if logical blocks in the ProtectedSpaceExtent are mapped in decrementing order. This property corresponds to the INCDEC value in the SCC-2 Volume Set PS_Extent Descriptor."))
                :INITFORM NIL)
               (LBAMAPPINGINCLUDESCHECKDATA BOOLEAN :CIM-NAME
                "LBAMappingIncludesCheckData" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_CompositeExtentBasedOn.LBAMappingIncludesCheckData"))
                 (:DESCRIPTION
                  "True if the logical block mapping algorithm includes check data bytes. This property corresponds to the NOCHKSKIP attribute in the SCC-2 Volume Set PS_Extent Descriptor."))
                :INITFORM NIL)
               (STARTINGADDRESS UINT64 :CIM-NAME "StartingAddress" :QUALIFIERS
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
                ((:DEPRECATED ("CIM_CompositeExtentBasedOn.Antecedent"))
                 (:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION "The ProtectedSpaceExtent.") :KEY)
                :INITFORM "CIM_ProtectedSpaceExtent")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_CompositeExtentBasedOn.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The VolumeSet which is built on the ProtectedSpace Extent.")
                 :KEY)
                :INITFORM "CIM_VolumeSet"))
              (:CIM-NAME "CIM_VolumeSetBasedOnPSExtent")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_CompositeExtentBasedOn")) (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Device::SccExtents")
               (:DESCRIPTION
                "This association is deprecated in lieu of CompositeExtentBasedOn, since VolumeSets and ProtectedSpaceExtents are themselves deprecated. The relationship describes that VolumeSets are BasedOn on one or more ProtectedSpaceExtents.")))