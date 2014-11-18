
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RequireCredentialsFrom.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_REQUIRECREDENTIALSFROM (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_AuthenticationCondition"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "CredentialManagementService from which credentials are accepted for the associated AuthenticationRequirement.")
                 :KEY)
                :INITFORM "CIM_CredentialManagementService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_AuthenticationRule"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "AuthenticationRequirement that limits acceptable credentials.")
                 :KEY)
                :INITFORM "CIM_AuthenticationRequirement"))
              (:CIM-NAME "CIM_RequireCredentialsFrom")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED
                ("CIM_AuthenticationCondition" "CIM_AuthenticationRule"))
               (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::AuthenticationReqmt")
               (:DESCRIPTION
                "CIM_RequireCredentialsFrom is an association used to require that credentials are issued by particular CredentialManagement Services in order to authenticate a user. This association is deprecated in lieu of explicit declaration of the AuthenticationConditions in an AuthenticationRule. Instances of AuthenticationCondition describe the specific combinations of credentials (or alternative credentials) that are required to authenticate an Identity. This allows a more explicit and flexible description of authentication requirements.")))