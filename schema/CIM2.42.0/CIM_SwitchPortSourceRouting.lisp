
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SwitchPortSourceRouting.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SWITCHPORTSOURCEROUTING (CIM_SERVICESAPDEPENDENCY)
              ((HOPCOUNT UINT16 :CIM-NAME "HopCount" :QUALIFIERS
                ((:DESCRIPTION
                  "The maximum number of routing descriptors allowed in an All Paths or Spanning Tree Explorer frames.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|SOURCE-ROUTING-MIB.dot1dSrPortHopCount")))
                :INITFORM NIL)
               (LOCALSEGMENT UINT16 :CIM-NAME "LocalSegment" :QUALIFIERS
                ((:DESCRIPTION
                  "The segment number that uniquely identifies the segment to which this port is connected. Current source routing protocols limit this value to the range: 0 through 4095. (The value 0 is used by some management applications for special test cases.) A value of 65535 signifies that no segment number is assigned to this port.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|SOURCE-ROUTING-MIB.dot1dSrPortLocalSegment")))
                :INITFORM NIL)
               (BRIDGENUM UINT16 :CIM-NAME "BridgeNum" :QUALIFIERS
                ((:DESCRIPTION
                  "A bridge number uniquely identifies a bridge when more than one bridge is used to span the same two segments. Current source routing protocols limit this value to the range: 0 through 15. A value of 65535 signifies that no bridge number is assigned to this bridge.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|SOURCE-ROUTING-MIB.dot1dSrPortBridgeNum")))
                :INITFORM NIL)
               (TARGETSEGMENT UINT16 :CIM-NAME "TargetSegment" :QUALIFIERS
                ((:DESCRIPTION
                  "The segment number that corresponds to the target segment to which this port is considered connected. Current source routing protocols limit this value to the range: 0 through 4095. (The value 0 is used by some management applications for special test cases.) A value of 65535 signifies that no target segment is assigned to this port.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|SOURCE-ROUTING-MIB.dot1dSrPortTargetSegment")))
                :INITFORM NIL)
               (STESPANMODE UINT16 :CIM-NAME "STESpanMode" :QUALIFIERS
                ((:DESCRIPTION
                  "Determines how the port behaves when presented with a Spanning Tree Explorer frame. The value 'disabled(2)' indicates that the port will not accept or send Spanning Tree Explorer packets; any STE packets received will be silently discarded. The value 'forced(3)' indicates the port will always accept and propagate Spanning Tree Explorer frames. (This allows a manually configured Spanning Tree for this class of packet to be configured.) Note that unlike transparent bridging, it is not catastrophic to the network if there are loops. The value 'auto-span(1)' can only be returned by a bridge that both implements the Spanning Tree Protocol and has use of the protocol enabled on this port. 

The behavior of the port for Spanning Tree Explorer frames is determined by the value of the State property of the SwitchPortSpanningTree association for the port. If the port is in the 'forwarding' state, the frame will be accepted or propagated. Otherwise, it will be silently discarded.")
                 (:VALUE-MAP ("1" "2" "3"))
                 (:VALUES ("Auto-Span" "Disabled" "Forced"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|SOURCE-ROUTING-MIB.dot1dSrPortSTESpanMod"))
                 (:MODEL-CORRESPONDENCE ("CIM_SwitchPortSpanningTree.State")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The SwitchPort.")
                 :KEY)
                :INITFORM "CIM_SwitchPort")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "The SourceRoutingService.") :KEY)
                :INITFORM "CIM_SourceRoutingService"))
              (:CIM-NAME "CIM_SwitchPortSourceRouting")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::SwitchingBridging")
               (:DESCRIPTION
                "A switch capable of source routing maintains source-routing specific information about each port. This association represents that information.")))