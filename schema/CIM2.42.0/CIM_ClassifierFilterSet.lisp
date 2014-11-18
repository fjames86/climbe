
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ClassifierFilterSet.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CLASSIFIERFILTERSET (CIM_DEPENDENCY)
              ((FILTERLISTPOSITION UINT16 :CIM-NAME "FilterListPosition"
                :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_ClassifierElementInClassifierService.ClassifierOrder"))
                 (:DESCRIPTION
                  "The ordering of the FilterLists used in the classification and forwarding functions of the ClassifierService."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_ClassifierElementUsesFilterList.Antecedent"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The FilterList aggregating FilterEntries, these in turn describe how traffic is identified and processed by the ClassifierService.")
                 :KEY)
                :INITFORM "CIM_FilterList")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_ClassifierElementUsesFilterList.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The ClassifierService which uses the FilterList and its aggregated FilterEntries.")
                 :KEY)
                :INITFORM "CIM_ClassifierService"))
              (:CIM-NAME "CIM_ClassifierFilterSet")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED
                ("CIM_ClassifierElementUsesFilterList"
                 "CIM_ClassifierElementInClassifierService"))
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "In order for a ClassifierService to correctly identify and process network traffic, that traffic must be described by FilterEntries, which are aggregated into FilterLists. This association defines the Dependency of the ClassifierService on FilterLists (and therefore, their FilterEntries). The cardinality of the association requires that the Classifier Service operate against at least one FilterList. 

The association is deprecated in lieu of associating Filter Lists to ClassifierElements, and ClassifierElements into ClassifierServices. The latter approach is very flexible regarding the implementations that can be modeled, and removes the need to track individual traffic streams using an artificial model property, TrafficClass. Using ClassifierElements, each stream is processed beginning with a single FilterList and progressing through various ConditioningServices, associated via instances of NextService.")))