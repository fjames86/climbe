
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PeerOfSAEndpoint.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PEEROFSAENDPOINT (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The peer for the SAEndpoint.") :KEY)
                :INITFORM "CIM_RemoteServiceAccessPoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The IPsecSAEndpoint which has a peer.") :KEY)
                :INITFORM "CIM_IPsecSAEndpoint"))
              (:CIM-NAME "CIM_PeerOfSAEndpoint")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Network::IPsec")
               (:DESCRIPTION
                "PeerOfIPsecSAEndpoint identifies the peer of the IPsecSAEndpoint.")))