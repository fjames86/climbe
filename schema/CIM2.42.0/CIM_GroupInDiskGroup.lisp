
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_GroupInDiskGroup.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_GROUPINDISKGROUP (CIM_COLLECTEDCOLLECTIONS)
              ((COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Collection") (:MAX "1")
                 (:DESCRIPTION
                  "The DiskGroup that is divided into smaller Collections.")
                 :KEY)
                :INITFORM "CIM_DiskGroup")
               (COLLECTIONINCOLLECTION NIL :CIM-NAME "CollectionInCollection"
                :QUALIFIERS
                ((:OVERRIDE "CollectionInCollection")
                 (:DESCRIPTION
                  "The DiskGroup that is a subset of the larger Group.")
                 :KEY)
                :INITFORM "CIM_DiskGroup"))
              (:CIM-NAME "CIM_GroupInDiskGroup")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::DiskGroup")
               (:DESCRIPTION
                "CIM_GroupInDiskGroup describes that a DiskGroup can be divided into smaller named Collections.")))