
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SwitchPortSpanningTree.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SWITCHPORTSPANNINGTREE (CIM_SERVICESAPDEPENDENCY)
              ((PRIORITY UINT8 :CIM-NAME "Priority" :QUALIFIERS
                ((:DESCRIPTION
                  "The priority assigned to the port. Contained in the first octet of the two-octet port ID; the other octet is the port number.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BRIDGE-MIB.dot1dStpPortPriority")))
                :INITFORM NIL)
               (STATE UINT16 :CIM-NAME "State" :QUALIFIERS
                ((:DESCRIPTION
                  "The current state of the port as determined by the spanning tree protocol.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" "6"))
                 (:VALUES
                  ("Disabled" "Blocking" "Listening" "Learning" "Forwarding"
                   "Broken"))
                 (:MAPPING-STRINGS ("MIB.IETF|BRIDGE-MIB.dot1dStpPortState")))
                :INITFORM NIL)
               (ENABLE UINT16 :CIM-NAME "Enable" :QUALIFIERS
                ((:DEPRECATED ("CIM_EnabledLogicalElement.EnabledState"))
                 (:DESCRIPTION
                  "The enabled/disabled status of the port. This property is deprecated since the status of the port is available by inheritance from EnabledLogicalElement.")
                 (:VALUE-MAP ("1" "2")) (:VALUES ("Enabled" "Disabled"))
                 (:MAPPING-STRINGS ("MIB.IETF|BRIDGE-MIB.dot1dStpPortEnable")))
                :INITFORM NIL)
               (PATHCOST UINT16 :CIM-NAME "PathCost" :QUALIFIERS
                ((:DESCRIPTION
                  "The contribution of this port to the path cost of paths towards the spanning tree root which include this port.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BRIDGE-MIB.dot1dStpPortPathCost")))
                :INITFORM NIL)
               (DESIGNATEDROOT STRING :CIM-NAME "DesignatedRoot" :QUALIFIERS
                ((:DESCRIPTION
                  "The bridge identifier of the root bridge for the segment to which the port is attached, as transmitted by the designated bridge for the segment.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BRIDGE-MIB.dot1dStpPortDesignatedRoot")))
                :INITFORM NIL)
               (DESIGNATEDCOST UINT16 :CIM-NAME "DesignatedCost" :QUALIFIERS
                ((:DESCRIPTION
                  "The cost of the path to the root offered by the designated bridge for the segment.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BRIDGE-MIB.dot1dStpPortDesignatedCost")))
                :INITFORM NIL)
               (DESIGNATEDBRIDGE STRING :CIM-NAME "DesignatedBridge"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The bridge identifier of the designated bridge for the segment to which the port is attached.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BRIDGE-MIB.dot1dStpPortDesignatedBridge")))
                :INITFORM NIL)
               (DESIGNATEDPORT UINT16 :CIM-NAME "DesignatedPort" :QUALIFIERS
                ((:DESCRIPTION
                  "The port identifier of the port on the designated bridge serving the segment to which the port is attached.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|BRIDGE-MIB.dot1dStpPortDesignatedPort")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The SwitchPort.")
                 :KEY)
                :INITFORM "CIM_SwitchPort")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The SpanningTreeService.") :KEY)
                :INITFORM "CIM_SpanningTreeService"))
              (:CIM-NAME "CIM_SwitchPortSpanningTree")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::SwitchingBridging")
               (:DESCRIPTION
                "A switch participating in the spanning tree maintains spanning-tree specific information about each port whose forwarding is determined by the spanning tree. This association represents that information.")))