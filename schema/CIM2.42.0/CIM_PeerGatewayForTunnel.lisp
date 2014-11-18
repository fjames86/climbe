
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PeerGatewayForTunnel.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PEERGATEWAYFORTUNNEL (CIM_DEPENDENCY)
              ((SEQUENCENUMBER UINT16 :CIM-NAME "SequenceNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "SequenceNumber indicates the ordering to be used when selecting a PeerGateway instance for an IPsecTunnelAction. Lower values are evaluated first.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|PeerGatewayForTunnel.SequenceNumber")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The security gateway for the SA. Note that the absense of this association indicates that: 
- When acting as a responder, IKE will accept phase 1 negotiations with any other security gateway 
- When acting as an initiator, IKE will use the destination IP address (of the IP packets which triggered the SARule) as the IP address of the peer IKE entity.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|PeerGatewayForTunnel.Antecedent"))
                 :KEY)
                :INITFORM "CIM_RemoteServiceAccessPoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The IPsecTunnelAction that requires a security gateway.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|PeerGatewayForTunnel.Dependent"))
                 :KEY)
                :INITFORM "CIM_IPsecTunnelAction"))
              (:CIM-NAME "CIM_PeerGatewayForTunnel")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::IPsecPolicy")
               (:DESCRIPTION
                "PeerGatewayForTunnel identifies an ordered list of security gateways to be used in negotiating and constructing a tunnel. A security gateway is simply a particular instance of RemoteServiceAccessPoint.")
               (:MAPPING-STRINGS
                ("IPSP Policy Model.IETF|PeerGatewayForTunnel"))))