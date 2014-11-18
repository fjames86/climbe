
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SwitchPortPair.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SWITCHPORTPAIR (CIM_SAPSAPDEPENDENCY)
              ((BRIDGENUM UINT16 :CIM-NAME "BridgeNum" :QUALIFIERS
                ((:DESCRIPTION
                  "A bridge number that uniquely identifies the path provided by this source routing bridge between the segments connected to high and low ports. The purpose of bridge number is to disambiguate between multiple paths connecting the same two LANs.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|SOURCE-ROUTING-MIB.dot1dPortPairBridgeNum")))
                :INITFORM NIL)
               (BRIDGESTATE UINT16 :CIM-NAME "BridgeState" :QUALIFIERS
                ((:DESCRIPTION
                  "The state of the pairing. Writing 'invalid(3)' to this property removes the association instance.")
                 (:VALUE-MAP ("1" "2" "3"))
                 (:VALUES ("Enabled" "Disabled" "Invalid"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|SOURCE-ROUTING-MIB.dot1dPortPairBridgeState")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The lower numbered port.") :KEY)
                :INITFORM "CIM_SwitchPort")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The higher numbered port.") :KEY)
                :INITFORM "CIM_SwitchPort"))
              (:CIM-NAME "CIM_SwitchPortPair")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::SwitchingBridging")
               (:DESCRIPTION
                "This association represents information regarding port pairings that is used by the SourceRoutingService of a switch.")))