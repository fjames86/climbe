
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PeerGatewayForPreconfiguredTunnel.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PEERGATEWAYFORPRECONFIGUREDTUNNEL (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "Security gateway for the preconfigured SA.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|PeerGatewayForPreconfiguredTunnel.Antecedent"))
                 :KEY)
                :INITFORM "CIM_RemoteServiceAccessPoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The PreconfiguredTunnelAction that requires a security gateway.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|PeerGatewayForPreconfiguredTunnel.Dependent"))
                 :KEY)
                :INITFORM "CIM_PreconfiguredTunnelAction"))
              (:CIM-NAME "CIM_PeerGatewayForPreconfiguredTunnel")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::IPsecPolicy")
               (:DESCRIPTION
                "PeerGatewayForPreconfiguredTunnel identifies at most one security gateway be used in constructing a preconfigured tunnel. A security gateway is simply a particular instance of RemoteServiceAccessPoint.")
               (:MAPPING-STRINGS
                ("IPSP Policy Model.IETF|PeerGatewayForPreconfiguredTunnel"))))