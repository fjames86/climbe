
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Docked.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DOCKED (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The Docking Station.") :KEY)
                :INITFORM "CIM_Chassis")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "The Laptop that is 'Docked'.") :KEY)
                :INITFORM "CIM_Chassis"))
              (:CIM-NAME "CIM_Docked")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Package")
               (:DESCRIPTION
                "A laptop, a type of Chassis, may be docked in another type of Chassis, a Docking Station. This is the relationship represented by the Docked association. Because this is such a typical relationship, it is explicitly described.")
               (:MAPPING-STRINGS ("MIF.DMTF|Dynamic States|001.2"))))