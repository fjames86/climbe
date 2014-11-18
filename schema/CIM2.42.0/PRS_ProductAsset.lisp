
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_ProductAsset.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_PRODUCTASSET (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The product.") :KEY)
                :INITFORM "PRS_Product")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "The expression.") :KEY)
                :INITFORM "PRS_Expression"))
              (:CIM-NAME "PRS_ProductAsset")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "PRS_ProductAsset is used to provide specific information about a PRS_Product. PRS_ProductAsset associates this information to a PRS_Product using one or more Statements associated to a PRS_Expression.")))