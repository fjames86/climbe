
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedBGPRouteMap.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDBGPROUTEMAP (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The AutonomousSystem that scopes the BGPRouteMap.")
                 :KEY)
                :INITFORM "CIM_AutonomousSystem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION
                  "The BGPRouteMap defined in the context of the AutonomousSystem.")
                 :KEY)
                :INITFORM "CIM_BGPRouteMap"))
              (:CIM-NAME "CIM_HostedBGPRouteMap")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "A BGPRouteMap is weak to the AutonomousSystem that contains it. This association formalizes that relationship.")))