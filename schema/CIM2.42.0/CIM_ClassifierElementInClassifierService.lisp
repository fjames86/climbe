
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ClassifierElementInClassifierService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CLASSIFIERELEMENTINCLASSIFIERSERVICE (CIM_SERVICECOMPONENT)
              ((CLASSIFIERORDER UINT32 :CIM-NAME "ClassifierOrder" :QUALIFIERS
                ((:DESCRIPTION
                  "Because the filters for a classifier can overlap, it is necessary to specify the order in which the ClassifierElements are aggregated by a ClassifierService. This then dictates the order in which packets coming into the classifier are presented. Values are represented in ascending order: first '1', then '2', and so on. Different values MUST be assigned for each of the ClassifierElements aggregated by a given ClassifierService."))
                :INITFORM NIL)
               (GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The ClassifierService which aggregates ClassifierElements.")
                 :KEY)
                :INITFORM "CIM_ClassifierService")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The aggregated ClassifierElement, defined in the context of one ClassifierService.")
                 :KEY)
                :INITFORM "CIM_ClassifierElement"))
              (:CIM-NAME "CIM_ClassifierElementInClassifierService")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "This aggregation represents the relationship between a ClassifierService and the ClassifierElements that provide its fan-out function. ClassifierElements represent the traffic selectors for the Service. A ClassifierService typically aggregates multiple ClassifierElements. An individual Element, however, is aggregated only by a single ClassifierService.")))