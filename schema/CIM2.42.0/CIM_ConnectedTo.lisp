
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ConnectedTo.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CONNECTEDTO (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The Antecedent represents a PhysicalConnector that serves as one end of the connection.")
                 :KEY)
                :INITFORM "CIM_PhysicalConnector")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The Dependent represents another PhysicalConnector that serves as the other end of the connection.")
                 :KEY)
                :INITFORM "CIM_PhysicalConnector"))
              (:CIM-NAME "CIM_ConnectedTo")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Connector")
               (:DESCRIPTION
                "The ConnectedTo association indicates that two or more PhysicalConnectors are connected together.")))