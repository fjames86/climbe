
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FilterListsInBGPRouteMap.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FILTERLISTSINBGPROUTEMAP (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The FilterList used by a RouteMap.") :KEY)
                :INITFORM "CIM_FilterList")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The RouteMap using the FilterList.") :KEY)
                :INITFORM "CIM_BGPRouteMap"))
              (:CIM-NAME "CIM_FilterListsInBGPRouteMap")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::BGP")
               (:DESCRIPTION
                "RouteMaps do not have to use FilterLists, but if they do, this association defines which FilterList is used by a particular RouteMap.")))