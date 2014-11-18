
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IdentityContext.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_IDENTITYCONTEXT NIL
              ((ELEMENTINCONTEXT NIL :CIM-NAME "ElementInContext" :QUALIFIERS
                (:KEY (:DESCRIPTION "An Identity whose context is defined."))
                :INITFORM "CIM_Identity")
               (ELEMENTPROVIDINGCONTEXT NIL :CIM-NAME "ElementProvidingContext"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The ManagedElement that provides context or scope for the Identity."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_IdentityContext")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::Identity")
               (:DESCRIPTION
                "This relationship defines a context (e.g., a System or Service) of an Identity. Note that the cardinalities of this association are many to many, indicating that the Identity MAY be scoped by several elements. However, it is likely that there will only be a single scope, if one exists at all.")))