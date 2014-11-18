
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AuthorizationTarget.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_AUTHORIZATIONTARGET (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_AuthorizedTarget.Privilege"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "AccessControlInformation that applies to the target set.")
                 :KEY)
                :INITFORM "CIM_AccessControlInformation")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_AuthorizedTarget.TargetElement"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The target set of resources may be specified as a collection or as a set of associations to ManagedElements that represent target resources.")
                 :KEY)
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_AuthorizationTarget")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_AuthorizedTarget"))
               (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::AccessControl")
               (:DESCRIPTION
                "CIM_AuthorizationTarget is an association used to apply authorization decisions to specific target resources. The target resources may be aggregated into a collection or may be represented as a set of associations to ManagedElements. This association is deprecated in lieu of a semantically equivalent one, AuthorizedTarget, since one of the referenced classes (AccessControlInformation) has been deprecated.")))