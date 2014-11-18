
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_EndpointInLink.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ENDPOINTINLINK (CIM_MEMBEROFCOLLECTION)
              ((COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Collection") (:MAX "1")
                 (:DESCRIPTION "The OSPF link.") :KEY)
                :INITFORM "CIM_OSPFLink")
               (MEMBER NIL :CIM-NAME "Member" :QUALIFIERS
                       ((:OVERRIDE "Member")
                        (:DESCRIPTION "The OSPF protocol endpoint.") :KEY)
                       :INITFORM "CIM_OSPFProtocolEndpointBase"))
              (:CIM-NAME "CIM_EndpointInLink")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::OSPF")
               (:DESCRIPTION
                "This association connects an OSPFLink to the OSPFProtocol Endpoints that this link aggregates.")))