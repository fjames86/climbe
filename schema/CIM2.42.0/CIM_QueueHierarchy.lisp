
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_QueueHierarchy.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_QUEUEHIERARCHY (CIM_SERVICESERVICEDEPENDENCY)
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
                ((:DEPRECATED ("No value")) (:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The supporting queue(s) and its QueuingService. This Service can only support at most one, higher level QueuingService.")
                 :KEY)
                :INITFORM "CIM_QueuingService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION
                  "The QueuingService dependent on other, supporting Queuing Services.")
                 :KEY)
                :INITFORM "CIM_QueuingService"))
              (:CIM-NAME "CIM_QueueHierarchy")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value"))
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "Describes the reliance of a QueuingService on other, supporting queues and their QueuingServices. A given Service can only act in support of one QueuingService; but a higher level queue may be supported by many lower level QueuingServices. 

The class is deprecated since a queue only stores network traffic. It does not support other queues, or manipulate their entries. This type of processing is described using NextService associations 'rightwards' from the QueuingService. These associations reference 'other' ConditioningServices that may send traffic to 'other' queues).")))