
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Spared.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SPARED (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "A ManagedElement that has replaced/spared another the reference Dependent element.")
                 :KEY)
                :INITFORM "CIM_ManagedElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The Element or Elements (in the case of a collection) that have been replaced/spared.")
                 :KEY)
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_Spared")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Redundancy")
               (:DESCRIPTION
                "The Spared association indicates an element that is acting as a replacement for another element. If the Dependent references a Collection, this indicates that 'spared' element is a member of that collection and the actual mapping between the spare and the spared is un-important.")))