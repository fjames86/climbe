
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ElementSecuritySensitivity.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ELEMENTSECURITYSENSITIVITY NIL
              ((SECURITYLEVEL NIL :CIM-NAME "SecurityLevel" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The security sensitivity level of the element."))
                :INITFORM "CIM_SecuritySensitivity")
               (MANAGEDELEMENT NIL :CIM-NAME "ManagedElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The element which is assigned a sensitivity level."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_ElementSecuritySensitivity")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.14.0")
               (:UML-PACKAGE-PATH "CIM::User::SecurityLevel")
               (:DESCRIPTION
                "This association labels an element with a security sensitivity.
This association is not used to indicate clearance of a security principal, see IdentitySecurityClearance.")))