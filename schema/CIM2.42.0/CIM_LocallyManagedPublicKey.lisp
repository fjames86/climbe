
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_LocallyManagedPublicKey.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LOCALLYMANAGEDPUBLICKEY (CIM_MANAGEDCREDENTIAL)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ServiceAffectsElement.AffectingElement"))
                 (:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The PublicKeyManagementService that manages an unsigned public key.")
                 :KEY)
                :INITFORM "CIM_PublicKeyManagementService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ServiceAffectsElement.AffectedElement"))
                 (:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION "An unsigned public key.") :KEY)
                :INITFORM "CIM_UnsignedPublicKey"))
              (:CIM-NAME "CIM_LocallyManagedPublicKey")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ServiceAffectsElement")) (:VERSION "2.16.0")
               (:UML-PACKAGE-PATH "CIM::User::PublicKey")
               (:DESCRIPTION
                "CIM_LocallyManagedPublicKey association provides the relationship between a PublicKeyManagementService and an UnsignedPublicKey.")))