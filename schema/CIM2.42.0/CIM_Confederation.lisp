
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Confederation.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CONFEDERATION (CIM_SYSTEMCOMPONENT)
              ((PARENTASNUMBER UINT32 :CIM-NAME "ParentASNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "A unique identifier of the AutonomousSystem that contains the confederations."))
                :INITFORM NIL)
               (CHILDASNUMBER UINT32 :CIM-NAME "ChildASNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "A unique identifier of the Confederation within the AutonomousSystem."))
                :INITFORM NIL)
               (GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION
                  "The AutonomousSystem that contains the confederations.")
                 :KEY)
                :INITFORM "CIM_AutonomousSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The Confederation within the AutonomousSystem.")
                 :KEY)
                :INITFORM "CIM_AutonomousSystem"))
              (:CIM-NAME "CIM_Confederation")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "The BGP speakers in an AS are required to be fully meshed. This can lead to a huge number of TCP connections per router. One way to reduce the peering requirements is to use a confederation. A confederation effectively partitions one AS into a group of 'sub-ASs'. This enables all of the benefits of IBGP to be applied inside the confederation, while enabling EBGP to be run between each confederation. It also enables certain BGP attribute values to be preserved between confederations. However, to the outside world, the AS with its confederations appear to be a single AS.")))