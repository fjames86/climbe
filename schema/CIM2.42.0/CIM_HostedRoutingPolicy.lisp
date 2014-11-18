
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedRoutingPolicy.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDROUTINGPOLICY (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The network device/computer system that scopes the RoutingPolicy.")
                 :KEY)
                :INITFORM "CIM_ComputerSystem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION
                  "The routing policy defined in the context of the network device.")
                 :KEY)
                :INITFORM "CIM_RoutingPolicy"))
              (:CIM-NAME "CIM_HostedRoutingPolicy")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::RoutingForwarding")
               (:DESCRIPTION
                "A RoutingPolicy is weak to the network device (i.e., the ComputerSystem) that contains it. This association formalizes that relationship.")))