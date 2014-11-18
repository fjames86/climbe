
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_NotaryVerifiesBiometric.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_NOTARYVERIFIESBIOMETRIC (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ManagedCredential.Antecedent"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The Notary service that verifies biometric information.")
                 :KEY)
                :INITFORM "CIM_Notary")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ManagedCredential.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The UsersAccess that represents a person using biometric information for authentication.")
                 :KEY)
                :INITFORM "CIM_UsersAccess"))
              (:CIM-NAME "CIM_NotaryVerifiesBiometric")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_ManagedCredential"))
               (:VERSION "2.8.0") (:UML-PACKAGE-PATH "CIM::User::UsersAccess")
               (:DESCRIPTION
                "This relationship associates a Notary service with the Users Access whose biometric information is verified. It is deprecated since one of its references (UsersAccess) is deprecated, and because specific biometric credentials are defined in a new subclass of CIM_Credential (specifically, BiometricCredential). Given the latter, the relationship of a Credential to its management service (ManagedCredential) can be used directly.")))