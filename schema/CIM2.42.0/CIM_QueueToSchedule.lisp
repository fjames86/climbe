
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_QueueToSchedule.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_QUEUETOSCHEDULE NIL
              ((QUEUE NIL :CIM-NAME "Queue" :QUALIFIERS
                (:KEY (:MAX "1")
                 (:DESCRIPTION
                  "The queue and its QueuingService from which packets are emptied."))
                :INITFORM "CIM_QueuingService")
               (SCHEDELEMENT NIL :CIM-NAME "SchedElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "The SchedulingElement for the input queue."))
                :INITFORM "CIM_SchedulingElement"))
              (:CIM-NAME "CIM_QueueToSchedule")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "This is a top-level association, representing the relationship between a queue (QueuingService) and a SchedulingElement. The SchedulingElement, in turn, represents the information in a packet scheduling service that is specific to this queue, such as relative priority or allocated bandwidth. 

Although it cannot be expressed formally with the association cardinalities, there is an additional constraint on participation in this association. A particular instance of (a subclass of) SchedulingElement always participates either in exactly one instance of this association, or in exactly one instance of the association SchedulingServiceToSchedule.")))