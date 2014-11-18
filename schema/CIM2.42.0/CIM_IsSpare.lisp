
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IsSpare.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ISSPARE (CIM_DEPENDENCY)
              ((SPARESTATUS UINT16 :CIM-NAME "SpareStatus" :QUALIFIERS
                ((:DESCRIPTION "Indicates the state of the 'spare'. 
- Hot Standby. The element is available 'immediately' to become a functioning member of the set. Such an element is powered on and has been initialized for it's role as a spare. 
- Cold Standby. The element is not available to join the set without action to prepare it.")
                 (:VALUE-MAP ("0" "2" "3"))
                 (:VALUES ("Unknown" "Hot Standby" "Cold Standby")))
                :INITFORM NIL)
               (FAILOVERSUPPORTED UINT16 :CIM-NAME "FailoverSupported"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates whether or not the failover to the spare is a manual or automatic action.")
                 (:VALUE-MAP ("0" "2" "3" "4"))
                 (:VALUES
                  ("Unknown" "Automatic" "Manual"
                   "Both Manual and Automatic")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "A ManagedElement or Collection of elements acting as a spare.")
                 :KEY)
                :INITFORM "CIM_ManagedElement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The set of elements that ARE spared.") :KEY)
                :INITFORM "CIM_RedundancySet"))
              (:CIM-NAME "CIM_IsSpare")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Redundancy")
               (:DESCRIPTION
                "The IsSpare association indicates an element that can spare or replace any of the elements in the referenced RedundancySet. If the 'spare' is itself a Collection, this indicates that each of the 'spare' members can replace any of the elements in the RedundancySet. In the case of a collection all of the values in the properties of this association MUST apply to all members of the Collection. 
If this is not true, then the Collection SHOULD be broken down into smaller sets (and the IsSpare association defined for each of these smaller sets), such that the properties of this association apply to all collected members.")))