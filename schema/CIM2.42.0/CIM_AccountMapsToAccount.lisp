
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AccountMapsToAccount.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ACCOUNTMAPSTOACCOUNT (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "An Account.") :KEY)
                :INITFORM "CIM_Account")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:DESCRIPTION "A related Account.")
                 :KEY)
                :INITFORM "CIM_Account"))
              (:CIM-NAME "CIM_AccountMapsToAccount")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::User::Account")
               (:DESCRIPTION
                "This relationship may be used to associate an Account used by an AuthenticationService to an Account used for Authorization. For instance, this mapping occurs naturally in the UNIX /etc/passwd file, where the AuthenticationService Account ('root') is mapped to the AuthorizationService Account ('0'). The two are separate accounts, as evidenced by the ability to have another AuthenticationService Account which ALSO maps to the AuthorizationService Account ('0') without ambiguity. This association may be used for other account mappings as well such as for coordinating single signon for multiple accounts for the same user.")))