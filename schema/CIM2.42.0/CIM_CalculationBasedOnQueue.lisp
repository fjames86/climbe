
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CalculationBasedOnQueue.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CALCULATIONBASEDONQUEUE (CIM_SERVICESERVICEDEPENDENCY)
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
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The queue examined by the CalculationService.")
                 :KEY)
                :INITFORM "CIM_QueuingService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The CalculationService that provides an average queue depth.")
                 :KEY)
                :INITFORM "CIM_DropThresholdCalculationService"))
              (:CIM-NAME "CIM_CalculationBasedOnQueue")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "This association establishes a dependency relationship between a QueuingService and an instance of the DropThresholdCalculationService class. The queue's current depth is used by the CalculationService in calculating an average/smoothed queue depth.")))