
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RoutersInBGPCluster.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ROUTERSINBGPCLUSTER (CIM_COLLECTEDMSES)
              ((COLLECTION NIL :CIM-NAME "Collection" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "Collection") (:MAX "1")
                 (:DESCRIPTION
                  "The Cluster that aggregates the routers participating in it.")
                 :KEY)
                :INITFORM "CIM_BGPCluster")
               (MEMBER NIL :CIM-NAME "Member" :QUALIFIERS
                       ((:OVERRIDE "Member") (:MIN "3")
                        (:DESCRIPTION "The routers that form the Cluster.")
                        :KEY)
                       :INITFORM "CIM_ComputerSystem"))
              (:CIM-NAME "CIM_RoutersInBGPCluster")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "This aggregation establishes the routers (ComputerSystems) in a BGPCluster. At least three routers are required to form a cluster - a reflector and two clients. The routers that form a cluster share common configuration information.")))