
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CASignsPublicKeyCertificate.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CASIGNSPUBLICKEYCERTIFICATE (CIM_MANAGEDCREDENTIAL)
              ((SERIALNUMBER STRING :CIM-NAME "SerialNumber" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION "The Serial Number."))
                :INITFORM NIL)
               (EXPIRES DATETIME :CIM-NAME "Expires" :QUALIFIERS
                ((:DEPRECATED ("CIM_Credential.Expires"))
                 (:DESCRIPTION "The time it expires."))
                :INITFORM NIL)
               (SIGNATURE (ARRAY UINT8) :CIM-NAME "Signature" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:DESCRIPTION "The Signature.")
                 :OCTET-STRING)
                :INITFORM NIL)
               (CRLDISTRIBUTIONPOINT (ARRAY STRING) :CIM-NAME
                "CRLDistributionPoint" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "The Authority's revocation list distribution points."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ServiceAffectsElement.AffectingElement"))
                 (:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The CA which signed the certificate.") :KEY)
                :INITFORM "CIM_CertificateAuthority")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ServiceAffectsElement.AffectedElement"))
                 (:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION "The certificate issued by the CA.") :KEY)
                :INITFORM "CIM_PublicKeyCertificate"))
              (:CIM-NAME "CIM_CASignsPublicKeyCertificate")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ServiceAffectsElement")) (:VERSION "2.16.0")
               (:UML-PACKAGE-PATH "CIM::User::PublicKey")
               (:DESCRIPTION
                "This relationship associates a CertificateAuthority with the certificates it signs.")))