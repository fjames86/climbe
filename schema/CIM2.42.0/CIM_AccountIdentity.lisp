
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AccountIdentity.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ACCOUNTIDENTITY (CIM_LOGICALIDENTITY)
              ((SYSTEMELEMENT NIL :CIM-NAME "SystemElement" :QUALIFIERS
                ((:DEPRECATED ("CIM_ConcreteIdentity.SystemElement"))
                 (:OVERRIDE "SystemElement")
                 (:DESCRIPTION "The Account that establishes Identity.") :KEY)
                :INITFORM "CIM_Account")
               (SAMEELEMENT NIL :CIM-NAME "SameElement" :QUALIFIERS
                ((:DEPRECATED ("CIM_ConcreteIdentity.SameElement"))
                 (:OVERRIDE "SameElement")
                 (:DESCRIPTION "The Identity established by the Account.")
                 :KEY)
                :INITFORM "CIM_Identity"))
              (:CIM-NAME "CIM_AccountIdentity")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_ConcreteIdentity"))
               (:VERSION "2.8.0") (:UML-PACKAGE-PATH "CIM::User::Account")
               (:DESCRIPTION
                "CIM_AccountIdentity relates a system Account with the Identity that is established. Since Account also carries Identity semantics, the LogicalIdentity association is defined as the superclass of this association. This association does not add any constraints or semantics to ConcreteIdentity. As a result, it is deprecated.")))