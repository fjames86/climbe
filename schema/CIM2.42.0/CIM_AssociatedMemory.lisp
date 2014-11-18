
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssociatedMemory.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSOCIATEDMEMORY (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "Memory installed on or associated with a Device.")
                 :KEY)
                :INITFORM "CIM_Memory")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The LogicalElement.")
                 :KEY)
                :INITFORM "CIM_LogicalElement"))
              (:CIM-NAME "CIM_AssociatedMemory")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Device::Memory")
               (:DESCRIPTION
                "LogicalElements may have Memory installed on them or otherwise associated with them - such as CacheMemory. This is made explicit in this association.")))