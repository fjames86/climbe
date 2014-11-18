
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_HostedAuthenticationRequirement.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_HOSTEDAUTHENTICATIONREQUIREMENT (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_PolicyRuleInSystem.Antecedent"))
                 (:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The hosting system.") :KEY)
                :INITFORM "CIM_System")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_PolicyRuleInSystem.Dependent"))
                 (:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION "The hosted AuthenticationRequirement.") :KEY)
                :INITFORM "CIM_AuthenticationRequirement"))
              (:CIM-NAME "CIM_HostedAuthenticationRequirement")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_PolicyRuleInSystem")) (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::AuthenticationReqmt")
               (:DESCRIPTION
                "CIM_HostedAuthenticationRequirement is an association used to provide the namespace scoping of AuthenticationRequirement. The hosted requirements may or may not apply to resources on the hosting system. Since the AuthenticationRequirement class is deprecated in lieu of explicit policy rules, this class is similarly deprecated to its 'policy' equivalent.")))