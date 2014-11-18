
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RuleThatGeneratedSA.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_RULETHATGENERATEDSA (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "0") (:MAX "1")
                 (:DESCRIPTION "SARule that led to the Security Association.")
                 :KEY)
                :INITFORM "CIM_SARule")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "SecurityAssociationEndpoint created using the rule.")
                 :KEY)
                :INITFORM "CIM_SecurityAssociationEndpoint"))
              (:CIM-NAME "CIM_RuleThatGeneratedSA")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::IPsecPolicy")
               (:DESCRIPTION
                "RuleThatGeneratedSA associates a SecurityAssociationEndpoint with the SARule used to generate (or negotiate) it.")))