
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CollectedCollections.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COLLECTEDCOLLECTIONS NIL
              ((COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                (:KEY :AGGREGATE
                 (:DESCRIPTION
                  "The 'higher level' or parent element in the aggregation."))
                :INITFORM "CIM_CollectionOfMSEs")
               (COLLECTIONINCOLLECTION NIL :CIM-NAME "CollectionInCollection"
                :QUALIFIERS (:KEY (:DESCRIPTION "The 'collected' Collection."))
                :INITFORM "CIM_CollectionOfMSEs"))
              (:CIM-NAME "CIM_CollectedCollections")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Collection")
               (:DESCRIPTION
                "CIM_CollectedCollections is an aggregation association representing that a CollectionOfMSEs can itself be contained in a CollectionOfMSEs.")))