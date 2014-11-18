
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RedundancyComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_REDUNDANCYCOMPONENT (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_MemberOfCollection.Collection")) :AGGREGATE
                 (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "The RedundancyComponent association indicates that 'this set of fans' or 'these physical extents' participate in a single RedundancyGroup.")
                 :KEY)
                :INITFORM "CIM_RedundancyGroup")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_MemberOfCollection.Member"))
                 (:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The component of the redundancy group.") :KEY)
                :INITFORM "CIM_ManagedSystemElement"))
              (:CIM-NAME "CIM_RedundancyComponent")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_MemberOfCollection")) (NIL "true")
               (:VERSION "2.13.0") (:UML-PACKAGE-PATH "CIM::Core::Redundancy")
               (:DESCRIPTION
                "A RedundancyGroup aggregates Managed System Elements and indicates that these elements, taken together, provide redundancy. All elements aggregated in a RedundancyGroup should be instantiations of the same object class. 
The use of this class is being depreacted in lieu of using MemberOfCollection in conjunction with RedundancySet.")))