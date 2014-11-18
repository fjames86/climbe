
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BGPClustersInAS.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BGPCLUSTERSINAS NIL
              ((GROUPAS NIL :CIM-NAME "GroupAS" :QUALIFIERS
                (:KEY :AGGREGATE (:MAX "1")
                 (:DESCRIPTION
                  "The AutonomousSystem that aggregates the Clusters belonging to it and administers them."))
                :INITFORM "CIM_AutonomousSystem")
               (PARTAS NIL :CIM-NAME "PartAS" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "The Clusters that are contained in the AS."))
                :INITFORM "CIM_BGPCluster"))
              (:CIM-NAME "CIM_BGPClustersInAS")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "This aggregation establishes 'whole-part' relationships between an AutonomousSystem and the BGPClusters that it contains.")))