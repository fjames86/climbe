
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_NextService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_NEXTSERVICE NIL
              ((PRECEDINGSERVICE NIL :CIM-NAME "PrecedingService" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The preceding ConditioningService, 'earlier' in the processing sequence for a packet."))
                :INITFORM "CIM_ConditioningService")
               (FOLLOWINGSERVICE NIL :CIM-NAME "FollowingService" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "The 'next' or following ConditioningService."))
                :INITFORM "CIM_ConditioningService"))
              (:CIM-NAME "CIM_NextService")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "NextService establishes a predecessor-successor relationship between two ConditioningService objects. This association is used to indicate the sequence of ConditioningServices required to process a particular type of traffic. 

Instances describe the various relationships between different ConditioningServices (such as classifiers, meters, droppers, etc.) that are used collectively to condition traffic. Both one-to-one and more complicated fan-in and/or fan-out relationships can be described. The Conditioning Services may feed one another directly, or they may be mapped to multiple 'next' Services based on the characteristics of the packet.")))