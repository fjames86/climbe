
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FilteredBGPAttributes.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FILTEREDBGPATTRIBUTES (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "The RoutingPolicy, which aggregates a set of BGP attributes.")
                 :KEY)
                :INITFORM "CIM_RoutingPolicy")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "A BGP attribute, which is part-of the RoutingPolicy.")
                 :KEY)
                :INITFORM "CIM_BGPAttributes"))
              (:CIM-NAME "CIM_FilteredBGPAttributes")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "This is a specialization of the Component aggregation, which is used to define the set of BGP Attributes that are used by a particular Routing Policy.")))