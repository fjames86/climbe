
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ManagedCredential.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MANAGEDCREDENTIAL (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ServiceAffectsElement.AffectingElement"))
                 (:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The credential management service.") :KEY)
                :INITFORM "CIM_CredentialManagementService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ServiceAffectsElement.AffectedElement"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION "The managed credential.") :KEY)
                :INITFORM "CIM_Credential"))
              (:CIM-NAME "CIM_ManagedCredential")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ServiceAffectsElement")) (:VERSION "2.16.0")
               (:UML-PACKAGE-PATH "CIM::User::Credential")
               (:DESCRIPTION
                "This relationship associates a CredentialManagementService with the Credential it manages.")))