
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AuthorizedTarget.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_AUTHORIZEDTARGET NIL
              ((PRIVILEGE NIL :CIM-NAME "Privilege" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The AuthorizedPrivilege affecting the target resource."))
                :INITFORM "CIM_AuthorizedPrivilege")
               (TARGETELEMENT NIL :CIM-NAME "TargetElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The target set of resources to which the AuthorizedPrivilege applies."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_AuthorizedTarget")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::Privilege")
               (:DESCRIPTION
                "CIM_AuthorizedTarget is an association used to tie an Identity's or Role's AuthorizedPrivileges to specific target resources.")))