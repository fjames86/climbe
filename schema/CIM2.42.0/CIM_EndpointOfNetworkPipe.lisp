
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_EndpointOfNetworkPipe.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ENDPOINTOFNETWORKPIPE (CIM_DEPENDENCY)
              ((SOURCEORSINK UINT16 :CIM-NAME "SourceOrSink" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates whether the endpoint is a source (value = 2), or sink (value = 3) for the pipe. If this information is not applicable, the property is set to 4. If the information is not known, the property is set to 0.")
                 (:VALUE-MAP ("0" "2" "3" "4"))
                 (:VALUES ("Unknown" "Source" "Sink" "Not Applicable")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "2") (:MAX "2")
                 (:DESCRIPTION "One of the endpoints of the pipe.") :KEY)
                :INITFORM "CIM_ProtocolEndpoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The pipe which is dependent on the endpoints as the source or sink of the transferred information.")
                 :KEY)
                :INITFORM "CIM_NetworkPipe"))
              (:CIM-NAME "CIM_EndpointOfNetworkPipe")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::Pipes")
               (:DESCRIPTION
                "EndpointOfNetworkPipe describes the endpoints between which a pipe transfers information. Whether an endpoint is a source or sink is indicated by a property of the association, SourceOrSink.")
               (:MAPPING-STRINGS
                ("Recommendation.ITU|M3100.Pipe.a-TPInstance"
                 "Recommendation.ITU|M3100.Pipe.z-TPInstance"))))