
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CollectionInSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COLLECTIONINSYSTEM NIL
              ((PARENT NIL :CIM-NAME "Parent" :QUALIFIERS
                ((:DEPRECATED ("CIM_OwningCollectionElement.OwningElement"))
                 :KEY :AGGREGATE (:MAX "1")
                 (:DESCRIPTION
                  "The parent system responsible for the collection."))
                :INITFORM "CIM_System")
               (CHILD NIL :CIM-NAME "Child" :QUALIFIERS
                ((:DEPRECATED ("CIM_OwningCollectionElement.OwnedElement"))
                 :KEY (:DESCRIPTION "The collection."))
                :INITFORM "CIM_Collection"))
              (:CIM-NAME "CIM_CollectionInSystem")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_OwningCollectionElement.OwningElement"))
               (NIL "true") (:VERSION "2.37.0")
               (:UML-PACKAGE-PATH "CIM::User::Org")
               (:DESCRIPTION
                "CIM_CollectionInSystem is deprecated in lieu of CIM_OwningCollectionElement, which is semantically equivalent. 
CIM_CollectionInSystem is an association used to establish a parent-child relationship between a collection and an 'owning' System such as an AdminDomain or ComputerSystem. A single collection should not have both a CollectionInOrganization and a CollectionInSystem association.")))