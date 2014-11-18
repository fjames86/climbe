
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SystemPackaging.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SYSTEMPACKAGING (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The PhysicalElements that provide the packaging of a System.")
                 :KEY)
                :INITFORM "CIM_PhysicalElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The System whose packaging is described.")
                 :KEY)
                :INITFORM "CIM_System"))
              (:CIM-NAME "CIM_SystemPackaging")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Physical")
               (:DESCRIPTION
                "Similar to the way that LogicalDevices are 'Realized' by PhysicalElements, Systems can be associated with specific packaging or PhysicalElements. This association explicitly defines the relationship between a System and its packaging.")))