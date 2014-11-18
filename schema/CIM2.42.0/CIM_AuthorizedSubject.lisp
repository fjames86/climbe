
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AuthorizedSubject.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_AUTHORIZEDSUBJECT NIL
              ((PRIVILEGE NIL :CIM-NAME "Privilege" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The AuthorizedPrivilege either granted or denied to an Identity, Role or Collection. Whether the privilege is granted or denied is defined by the inherited property, CIM_Privilege.PrivilegeGranted."))
                :INITFORM "CIM_AuthorizedPrivilege")
               (PRIVILEGEDELEMENT NIL :CIM-NAME "PrivilegedElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The Subject for which AuthorizedPrivileges are granted or denied. Whether the privilege is granted or denied is defined by the property, CIM_Privilege.PrivilegeGranted."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_AuthorizedSubject")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::Privilege")
               (:DESCRIPTION
                "CIM_AuthorizedSubject is an association used to tie specific AuthorizedPrivileges to specific subjects (i.e., Identities, Roles or Collections of these). At this time, only Identities and Roles (or Collections of Identities and Roles) should be associated to AuthorizedPrivileges using this relationship. Note that any Privileges not explicitly granted to a subject, SHOULD be denied.")))