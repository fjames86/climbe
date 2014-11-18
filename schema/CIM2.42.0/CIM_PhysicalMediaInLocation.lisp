
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PhysicalMediaInLocation.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PHYSICALMEDIAINLOCATION (CIM_DEPENDENCY)
              ((ORIENTATION UINT16 :CIM-NAME "Orientation" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumeration expressing which 'Side' of the Media is facing up. Since sides can be named by various schemes (0/1 or A/B), both schemes are expressed in the Values array of this property. Also, the value 5 (\"Not Applicable\" describes that orientation is not pertinent for this Media.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "Side 0" "Side 1" "Side A" "Side B"
                   "Not Applicable")))
                :INITFORM NIL)
               (TIMEOFLASTPLACEMENT DATETIME :CIM-NAME "TimeOfLastPlacement"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The date and time that the Media was last placed into the referenced Location."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "The StorageMediaLocation which holds the PhysicalMedia.")
                 :KEY)
                :INITFORM "CIM_StorageMediaLocation")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The Media in the Location.") :KEY)
                :INITFORM "CIM_PhysicalMedia"))
              (:CIM-NAME "CIM_PhysicalMediaInLocation")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::PhysicalMedia")
               (:DESCRIPTION
                "Within a StorageLibrary, all Media should be accounted for, and be present in some Storage Location. This relationship is made explicit by the PhysicalMediaInLocation association. In addition, one can determine if a Location is empty or full based on whether this association exists for the StorageMediaLocation.")))