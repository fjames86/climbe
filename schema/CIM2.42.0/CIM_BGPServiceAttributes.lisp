
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BGPServiceAttributes.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BGPSERVICEATTRIBUTES (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                ((:DEPRECATED ("No value")) :AGGREGATE
                 (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION
                  "The BGPService that aggregates BGPPathAttributes as part of its routing information.")
                 :KEY)
                :INITFORM "CIM_BGPService")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "PartComponent")
                 (:MAX "1")
                 (:DESCRIPTION
                  "The BGP attribute, which are part-of the BGP UPDATE message.")
                 :KEY)
                :INITFORM "CIM_BGPPathAttributes"))
              (:CIM-NAME "CIM_BGPServiceAttributes")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value")) (NIL "true")
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "This is a specialization of the Component aggregation. This aggregation defines the set of BGPPathAttributes that are transmitted in per-path UPDATE messages. The association is deprecated since it is incorrectly defined as a Component relationship, and since the properties of BGPPathAttribute are path/endpoint-specific (not defined at the level of the Service).")))