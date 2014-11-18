
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssignedIdentity.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSIGNEDIDENTITY NIL
              ((IDENTITYINFO NIL :CIM-NAME "IdentityInfo" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "An Identity of the referenced ManagedElement."))
                :INITFORM "CIM_Identity")
               (MANAGEDELEMENT NIL :CIM-NAME "ManagedElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The ManagedElement assigned to or representing a specific Identity."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_AssignedIdentity")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.14.0")
               (:UML-PACKAGE-PATH "CIM::User::Identity")
               (:DESCRIPTION
                "This relationship associates an Identity to a specific ManagedElement, whose trust and account information is represented.")))