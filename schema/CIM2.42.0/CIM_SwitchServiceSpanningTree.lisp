
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SwitchServiceSpanningTree.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SWITCHSERVICESPANNINGTREE (CIM_SERVICECOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1")
                 (:DESCRIPTION "The parent SwitchService.") :KEY)
                :INITFORM "CIM_SwitchService")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The component SpanningTreeService.") :KEY)
                :INITFORM "CIM_SpanningTreeService"))
              (:CIM-NAME "CIM_SwitchServiceSpanningTree")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::SwitchingBridging")
               (:DESCRIPTION
                "An association linking SwitchService to a component SpanningTreeService. The cardinality of the SpanningTreeService is 0..1 for a VLAN-unaware switch.")))