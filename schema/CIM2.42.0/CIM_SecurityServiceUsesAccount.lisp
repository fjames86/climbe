
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SecurityServiceUsesAccount.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SECURITYSERVICEUSESACCOUNT (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "Account used by the SecurityService.") :KEY)
                :INITFORM "CIM_Account")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The Service using the Account.") :KEY)
                :INITFORM "CIM_SecurityService"))
              (:CIM-NAME "CIM_SecurityServiceUsesAccount")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::User::Account")
               (:DESCRIPTION
                "This relationship associates SecurityService instances to the Accounts they use in the course of their work.")))