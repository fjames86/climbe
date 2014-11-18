
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicyGroupInSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYGROUPINSYSTEM (CIM_POLICYSETINSYSTEM)
              ((PRIORITY UINT16 :CIM-NAME "Priority" :QUALIFIERS
                ((:DESCRIPTION
                  "The Priority property is used to specify the relative priority of the referenced PolicySet when there are more than one PolicySet instances applied to a managed resource that are not PolicySetComponents and, therefore, have no other relative priority defined. The priority is a non-negative integer; a larger value indicates a higher priority."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The System in whose scope a PolicyGroup is defined.")
                 :KEY)
                :INITFORM "CIM_System")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION
                  "A PolicyGroup named within the scope of a System.")
                 :KEY)
                :INITFORM "CIM_PolicyGroup"))
              (:CIM-NAME "CIM_PolicyGroupInSystem")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "An association that links a PolicyGroup to the System in whose scope the Group is defined.")))