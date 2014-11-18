
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FailNextScheduler.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FAILNEXTSCHEDULER (CIM_NEXTSCHEDULER)
              ((PRECEDINGSERVICE NIL :CIM-NAME "PrecedingService" :QUALIFIERS
                ((:OVERRIDE "PrecedingService")
                 (:DESCRIPTION
                  "The NonWorkConservingSchedulingService whose excess bandwidth is made available to the scheduler identified by the FollowingService reference. The [0..n] cardinality indicates that a single FollowingService scheduler may have the opportunity to use the unused bandwidth of multiple prior non-work-conserving schedulers.")
                 :KEY)
                :INITFORM "CIM_NonWorkConservingSchedulingService")
               (FOLLOWINGSERVICE NIL :CIM-NAME "FollowingService" :QUALIFIERS
                ((:OVERRIDE "FollowingService") (:MAX "1")
                 (:DESCRIPTION
                  "A scheduler that may use the bandwidth available from the non-work conserving scheduler.")
                 :KEY)
                :INITFORM "CIM_PacketSchedulingService"))
              (:CIM-NAME "CIM_FailNextScheduler")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "This association is a subclass of NextScheduler, and defines a predecessor-successor relationship between a NonWork ConservingSchedulingService and another PacketScheduling Service. It indicates that the NonWorkConserving scheduler may pass up a scheduling opportunity (thereby behaving in a non-work conserving manner), and make the resulting bandwidth available to the FollowingService scheduler.")))