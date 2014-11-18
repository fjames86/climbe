
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_ProductParentChild.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_PRODUCTPARENTCHILD (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The parent PRS_Product.") :KEY)
                :INITFORM "PRS_Product")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The child PRS_Product.") :KEY)
                :INITFORM "PRS_Product"))
              (:CIM-NAME "PRS_ProductParentChild")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "Products may exist in a hierarchy of relationships with related Products. If a Producer deems these hierarchy relationships are relevant to the current Problem or Resolution, then the position of the Product in a hierarchy can be implied using one of two types of relationships: 'is a' and 'has a'. An 'is a' relationship implies a classification, such as versioning or typing. A 'has a' relationship implies that one product contains another. The PRS_ProductParentChild association is used to imply an 'is a' hierarchy. Use the ProductComponent association to imply 'has a' relationships.")))