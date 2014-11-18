
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ClassifierElementUsesFilterList.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CLASSIFIERELEMENTUSESFILTERLIST (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "The FilterList that specifies the traffic criteria for a ClassifierElement.")
                 :KEY)
                :INITFORM "CIM_FilterList")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The ClassifierElement that depends on the FilterList for its traffic criteria.")
                 :KEY)
                :INITFORM "CIM_ClassifierElement"))
              (:CIM-NAME "CIM_ClassifierElementUsesFilterList")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "This association relates one or more ClassifierElements with a FilterList that defines the criteria to select packets for the classifier to process. Note that a classifier is always modeled as a ClassifierService that aggregates a set of ClassifierElements. Each of these ClassifierElements is EITHER associated with a single FilterList OR associated to another ClassifierService (via NextServiceAfterClassifier Element to describe hierarchical classification).")))