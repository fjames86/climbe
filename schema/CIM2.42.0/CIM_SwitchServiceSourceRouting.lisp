
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SwitchServiceSourceRouting.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SWITCHSERVICESOURCEROUTING (CIM_SERVICECOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1")
                 (:DESCRIPTION "The parent SwitchService.") :KEY)
                :INITFORM "CIM_SwitchService")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The component SourceRoutingService.") :KEY)
                :INITFORM "CIM_SourceRoutingService"))
              (:CIM-NAME "CIM_SwitchServiceSourceRouting")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::SwitchingBridging")
               (:DESCRIPTION
                "An association linking SwitchService to a component SourceRoutingService. The cardinality of the SourceRoutingService is 0..1 for a VLAN-unaware switch.")))