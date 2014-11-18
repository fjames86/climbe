
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ManagesAccount.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MANAGESACCOUNT (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The account management service.") :KEY)
                :INITFORM "CIM_AccountManagementService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "An account managed by the service.") :KEY)
                :INITFORM "CIM_Account"))
              (:CIM-NAME "CIM_ManagesAccount")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::User::Account")
               (:DESCRIPTION
                "This relationship associates the AccountManagement security service to the Accounts for which it is responsible.")))