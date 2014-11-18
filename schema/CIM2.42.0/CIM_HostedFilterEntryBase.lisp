
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedFilterEntryBase.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDFILTERENTRYBASE (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The ComputerSystem/network device that scopes the FilterEntryBase.")
                 :KEY)
                :INITFORM "CIM_ComputerSystem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION "The FilterEntryBase on the System.") :KEY)
                :INITFORM "CIM_FilterEntryBase"))
              (:CIM-NAME "CIM_HostedFilterEntryBase")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::Filtering")
               (:DESCRIPTION
                "All filter entries (FilterEntryBase and its subclasses) are defined in the context of a ComputerSystem/network device, where the filter entries are used and administered.")))