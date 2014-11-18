
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedNetworkPipe.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDNETWORKPIPE (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The hosting network.") :KEY)
                :INITFORM "CIM_Network")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The pipe in the network.") :KEY)
                :INITFORM "CIM_NetworkPipe"))
              (:CIM-NAME "CIM_HostedNetworkPipe")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::Pipes")
               (:DESCRIPTION
                "HostedNetworkPipe is an association between a pipe and the network in whose context the pipe is defined. The cardinality of this association is 1-to-many. A network may host many pipes, and pipes are scoped/contained by only one network.")))