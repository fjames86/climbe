
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_NextServiceAfterClassifierElement.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_NEXTSERVICEAFTERCLASSIFIERELEMENT (CIM_NEXTSERVICE)
              ((PRECEDINGSERVICE NIL :CIM-NAME "PrecedingService" :QUALIFIERS
                ((:OVERRIDE "PrecedingService")
                 (:DESCRIPTION
                  "The ClassifierElement that selects traffic to be passed to the FollowingService.")
                 :KEY)
                :INITFORM "CIM_ClassifierElement")
               (FOLLOWINGSERVICE NIL :CIM-NAME "FollowingService" :QUALIFIERS
                ((:OVERRIDE "FollowingService") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The ConditioningService that follows the ClassifierElement.")
                 :KEY)
                :INITFORM "CIM_ConditioningService"))
              (:CIM-NAME "CIM_NextServiceAfterClassifierElement")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "An association used to establish a predecessor-successor relationship between a single ClassifierElement (within a ClassifierService) and the next ConditioningService object that further processes the selected traffic. Note that the cardinalities indicate that a FollowingService MUST be defined, after the ClassifierElement. This is because there is no reason to classify traffic unless further processing will be done.")))