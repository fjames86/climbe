
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ElementsLinked.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ELEMENTSLINKED (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The PhysicalLink.")
                 :KEY)
                :INITFORM "CIM_PhysicalLink")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The PhysicalElement that is linked.") :KEY)
                :INITFORM "CIM_PhysicalElement"))
              (:CIM-NAME "CIM_ElementsLinked")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Link")
               (:DESCRIPTION
                "The ElementsLinked association indicates which Physical Elements are cabled together by a PhysicalLink.")))