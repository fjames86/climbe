
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SchedulerUsed.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SCHEDULERUSED (CIM_SERVICESERVICEDEPENDENCY)
              ((TYPEOFDEPENDENCY UINT16 :CIM-NAME "TypeOfDependency"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The nature of the Service-to-Service dependency. 2 - Antecedent Service shall have completed before Dependent service's functionality is available.
3 - Antecedent Service shall have started before Dependent service's functionality is available.
4 - Antecedent Service shall not be started in order for Dependent service's functionality to be available.
5 - The two Services cooperate and augment each other's function. There is no requirement implied by this value regarding the execution of the Antecedent service in order for the Dependent service to operate.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "Other" "Service Must Have Completed"
                   "Service Must Be Started" "Service Must Not Be Started"
                   "Cooperate")))
                :INITFORM NIL)
               (RESTARTSERVICE BOOLEAN :CIM-NAME "RestartService" :QUALIFIERS
                ((:DESCRIPTION
                  "This property describes that the Antecedent Service must be restarted after the Dependent operation is complete."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_QueueToSchedule.Queue"))
                 (:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "The PacketSchedulingService which empties the Queuing Service's queue.")
                 :KEY)
                :INITFORM "CIM_PacketSchedulingService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_QueueToSchedule.SchedElement"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The queue and its QueuingService from which packets are emptied.")
                 :KEY)
                :INITFORM "CIM_QueuingService"))
              (:CIM-NAME "CIM_SchedulerUsed")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED
                ("CIM_QueueToSchedule" "CIM_SchedulingServiceToSchedule"))
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "In order to remove queued packets, a process or Service (identified as a PacketSchedulingService) runs. This association describes the Dependency of the queue and its QueuingService on a SchedulingService, which empties it. 

The association is deprecated in lieu of associating Queuing Services to SchedulingElements, and SchedulingElements into SchedulingServices. The latter approach is very flexible regarding the implementations that can be modeled, and removes the need to track individual traffic streams using an artificial model property, TrafficClass.")))