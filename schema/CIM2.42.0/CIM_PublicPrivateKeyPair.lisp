
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PublicPrivateKeyPair.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PUBLICPRIVATEKEYPAIR (CIM_USERSCREDENTIAL)
              ((USE UINT16 :CIM-NAME "Use" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "The Certificate may be used for signature only or for confidentiality as well as signature.")
                 (:VALUE-MAP ("0" "1"))
                 (:VALUES ("SignOnly" "ConfidentialityOrSignature")))
                :INITFORM NIL)
               (NONREPUDIATION BOOLEAN :CIM-NAME "NonRepudiation" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Indicates if the certificate canNOT be repudiated."))
                :INITFORM NIL)
               (BACKEDUP BOOLEAN :CIM-NAME "BackedUp" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Indicates if the certificate can be backed up."))
                :INITFORM NIL)
               (REPOSITORY STRING :CIM-NAME "Repository" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "The repository in which the certificate is backed up."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_AuthenticationCondition"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The public key certificate.") :KEY)
                :INITFORM "CIM_PublicKeyCertificate")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_Identity")) (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The Principal holding the private key (that corresponds to the public key.")
                 :KEY)
                :INITFORM "CIM_UsersAccess"))
              (:CIM-NAME "CIM_PublicPrivateKeyPair")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_AuthenticationCondition")) (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::User::UsersAccess")
               (:DESCRIPTION
                "This relationship associates a PublicKeyCertificate with the Principal who has the PrivateKey used with the PublicKey. The PrivateKey is not modeled, since it is not a data element that ever SHOULD be accessible via management applications, other than key recovery services, which are outside our scope. 

Since the UsersAccess class and this association's superclass are deprecated, this association is also deprecated. There is no need to have a special subclass for public-private credentials. This is especially true since the properties of the association describe aspects of the certificate and its handling. The latter is currently out of scope for the model.")))