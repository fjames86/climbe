
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CredentialContext.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CREDENTIALCONTEXT NIL
              ((USAGE UINT16 :CIM-NAME "Usage" :QUALIFIERS
                ((:DESCRIPTION
                  "The usage of the certificate by the managed element that the certificate is for or is scoped to. Owned - Credential represents the CredentialContexts identity. This means that the managed element will present this credential to another party for authentication, authorization, or both. Trusted - The ManagedElement trusts the credential. This means that the credential is trusted for one or more of the security operations such as authentication, third-party authentication, and authorization. Trusted for Authentication - The ManagedElement trusts the identity represented by the credential only for authentication purposes. Trusted for Authorization - The ManagedElement trusts the identity represented by the credential only for authorization purposes. Trusted for Authentication/Authorization - The ManagedElement trusts the identity represented by the credential both for authentication and authorization purposes. Trusted for Third-Party Authentication/Authorization - The credential is being trusted for approving a third-party credential to the ManagedElement.")
                 (:VALUE-MAP ("2" "3" "4" "6" "7" "8" ".." "32768..65535"))
                 (:VALUES
                  ("Owned" "Trusted" "Trusted for Authentication"
                   "Trusted for Authorization"
                   "Trusted for Authentication/Authorization"
                   "Trusted for Third-Party Authentication/Authorization"
                   "DMTF Reserved" "Vendor Reserved")))
                :INITFORM NIL)
               (ELEMENTINCONTEXT NIL :CIM-NAME "ElementInContext" :QUALIFIERS
                (:KEY (:DESCRIPTION "A Credential whose context is defined."))
                :INITFORM "CIM_Credential")
               (ELEMENTPROVIDINGCONTEXT NIL :CIM-NAME "ElementProvidingContext"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The ManagedElement that provides context or scope for the Credential."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_CredentialContext")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.27.0")
               (:UML-PACKAGE-PATH "CIM::User::Credential")
               (:DESCRIPTION
                "This relationship defines a context (e.g., a System or Service) of a Credential. One example is a shared secret/ password which is defined within the context of an application (or Service). Generally, there is one scoping element for a Credential, however the multiplicities of the association allow a Credential to be scoped by more than one element. If this association is not instantiated for a Credential, that Credential is assumed to be scoped to the Namespace.
This association may also be used to indicate that a Credential is valid in some other environment. For instance associating the Credential to a RemoteServiceAccessPoint would indicate that the Credential is used to access the remote service.")))