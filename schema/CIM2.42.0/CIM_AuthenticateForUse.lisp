
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AuthenticateForUse.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_AUTHENTICATEFORUSE (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Antecedent")
                 (:DESCRIPTION "AuthenticationRequirementfor use.") :KEY)
                :INITFORM "CIM_AuthenticationRequirement")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "AuthenticationServicethat uses the requirements.")
                 :KEY)
                :INITFORM "CIM_AuthenticationService"))
              (:CIM-NAME "CIM_AuthenticateForUse")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value"))
               (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::AuthenticationReqmt")
               (:DESCRIPTION
                "CIM_AuthenticateForUse is an association used to provide an AuthenticationService with the AuthenticationRequirement it needs to do its job. This association is unnecessary and therefore deprecated, since it is implied that an Identity MUST be authenticated (its CurrentlyAuthenticatedBoolean set to TRUE) in order to have any Privileges.")))