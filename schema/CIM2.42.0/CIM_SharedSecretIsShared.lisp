
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SharedSecretIsShared.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SHAREDSECRETISSHARED (CIM_MANAGEDCREDENTIAL)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ServiceAffectsElement.AffectingElement"))
                 (:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The credential management service.") :KEY)
                :INITFORM "CIM_SharedSecretService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ServiceAffectsElement.AffectedElement"))
                 (:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION "The managed credential.") :KEY)
                :INITFORM "CIM_SharedSecret"))
              (:CIM-NAME "CIM_SharedSecretIsShared")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ServiceAffectsElement")) (:VERSION "2.16.0")
               (:UML-PACKAGE-PATH "CIM::User::SharedSecret")
               (:DESCRIPTION
                "This relationship associates a SharedSecretService with the SecretKey it verifies.")))