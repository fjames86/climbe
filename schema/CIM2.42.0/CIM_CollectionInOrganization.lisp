
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CollectionInOrganization.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COLLECTIONINORGANIZATION NIL
              ((PARENT NIL :CIM-NAME "Parent" :QUALIFIERS
                (:KEY :AGGREGATE (:MAX "1")
                 (:DESCRIPTION
                  "The parent organization responsible for the collection."))
                :INITFORM "CIM_OrganizationalEntity")
               (CHILD NIL :CIM-NAME "Child" :QUALIFIERS
                (:KEY (:DESCRIPTION "The collection.")) :INITFORM
                "CIM_Collection"))
              (:CIM-NAME "CIM_CollectionInOrganization")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::User::Org")
               (:DESCRIPTION
                "CIM_CollectionInOrganization is an association used to establish a parent-child relationship between a collection and an 'owning' OrganizationalEntity. A single collection should not have both a CollectionInOrganization and a CollectionInSystem association.")))