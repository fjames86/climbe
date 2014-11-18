
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CollectedMSEs.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COLLECTEDMSES (CIM_MEMBEROFCOLLECTION)
              ((COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Collection")
                 (:DESCRIPTION
                  "The grouping or 'bag' object that represents the Collection.")
                 :KEY)
                :INITFORM "CIM_CollectionOfMSEs")
               (MEMBER NIL :CIM-NAME "Member" :QUALIFIERS
                       ((:OVERRIDE "Member")
                        (:DESCRIPTION "The members of the Collection.") :KEY)
                       :INITFORM "CIM_ManagedSystemElement"))
              (:CIM-NAME "CIM_CollectedMSEs")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Core::Collection")
               (:DESCRIPTION
                "CIM_CollectedMSEs is a generic association used to establish the members of the grouping object, CollectionOf MSEs.")))