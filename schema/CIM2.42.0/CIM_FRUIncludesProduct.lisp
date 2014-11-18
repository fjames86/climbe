
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FRUIncludesProduct.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FRUINCLUDESPRODUCT NIL
              ((FRU NIL :CIM-NAME "FRU" :QUALIFIERS
                ((:DEPRECATED ("CIM_ConcreteComponent.GroupComponent")) :KEY
                 :AGGREGATE (:MAX "1") (:DESCRIPTION "The FRU."))
                :INITFORM "CIM_FRU")
               (COMPONENT NIL :CIM-NAME "Component" :QUALIFIERS
                ((:DEPRECATED ("CIM_ConcreteComponent.PartComponent")) :KEY
                 (:DESCRIPTION "The Product which is a part of the FRU."))
                :INITFORM "CIM_Product"))
              (:CIM-NAME "CIM_FRUIncludesProduct")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_ConcreteComponent"))
               (NIL "true") :COMPOSITION (:VERSION "2.8.1000")
               (:UML-PACKAGE-PATH "CIM::Core::ProductFRU")
               (:DESCRIPTION
                "Indicates that a FRU may be composed of other Product(s). Indicates that a FRU may be composed of other Product(s). The use of this association has been deprecated since the FRU class itself has been deprecated. The composition of ReplacementFRUs is described by the ConcreteComponent association.")))