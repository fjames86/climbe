
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SwitchServiceTransparentBridging.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SWITCHSERVICETRANSPARENTBRIDGING (CIM_SERVICECOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1")
                 (:DESCRIPTION "The parent SwitchService.") :KEY)
                :INITFORM "CIM_SwitchService")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The component BridgingService.") :KEY)
                :INITFORM "CIM_TransparentBridgingService"))
              (:CIM-NAME "CIM_SwitchServiceTransparentBridging")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::SwitchingBridging")
               (:DESCRIPTION
                "An association linking a SwitchService to a component TransparentBridgingService. The cardinality of the TransparentBridgingService is 0..1 for a VLAN-unaware switch.")))