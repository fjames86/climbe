
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CommMechanismForAdapter.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COMMMECHANISMFORADAPTER (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_CommMechanismForObjectManagerAdapter.Antecedent"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The specific ProtocolAdapter whose communication mechanism with the CIM Object Manager is described.")
                 :KEY)
                :INITFORM "CIM_ProtocolAdapter")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_CommMechanismForObjectManagerAdapter.Dependent"))
                 (:OVERRIDE "Dependent") (:MIN "1")
                 (:DESCRIPTION
                  "The encoding/protocol/set of operations that may be used to communicate between the Object Manager and the referenced ProtocolAdapter.")
                 :KEY)
                :INITFORM "CIM_ObjectManagerCommunicationMechanism"))
              (:CIM-NAME "CIM_CommMechanismForAdapter")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_CommMechanismForObjectManagerAdapter"))
               (:VERSION "2.8.0") (:UML-PACKAGE-PATH "CIM::Interop")
               (:DESCRIPTION
                "CommMechanismForAdapter is an association between an ObjectManager's communication mechanism and a ProtocolAdapter that supports that mechanism to translate requests and responses for the Object Manager.")))