
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RelatedSpanningTree.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_RELATEDSPANNINGTREE (CIM_SERVICESERVICEDEPENDENCY)
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
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The TransparentBridgingService that supports a SpanningTreeService.")
                 :KEY)
                :INITFORM "CIM_TransparentBridgingService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION
                  "The SpanningTree in which a TransparentBridgingService is nested.")
                 :KEY)
                :INITFORM "CIM_SpanningTreeService"))
              (:CIM-NAME "CIM_RelatedSpanningTree")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::SwitchingBridging")
               (:DESCRIPTION
                "This association identifies the spanning tree in which a forwarding database (TransparentBridgingService) is nested.")))