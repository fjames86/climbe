
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_UsersAccount.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_USERSACCOUNT (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_AccountIdentity.SystemElement"))
                 (:OVERRIDE "Antecedent") (:DESCRIPTION "The user's Account.")
                 :KEY)
                :INITFORM "CIM_Account")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_AccountIdentity.SameElement"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The User as identified by their UsersAccess instance.")
                 :KEY)
                :INITFORM "CIM_UsersAccess"))
              (:CIM-NAME "CIM_UsersAccount")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_AccountIdentity"))
               (:VERSION "2.8.0") (:UML-PACKAGE-PATH "CIM::User::Account")
               (:DESCRIPTION
                "This relationship associates UsersAccess with the Accounts with which they're able to interact. This association is deprecated in lieu of AccountIdentity, which defines similar semantics. This was done since the UsersAccess reference in UsersAccount has been deprecated and replaced by the more specific semantics of CIM_Identity.")))