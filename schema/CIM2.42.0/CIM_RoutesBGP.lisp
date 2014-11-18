
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RoutesBGP.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ROUTESBGP (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "2")
                 (:DESCRIPTION
                  "The BGPProtocolEndpoints that represent the source and destination (or at least the next hop) of the BGP route.")
                 :KEY)
                :INITFORM "CIM_BGPProtocolEndpoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1")
                 (:DESCRIPTION
                  "The routing table entry that represents a BGP route.")
                 :KEY)
                :INITFORM "CIM_BGPIPRoute"))
              (:CIM-NAME "CIM_RoutesBGP")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "This association defines a BGP route, and makes explicit the dependency between a BGPIPRoute and a BGPProtocolEndpoint.")))