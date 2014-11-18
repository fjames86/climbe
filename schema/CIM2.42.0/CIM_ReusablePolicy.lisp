
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ReusablePolicy.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_REUSABLEPOLICY (CIM_POLICYINSYSTEM)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "This property identifies a ReusablePolicyContainer that provides the administrative scope for the reuse of the referenced policy element.")
                 :KEY)
                :INITFORM "CIM_ReusablePolicyContainer")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "A reusable policy element.") :KEY)
                :INITFORM "CIM_Policy"))
              (:CIM-NAME "CIM_ReusablePolicy")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "The ReusablePolicy association provides for the reuse of any subclass of Policy in a ReusablePolicyContainer.")))