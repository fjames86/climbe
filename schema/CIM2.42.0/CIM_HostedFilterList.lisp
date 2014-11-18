
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedFilterList.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDFILTERLIST (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The ComputerSystem/network device that scopes the FilterList.")
                 :KEY)
                :INITFORM "CIM_ComputerSystem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION "The FilterList on the System.") :KEY)
                :INITFORM "CIM_FilterList"))
              (:CIM-NAME "CIM_HostedFilterList")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::Filtering")
               (:DESCRIPTION
                "FilterLists are defined in the context of a ComputerSystem/ network device, where the list is used and administered.")))