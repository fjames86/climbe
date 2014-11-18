
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedBGPPeerGroup.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDBGPPEERGROUP (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The AutonomousSystem that scopes the BGP peer group.")
                 :KEY)
                :INITFORM "CIM_AutonomousSystem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION
                  "The BGP peer group defined in the context of the AutonomousSystem.")
                 :KEY)
                :INITFORM "CIM_BGPPeerGroup"))
              (:CIM-NAME "CIM_HostedBGPPeerGroup")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "A BGPPeerGroup is weak to the AutonomousSystem that contains it. This association formalizes that relationship.")))