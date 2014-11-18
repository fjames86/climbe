
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_EndpointIdentity.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ENDPOINTIDENTITY (CIM_LOGICALIDENTITY)
              ((SYSTEMELEMENT NIL :CIM-NAME "SystemElement" :QUALIFIERS
                ((:OVERRIDE "SystemElement")
                 (:DESCRIPTION
                  "SystemElement represents one aspect of the Endpoint.")
                 :KEY)
                :INITFORM "CIM_ProtocolEndpoint")
               (SAMEELEMENT NIL :CIM-NAME "SameElement" :QUALIFIERS
                ((:OVERRIDE "SameElement")
                 (:DESCRIPTION
                  "SameElement represents an alternate aspect of the Endpoint.")
                 :KEY)
                :INITFORM "CIM_ProtocolEndpoint"))
              (:CIM-NAME "CIM_EndpointIdentity")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::ProtocolEndpoints")
               (:DESCRIPTION
                "CIM_EndpointIdentity indicates that two ProtocolEndpoints represent different aspects of the same underlying address or protocol-specific ID. This association refines the CIM_LogicalIdentity superclass by restricting it to the Endpoint level and defining its use in well understood scenarios. One of these scenarios is to represent that an Endpoint has both 'LAN' and protocol-specific aspects. For example, an Endpoint could be both a LANEndpoint as well as a DHCPEndpoint.")))