
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_EndpointInArea.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ENDPOINTINAREA (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The OSPF area.") :KEY)
                :INITFORM "CIM_OSPFArea")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The OSPF endpoint in the area.") :KEY)
                :INITFORM "CIM_OSPFProtocolEndpointBase"))
              (:CIM-NAME "CIM_EndpointInArea")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Network::OSPF")
               (:DESCRIPTION
                "This relation connects an OSPF endpoint to an area.")))