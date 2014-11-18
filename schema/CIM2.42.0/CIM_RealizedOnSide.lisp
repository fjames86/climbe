
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RealizedOnSide.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_REALIZEDONSIDE (CIM_REALIZESEXTENT)
              ((SIDE UINT16 :CIM-NAME "Side" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration expressing on which 'Side' the Extent is realized. Since sides can be named by various schemes (0/1 or A/B), both schemes are expressed in the Values array of this property.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES ("Unknown" "Side 0" "Side 1" "Side A" "Side B")))
                :INITFORM NIL)
               (STARTINGADDRESS UINT64 :CIM-NAME "StartingAddress" :QUALIFIERS
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
                  "The StorageExtent that is located on the Component.")
                 :KEY)
                :INITFORM "CIM_StorageExtent"))
              (:CIM-NAME "CIM_RealizedOnSide")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageExtents")
               (:DESCRIPTION
                "Since removable PhysicalMedia can be dual-sided, there is the possibility for StorageExtents to be realized on a single side of the Media. This association is a specialization of the RealizesExtent relationship, adding a Side property to express the Media's orientation details.")))