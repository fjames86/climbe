
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_QoSConditioningSubService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_QOSCONDITIONINGSUBSERVICE (CIM_SERVICECOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "This aggregation identifies the set of ConditioningServices that together condition traffic for a particular QoSService.")
                 :KEY)
                :INITFORM "CIM_QoSService")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The ConditioningService.") :KEY)
                :INITFORM "CIM_ConditioningService"))
              (:CIM-NAME "CIM_QoSConditioningSubService")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "A QoSService utilizes underlying ConditioningServices as part of its overall functionality. This is modeled using the QoSConditioningSubService association. Note that a ConditioningService may only be part of a single QoSService - the cardinality on the QoSService reference is Max (1).")))