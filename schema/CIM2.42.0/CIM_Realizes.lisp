
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Realizes.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_REALIZES (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The physical component that implements the Device.")
                 :KEY)
                :INITFORM "CIM_PhysicalElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The LogicalDevice.")
                 :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_Realizes")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Core::Device")
               (:DESCRIPTION
                "CIM_Realizes is the association that defines the mapping between LogicalDevices and the PhysicalElements that implement them.")))