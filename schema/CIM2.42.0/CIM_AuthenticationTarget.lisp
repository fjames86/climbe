
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AuthenticationTarget.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_AUTHENTICATIONTARGET (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_PolicySetAppliesToElement.PolicySet"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "AuthenticationRequirement that applies to specific resources.")
                 :KEY)
                :INITFORM "CIM_AuthenticationRequirement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_PolicySetAppliesToElement.ManagedElement"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "Target resources that may be in a Collection or an individual ManagedElement. These resources are protected by the AuthenticationRequirement.")
                 :KEY)
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_AuthenticationTarget")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_PolicySetAppliesToElement"))
               (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::AuthenticationReqmt")
               (:DESCRIPTION
                "CIM_AuthenticationTarget is an association used to apply authentication requirements for access to specific resources. For example, a shared secret may be sufficient for access to unclassified resources, but for confidential resources, a stronger authentication may be required. Since the AuthenticationRequirement class is deprecated in lieu of explicit policy rules, this association is similarly deprecated to its 'policy' equivalent.")))