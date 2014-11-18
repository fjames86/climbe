
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CommMechanismForManager.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COMMMECHANISMFORMANAGER (CIM_SERVICEACCESSBYSAP)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION
                  "The specific ObjectManager whose communication mechanism is described.")
                 :KEY)
                :INITFORM "CIM_ObjectManager")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1")
                 (:DESCRIPTION
                  "The encoding/protocol/set of operations that may be used to communicate with the referenced ObjectManager.")
                 :KEY)
                :INITFORM "CIM_ObjectManagerCommunicationMechanism"))
              (:CIM-NAME "CIM_CommMechanismForManager")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value"))
               (:VERSION "2.39.0") (:UML-PACKAGE-PATH "CIM::Interop")
               (:DESCRIPTION
                "CommMechanismForManager is deprecated. See CIM_WBEMServer, CIM_ProtocolService and CIM_WBEMProtocolServiceCapabilties for describing WBEM Protocols.
CommMechanismForManager is an association between an ObjectManager and an ObjectManagerCommunicationMechanism class. The latter describes a possible encoding/protocol/ set of operations for accessing the referenced ObjectManager.")))