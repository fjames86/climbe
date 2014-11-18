
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_ProductComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_PRODUCTCOMPONENT (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The PRS_Product which contains the component.")
                 :KEY)
                :INITFORM "PRS_Product")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The component PRS_Product.") :KEY)
                :INITFORM "PRS_Product"))
              (:CIM-NAME "PRS_ProductComponent")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "PRS_ProductComponent is used to describe 'has a' relationships between Products and their components parts. See PRS_ProductParentChild for 'is a' relationships.")))