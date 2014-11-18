
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ElementAllocatedFromPool.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ELEMENTALLOCATEDFROMPOOL (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The resource pool.") :KEY)
                :INITFORM "CIM_ResourcePool")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The allocated resource.") :KEY)
                :INITFORM "CIM_LogicalElement"))
              (:CIM-NAME "CIM_ElementAllocatedFromPool")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::Core::Resource")
               (:DESCRIPTION
                "ElementAllocatedFromPool associates an instance of CIM_LogicalElement representing an allocated Resource with the CIM_ResourcePool from which it was allocated.")))