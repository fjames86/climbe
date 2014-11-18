
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ListsInRoutingPolicy.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LISTSINROUTINGPOLICY (CIM_COMPONENT)
              ((LISTSEQUENCE UINT16 :CIM-NAME "ListSequence" :QUALIFIERS
                ((:DESCRIPTION
                  "The position of the FilterList relative to all other entries in the RoutingPolicy."))
                :INITFORM NIL)
               (GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "The RoutingPolicy, which aggregates the set of FilterLists.")
                 :KEY)
                :INITFORM "CIM_RoutingPolicy")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "A FilterList, which is part-of the RoutingPolicy.")
                 :KEY)
                :INITFORM "CIM_FilterList"))
              (:CIM-NAME "CIM_ListsInRoutingPolicy")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::RoutingForwarding")
               (:DESCRIPTION
                "This is a specialization of the CIM_Component aggregation which is used to define a set of FilterLists that are aggregated by a particular RoutingPolicy.")))