
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AcceptCredentialFrom.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ACCEPTCREDENTIALFROM (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The CredentialManagementService that is issuing the credential to be matched in the PacketFilterCondition.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|AcceptCredentialFrom.Antecedent"))
                 :KEY)
                :INITFORM "CIM_CredentialManagementService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The PacketFilterCondition that associates the CredentialManagementService and any FilterLists/FilterEntries.")
                 (:MAPPING-STRINGS
                  ("IPSP Policy Model.IETF|AcceptCredentialFrom.Dependent"))
                 :KEY)
                :INITFORM "CIM_PacketFilterCondition"))
              (:CIM-NAME "CIM_AcceptCredentialFrom")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Policy")
               (:DESCRIPTION
                "This association specifies that a credential management service (e.g., CertificateAuthority or Kerberos key distribution service) is to be trusted to certify credentials, presented at the packet level. The association defines an 'approved' CredentialManagementService that is used for validation. 

The use of this class is best explained via an example: 
If a CertificateAuthority is specified using this association, and a corresponding X509CredentialFilterEntry is also associated with a PacketFilterCondition (via the relationship, FilterOfPacketCondition), then the credential MUST match the FilterEntry data AND be certified by that CA (or one of the CredentialManagementServices in its trust hierarchy). Otherwise, the X509CredentialFilterEntry is deemed not to match. If a credential is certified by a CredentialManagementService associated with the PacketFilterCondition through the AcceptCredentialFrom relationship, but there is no corresponding CredentialFilterEntry, then all credentials from the related service are considered to match.")
               (:MAPPING-STRINGS
                ("IPSP Policy Model.IETF|AcceptCredentialFrom"))))