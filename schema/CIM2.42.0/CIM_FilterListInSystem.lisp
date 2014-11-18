
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FilterListInSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FILTERLISTINSYSTEM (CIM_SYSTEMCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_HostedFilterList.Antecedent")) :AGGREGATE
                 (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION
                  "The ComputerSystem/network device that scopes the FilterList and administers it.")
                 :KEY)
                :INITFORM "CIM_ComputerSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_HostedFilterList.Dependent"))
                 (:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The FilterList on the System.") :KEY)
                :INITFORM "CIM_FilterList"))
              (:CIM-NAME "CIM_FilterListInSystem")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_HostedFilterList"))
               (NIL "true") (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::Filtering")
               (:DESCRIPTION
                "FilterLists are defined in the context of a ComputerSystem (e.g., a router, firewall or host). Note that this class is deprecated since its subclassing is not correct. It subclasses from SystemComponent, but a FilterList is NOT a Component of a System. Instead, it is hosted/scoped by the System. In versions up to CIM 2.6, FilterListInSystem was a mandatory, Weak relationship. This is no longer true, beginning with CIM V2.7.")))