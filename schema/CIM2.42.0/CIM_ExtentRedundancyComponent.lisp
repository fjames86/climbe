
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ExtentRedundancyComponent.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_EXTENTREDUNDANCYCOMPONENT (CIM_REDUNDANCYCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_MemberOfCollection.Collection")) :AGGREGATE
                 (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION "The StorageRedundancyGroup.") :KEY)
                :INITFORM "CIM_StorageRedundancyGroup")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_MemberOfCollection.Member"))
                 (:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The StorageExtent participating in the RedundancyGroup.")
                 :KEY)
                :INITFORM "CIM_StorageExtent"))
              (:CIM-NAME "CIM_ExtentRedundancyComponent")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_MemberOfCollection")) (NIL "true")
               (:VERSION "2.13.0") (:UML-PACKAGE-PATH "CIM::Core::Redundancy")
               (:DESCRIPTION
                "Describes the StorageExtents participating in a Storage RedundancyGroup. 
The use of this class is being deprecated in lieu of using MemberOfCollection in conjunction with StorageRedundancySet.")))