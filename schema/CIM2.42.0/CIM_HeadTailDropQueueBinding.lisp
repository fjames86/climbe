
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HeadTailDropQueueBinding.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HEADTAILDROPQUEUEBINDING (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1")
                 (:DESCRIPTION
                  "A QueuingService examined by the CalculationService.")
                 :KEY)
                :INITFORM "CIM_QueuingService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The CalculationService that provides an average queue depth.")
                 :KEY)
                :INITFORM "CIM_HeadTailDropper"))
              (:CIM-NAME "CIM_HeadTailDropQueueBinding")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "This association describes the relationship between a head or tail dropper and the queue that it monitors to determine when to drop traffic. The referenced queue's depth is compared against the Dropper's threshold property. Although the dropper drops from only one queue, the drop decision may be influenced by the state of several queues. The rule for combining the multiple inputs is simple addition: if the sum of the lengths of the monitored queues exceeds the dropper's QueueThreshold value, then packets are dropped. Note that this rule for combining inputs may be overridden.")))