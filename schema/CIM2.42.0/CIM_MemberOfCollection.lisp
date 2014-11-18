
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MemberOfCollection.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MEMBEROFCOLLECTION NIL
              ((COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                (:KEY :AGGREGATE
                 (:DESCRIPTION "The Collection that aggregates members."))
                :INITFORM "CIM_Collection")
               (MEMBER NIL :CIM-NAME "Member" :QUALIFIERS
                       (:KEY
                        (:DESCRIPTION
                         "The aggregated member of the Collection."))
                       :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_MemberOfCollection")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Core::Collection")
               (:DESCRIPTION
                "CIM_MemberOfCollection is an aggregation used to establish membership of ManagedElements in a Collection.")))