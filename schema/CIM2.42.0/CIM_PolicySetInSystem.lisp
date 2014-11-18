
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PolicySetInSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_POLICYSETINSYSTEM (CIM_POLICYINSYSTEM)
              ((PRIORITY UINT16 :CIM-NAME "Priority" :QUALIFIERS
                ((:DESCRIPTION
                  "The Priority property is used to specify the relative priority of the referenced PolicySet when there are more than one PolicySet instances applied to a managed resource that are not PolicySetComponents and, therefore, have no other relative priority defined. The priority is a non-negative integer; a larger value indicates a higher priority."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The System in whose scope a PolicySet is defined.")
                 :KEY)
                :INITFORM "CIM_System")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "A PolicySet named within the scope of a System.")
                 :KEY)
                :INITFORM "CIM_PolicySet"))
              (:CIM-NAME "CIM_PolicySetInSystem")
              (:QUALIFIERS :ASSOCIATION :ABSTRACT (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "PolicySetInSystem is an abstract association class that represents a relationship between a System and a PolicySet used in the administrative scope of that system (e.g., AdminDomain, ComputerSystem). The Priority property is used to assign a relative priority to a PolicySet within the administrative scope in contexts where it is not a component of another PolicySet.")))