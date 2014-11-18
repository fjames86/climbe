
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ResourceAllocationFromPool.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_RESOURCEALLOCATIONFROMPOOL (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The resource pool.") :KEY)
                :INITFORM "CIM_ResourcePool")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The resource allocation.") :KEY)
                :INITFORM "CIM_ResourceAllocationSettingData"))
              (:CIM-NAME "CIM_ResourceAllocationFromPool")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::System::Resource")
               (:DESCRIPTION
                "ResourceAllocationFromPool associates an instance of CIM_ResourceAllocationSettingData representing a resource allocation with the CIM_ResourcePool from which it is allocated.")))