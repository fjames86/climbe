
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_TrustHierarchy.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_TRUSTHIERARCHY (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "The superior CredentialManagementService from which the dependent service gets its authority.")
                 :KEY)
                :INITFORM "CIM_CredentialManagementService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The subordinate CredentialManagementService.")
                 :KEY)
                :INITFORM "CIM_CredentialManagementService"))
              (:CIM-NAME "CIM_TrustHierarchy")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::User::SecurityServices")
               (:DESCRIPTION
                "CIM_TrustHierarchy is an association between two CredentialManagementService instances that establishes the trust hierarchy between them.")))