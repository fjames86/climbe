
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ElementInConnector.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ELEMENTINCONNECTOR (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The Connector into which the Element is inserted.")
                 :KEY)
                :INITFORM "CIM_PhysicalConnector")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "The Element in the Connector.") :KEY)
                :INITFORM "CIM_PhysicalElement"))
              (:CIM-NAME "CIM_ElementInConnector")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.18.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Connector")
               (:DESCRIPTION
                "Adapter cards, DIMMs and other physical elements are plugged into System Connectors for power and/or to transfer data. This relationship is defined by ElementInConnector.")))