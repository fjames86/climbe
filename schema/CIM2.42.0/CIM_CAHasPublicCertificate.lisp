
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CAHasPublicCertificate.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CAHASPUBLICCERTIFICATE (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The Certificate used by the CA.") :KEY)
                :INITFORM "CIM_PublicKeyCertificate")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The CA that uses a Certificate.") :KEY)
                :INITFORM "CIM_CertificateAuthority"))
              (:CIM-NAME "CIM_CAHasPublicCertificate")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::PublicKey")
               (:DESCRIPTION
                "A CertificateAuthority may have certificates issued by other CAs or self-signed. This association is essentially an optimization of the CA having an external identity established by itself or another Authority. This maps closely to LDAP-based certificate authority implementations.")))