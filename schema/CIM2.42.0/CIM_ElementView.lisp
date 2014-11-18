
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ElementView.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ELEMENTVIEW (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                (:KEY (:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "Antecedent shall be a reference to a CIM_ManagedElement that is an instance in the normalized representation of the managed resource that contributes to the view."))
                :INITFORM "CIM_ManagedElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                (:KEY (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "Dependent shall be a reference to an instance of CIM_View that represents a de-normalized or aggregate view of one or more instances that contribute to the view."))
                :INITFORM "CIM_View"))
              (:CIM-NAME "CIM_ElementView")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.34.0")
               (:UML-PACKAGE-PATH "CIM::Core::CoreElements")
               (:DESCRIPTION
                "CIM_ElementView is used to associate an instance of CIM_View with an instance representing one or more instances of managed resources that contribute to the view.")))