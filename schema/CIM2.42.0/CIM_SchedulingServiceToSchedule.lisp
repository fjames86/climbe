
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SchedulingServiceToSchedule.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SCHEDULINGSERVICETOSCHEDULE NIL
              ((SCHEDSERVICE NIL :CIM-NAME "SchedService" :QUALIFIERS
                (:KEY (:MAX "1")
                 (:DESCRIPTION "The scheduler being cascaded."))
                :INITFORM "CIM_PacketSchedulingService")
               (SCHEDELEMENT NIL :CIM-NAME "SchedElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "A SchedulingElement in the subsequent scheduler."))
                :INITFORM "CIM_SchedulingElement"))
              (:CIM-NAME "CIM_SchedulingServiceToSchedule")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "This is a top-level association, representing the relationship between a scheduler (PacketSchedulingService) and a SchedulingElement, in a configuration involving cascaded schedulers. The SchedulingElement, in turn, represents the information in a packet scheduling service that is specific to this scheduler, such as relative priority or allocated bandwidth. 

Although it cannot be expressed formally with the association cardinalities, there is an additional constraint on participation in this association. A particular instance of (a subclass of) SchedulingElement always participates either in exactly one instance of this association, or in exactly one instance of the association QueueToSchedule.")))