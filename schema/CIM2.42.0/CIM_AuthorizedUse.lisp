
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AuthorizedUse.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_AUTHORIZEDUSE (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Antecedent")
                 (:DESCRIPTION "Access Control Information.") :KEY)
                :INITFORM "CIM_AccessControlInformation")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Dependent")
                 (:DESCRIPTION "AuthorizationService that uses an ACI.") :KEY)
                :INITFORM "CIM_AuthorizationService"))
              (:CIM-NAME "CIM_AuthorizedUse")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value"))
               (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::AccessControl")
               (:DESCRIPTION
                "CIM_AuthorizedUse is an association used to provide an AuthorizationService with the AccessControlInformation it needs to do its job. This association is deprecated with no proposed replacement, since authorization processing will be handled via policy or static checking of Privileges.")))