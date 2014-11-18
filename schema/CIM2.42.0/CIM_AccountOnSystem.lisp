
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AccountOnSystem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ACCOUNTONSYSTEM (CIM_SYSTEMCOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The aggregating system also provides name scoping for the Account.")
                 :KEY)
                :INITFORM "CIM_System")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent") :WEAK
                 (:DESCRIPTION "The subordinate Account.") :KEY)
                :INITFORM "CIM_Account"))
              (:CIM-NAME "CIM_AccountOnSystem")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::User::Account")
               (:DESCRIPTION
                "A system (e.g., ApplicationSystem, ComputerSystem, AdminDomain) aggregates Accounts and scopes the uniqueness of the Account names (i.e., userids).")))