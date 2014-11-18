
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RoleLimitedToTarget.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ROLELIMITEDTOTARGET NIL
              ((DEFININGROLE NIL :CIM-NAME "DefiningRole" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The Role whose target set is explicitly defined."))
                :INITFORM "CIM_Role")
               (TARGETELEMENT NIL :CIM-NAME "TargetElement" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "Reference to the target set that can be accessed from the Role."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_RoleLimitedToTarget")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.20.0")
               (:UML-PACKAGE-PATH "CIM::User::Role")
               (:DESCRIPTION
                "The Role object class is used to represent a position or set of responsibilities within an organization, organizational unit or other scope. When explicitly restricting the target elements that may be accessed from this Role, this association MUST be used.")))