
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MemoryWithMedia.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MEMORYWITHMEDIA (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The Memory associated with PhysicalMedia.")
                 :KEY)
                :INITFORM "CIM_PhysicalMemory")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The PhysicalMedia.")
                 :KEY)
                :INITFORM "CIM_PhysicalMedia"))
              (:CIM-NAME "CIM_MemoryWithMedia")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::PhysicalMedia")
               (:DESCRIPTION
                "MemoryWithMedia indicates that Memory is associated with a PhysicalMedia and its cartridge. The Memory provides media identification and also stores user-specific data.")))