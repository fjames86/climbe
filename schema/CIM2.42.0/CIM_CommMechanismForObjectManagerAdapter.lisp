
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CommMechanismForObjectManagerAdapter.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COMMMECHANISMFOROBJECTMANAGERADAPTER (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The specific ObjectManagerAdapter whose communication mechanism with the CIM Object Manager is described.")
                 :KEY)
                :INITFORM "CIM_ObjectManagerAdapter")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1")
                 (:DESCRIPTION
                  "The encoding/protocol/set of operations that may be used to communicate between the Object Manager and the referenced ProtocolAdapter.")
                 :KEY)
                :INITFORM "CIM_ObjectManagerCommunicationMechanism"))
              (:CIM-NAME "CIM_CommMechanismForObjectManagerAdapter")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED
                ("CIM_ProtocolService" "CIM_WBEMProtocolServiceCapabilities"))
               (:VERSION "2.39.0") (:UML-PACKAGE-PATH "CIM::Interop")
               (:DESCRIPTION
                "CommMechanismForObjectManagerAdapter is deprecated. See CIM_WBEMServer, CIM_ProtocolService and CIM_WBEMProtocolServiceCapabilties for describing WBEM Protocols

CommMechanismForObjectManagerAdapter is an association between an ObjectManager's communication mechanism and a ObjectManagerAdapter that supports that mechanism to translate requests and responses for the Object Manager.")))