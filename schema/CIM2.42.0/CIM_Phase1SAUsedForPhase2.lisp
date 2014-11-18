
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Phase1SAUsedForPhase2.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PHASE1SAUSEDFORPHASE2 (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "Phase 1 SAEndpoint that protected the negotiation of the phase 2 Security Association. An example of a phase 1 endpoint is an IKESAEndpoint.")
                 :KEY)
                :INITFORM "CIM_SecurityAssociationEndpoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The phase 2 SAEndpoint.") :KEY)
                :INITFORM "CIM_IPsecSAEndpoint"))
              (:CIM-NAME "CIM_Phase1SAUsedForPhase2")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Network::IPsec")
               (:DESCRIPTION
                "Phase1SAUsedForPhase2 associates a phase 1 endpoint (such as an IKESAEndpoint) with an IPsecSAEndpoint that was negotiated using that phase 1 Security Association.")))