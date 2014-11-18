
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Switchable.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SWITCHABLE (CIM_BINDSTOLANENDPOINT)
              ((FRAMETYPE UINT16 :CIM-NAME "FrameType" :QUALIFIERS
                ((:DESCRIPTION
                  "This describes the framing method for the upper layer SAP or Endpoint that is bound to the LANEndpoint. Note: \"Raw802.3\" is only known to be used with the IPX protocol.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES ("Unknown" "Ethernet" "802.2" "SNAP" "Raw802.3")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_EndpointIdentity.SystemElement"))
                 (:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The switch port.") :KEY)
                :INITFORM "CIM_LANEndpoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_EndpointIdentity.SameElement"))
                 (:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "The LAN endpoint.") :KEY)
                :INITFORM "CIM_SwitchPort"))
              (:CIM-NAME "CIM_Switchable")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_EndpointIdentity"))
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::SwitchingBridging")
               (:DESCRIPTION
                "A switch port has a LANEndpoint that is exposed via this relationship. The associaiton is deprecated since a binding is not the correct relationship. The SwitchPort is simply another aspect of the LANEndpoint - which is indicated by the EndpointIdentity relationship.")))