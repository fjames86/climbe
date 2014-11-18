
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProductParentChild.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRODUCTPARENTCHILD NIL
              ((PARENT NIL :CIM-NAME "Parent" :QUALIFIERS
                (:KEY :AGGREGATE
                 (:DESCRIPTION "The parent Product in the association."))
                :INITFORM "CIM_Product")
               (CHILD NIL :CIM-NAME "Child" :QUALIFIERS
                (:KEY (:DESCRIPTION "The child Product in the association."))
                :INITFORM "CIM_Product"))
              (:CIM-NAME "CIM_ProductParentChild")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Core::ProductFRU")
               (:DESCRIPTION
                "The CIM_ProductParentChild association defines a parent child hierarchy among Products. For example, a Product may come bundled with other Products.")))