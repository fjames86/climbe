
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ElementInSchedulingService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ELEMENTINSCHEDULINGSERVICE (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION
                  "The scheduler aggregating the SchedulingElement. A SchedulingElement can be associated with at most one SchedulingService.")
                 :KEY)
                :INITFORM "CIM_PacketSchedulingService")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent") (:MIN "1")
                 (:DESCRIPTION
                  "A SchedulingElement that ties either a queue or another scheduler to the referenced PacketSchedulingService. Every PacketSchedulingService MUST have at least one Scheduling Element/input.")
                 :KEY)
                :INITFORM "CIM_SchedulingElement"))
              (:CIM-NAME "CIM_ElementInSchedulingService")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "This association represents the relationship between a PacketSchedulingService and the set of SchedulingElements that tie it to its inputs (either QueuingServices or other PacketSchedulingServices).")))