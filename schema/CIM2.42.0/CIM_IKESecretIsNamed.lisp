
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_IKESecretIsNamed.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_IKESECRETISNAMED (CIM_MANAGEDCREDENTIAL)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ServiceAffectsElement.AffectingElement"))
                 (:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The SharedSecretService that manages a NamedSharedIKESecret.")
                 :KEY)
                :INITFORM "CIM_SharedSecretService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ServiceAffectsElement.AffectedElement"))
                 (:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION "The managed NamedSharedIKESecret.") :KEY)
                :INITFORM "CIM_NamedSharedIKESecret"))
              (:CIM-NAME "CIM_IKESecretIsNamed")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ServiceAffectsElement")) (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::User::SharedSecret")
               (:DESCRIPTION
                "CIM_IKESecretIsNamed association provides the relationship between a SharedSecretService and a NamedSharedIKESecret.")))