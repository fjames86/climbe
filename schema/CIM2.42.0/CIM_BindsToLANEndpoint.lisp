
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BindsToLANEndpoint.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BINDSTOLANENDPOINT (CIM_BINDSTO)
              ((FRAMETYPE UINT16 :CIM-NAME "FrameType" :QUALIFIERS
                ((:DESCRIPTION
                  "This describes the framing method for the upper layer SAP or Endpoint that is bound to the LANEndpoint. Note: \"Raw802.3\" is only known to be used with the IPX protocol.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES ("Unknown" "Ethernet" "802.2" "SNAP" "Raw802.3")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The underlying LANEndpoint, which is depended upon.")
                 :KEY)
                :INITFORM "CIM_LANEndpoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The AccessPoint or ProtocolEndpoint dependent on the LANEndpoint.")
                 :KEY)
                :INITFORM "CIM_ServiceAccessPoint"))
              (:CIM-NAME "CIM_BindsToLANEndpoint")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::ProtocolEndpoints")
               (:DESCRIPTION
                "This association makes explicit the dependency of a SAP or ProtocolEndpoint on an underlying LANEndpoint, on the same system.")))