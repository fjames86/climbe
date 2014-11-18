
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_NextScheduler.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_NEXTSCHEDULER (CIM_NEXTSERVICE)
              ((PRECEDINGSERVICE NIL :CIM-NAME "PrecedingService" :QUALIFIERS
                ((:OVERRIDE "PrecedingService")
                 (:DESCRIPTION
                  "The PacketSchedulingService whose output is treated as a single, aggregated input by the FollowingService scheduler. The [0..n] cardinality indicates that a single FollowingService scheduler may bring together the aggregated outputs of multiple prior schedulers.")
                 :KEY)
                :INITFORM "CIM_PacketSchedulingService")
               (FOLLOWINGSERVICE NIL :CIM-NAME "FollowingService" :QUALIFIERS
                ((:OVERRIDE "FollowingService") (:MAX "1")
                 (:DESCRIPTION
                  "A scheduler that includes among its inputs the aggregated outputs of one or more PrecedingService schedulers.")
                 :KEY)
                :INITFORM "CIM_PacketSchedulingService"))
              (:CIM-NAME "CIM_NextScheduler")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "This association is a subclass of NextService, and defines a predecessor-successor relationship between Packet SchedulingServices. In a hierarchical queuing configuration (where a second scheduler treats the output of a first scheduler as a single, aggregated input), the two schedulers are related via the NextScheduler association.")))