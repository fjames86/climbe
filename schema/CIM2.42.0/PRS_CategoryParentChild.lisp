
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/PRS_CategoryParentChild.xml"

(in-package #:climbe)


(DEFCIM-CLASS PRS_CATEGORYPARENTCHILD (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The parent PRS_Category used for classification.")
                 (:MAX "1") :KEY)
                :INITFORM "PRS_Category")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The child PRS_Category used for classification.")
                 :KEY)
                :INITFORM "PRS_Category"))
              (:CIM-NAME "PRS_CategoryParentChild")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "PRS::Support")
               (:DESCRIPTION
                "PRS_CategoryParentChild is used to define classification hierarchies.")))