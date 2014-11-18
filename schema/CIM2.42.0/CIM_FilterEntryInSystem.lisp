
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FilterEntryInSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FILTERENTRYINSYSTEM (CIM_SYSTEMCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_HostedFilterEntryBase.Antecedent"))
                 :AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION
                  "The ComputerSystem/network device that scopes the FilterEntryBase.")
                 :KEY)
                :INITFORM "CIM_ComputerSystem")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:DEPRECATED ("CIM_HostedFilterEntryBase.Dependent"))
                 (:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The FilterEntryBase on the System.") :KEY)
                :INITFORM "CIM_FilterEntryBase"))
              (:CIM-NAME "CIM_FilterEntryInSystem")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_HostedFilterEntryBase")) (NIL "true")
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Network::Filtering")
               (:DESCRIPTION
                "All filter entries (FilterEntryBase and its subclasses) are defined in the context of a ComputerSystem/network device, where they are used to identify and act on network traffic. Note that this class is deprecated since its subclassing is not correct. It subclasses from System Component, but a FilterEntryBase is NOT a Component of a System. Instead, it is hosted/scoped by the System. In versions up to CIM 2.6, FilterEntryInSystem was a mandatory, Weak relationship. This is no longer true, beginning with CIM V2.7.")))