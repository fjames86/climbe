
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BGPRoutingPolicy.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BGPROUTINGPOLICY (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The BGP routing policy object.") :KEY)
                :INITFORM "CIM_RoutingPolicy")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The BGPService that operates according to the routing policy.")
                 :KEY)
                :INITFORM "CIM_BGPService"))
              (:CIM-NAME "CIM_BGPRoutingPolicy")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "This is a specialization of the Dependency association, and defines the relationship between a BGPService and the RoutingPolicy that control it.")))