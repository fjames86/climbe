
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RealizesAggregatePExtent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_REALIZESAGGREGATEPEXTENT (CIM_REALIZESEXTENT)
              ((STARTINGADDRESS UINT64 :CIM-NAME "StartingAddress" :QUALIFIERS
                ((:DESCRIPTION
                  "The starting address on the PhysicalComponent where the StorageExtent begins. Ending address of the StorageExtent is determined using the NumberOfBlocks and Block Size properties of the StorageExtent object."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_RealizesExtent.Antecedent"))
                 (:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "The PhysicalMedia on which the Extent is realized.")
                 :KEY)
                :INITFORM "CIM_PhysicalMedia")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_RealizesExtent.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The AggregatePExtent that is located on the Media.")
                 :KEY)
                :INITFORM "CIM_AggregatePExtent"))
              (:CIM-NAME "CIM_RealizesAggregatePExtent")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_RealizesExtent"))
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Device::SccExtents")
               (:DESCRIPTION
                "AggregatePExtents are realized on a PhysicalMedia. This is described by RealizesAggregatePExtent. However, there is no need for the specificity of this association. It is deprecated in lieu of the generic RealizesExtent relationship.")))