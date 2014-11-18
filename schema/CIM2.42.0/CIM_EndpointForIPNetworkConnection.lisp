
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_EndpointForIPNetworkConnection.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ENDPOINTFORIPNETWORKCONNECTION (CIM_SAPSAPDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                (:KEY (:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The Protocol Endpoint for the network connection."))
                :INITFORM "CIM_ProtocolEndpoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                (:KEY (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The instance representing the IP network connection."))
                :INITFORM "CIM_IPNetworkConnection"))
              (:CIM-NAME "CIM_EndpointForIPNetworkConnection")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.32.0")
               (:UML-PACKAGE-PATH "CIM::Network::IP")
               (:DESCRIPTION
                "CIM_EndpointForIPNetworkConnection associates the instance of CIM_IPNetworkConnection with the communication endpoint ( Eg \"CIM_LANEndpoint\". )")))