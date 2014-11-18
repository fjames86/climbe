
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AuthorizationSubject.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_AUTHORIZATIONSUBJECT (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_AuthorizedSubject.Privilege"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "AccessControlInformation that applies to a subject set.")
                 :KEY)
                :INITFORM "CIM_AccessControlInformation")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_AuthorizedSubject.PrivilegedElement"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The subject set may be specified as a collection or as a set of associations to ManagedElements that represent users.")
                 :KEY)
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_AuthorizationSubject")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_AuthorizedSubject"))
               (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::AccessControl")
               (:DESCRIPTION
                "CIM_AuthorizationSubject is an association used to apply authorization decisions to specific subjects (i.e., users). This association is deprecated in lieu of a semantically equivalent one, AuthorizedSubject, since one of the referenced classes (AccessControlInformation) has been deprecated.")))