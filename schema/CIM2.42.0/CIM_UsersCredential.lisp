
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_UsersCredential.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_USERSCREDENTIAL (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_AuthenticationCondition"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The issued credential that may be used.") :KEY)
                :INITFORM "CIM_Credential")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_Identity")) (:OVERRIDE "Dependent")
                 (:DESCRIPTION "The UsersAccess that has use of a credential.")
                 :KEY)
                :INITFORM "CIM_UsersAccess"))
              (:CIM-NAME "CIM_UsersCredential")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_AuthenticationCondition")) (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::UsersAccess")
               (:DESCRIPTION
                "CIM_UsersCredential is an association used to establish the credentials that may be used for a UsersAccess to a system or set of systems. 

Since the UsersAccess class is deprecated in lieu of CIM_Identity, this association is also deprecated and replaced by policy - where the AuthenticationCondition class describes the credentials that SHOULD be authenticated in order to establish the Identity.")))