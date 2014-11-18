
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FRUPhysicalElements.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FRUPHYSICALELEMENTS NIL
              ((FRU NIL :CIM-NAME "FRU" :QUALIFIERS
                (:KEY :AGGREGATE (:MAX "1") (:DESCRIPTION "The FRU."))
                :INITFORM "CIM_FRU")
               (COMPONENT NIL :CIM-NAME "Component" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The PhysicalElement which is a part of the FRU."))
                :INITFORM "CIM_PhysicalElement"))
              (:CIM-NAME "CIM_FRUPhysicalElements")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Core::ProductFRU")
               (:DESCRIPTION
                "Indicates the PhysicalElements that make up a FRU.")))