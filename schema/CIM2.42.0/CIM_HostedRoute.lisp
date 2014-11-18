
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedRoute.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDROUTE (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The network element that scopes/provides context for the route.")
                 :KEY)
                :INITFORM "CIM_System")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The next hop route defined on the System.")
                 :KEY)
                :INITFORM "CIM_NextHopRoute"))
              (:CIM-NAME "CIM_HostedRoute")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::Routes")
               (:DESCRIPTION
                "HostedRoute describes the relationship between the route and the system in whose context it is defined.")))