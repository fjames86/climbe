
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PortActiveConnection.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PORTACTIVECONNECTION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The PhysicalConnector.") :KEY)
                :INITFORM "CIM_PhysicalConnector")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The NetworkPort that transmits using the Connector.")
                 :KEY)
                :INITFORM "CIM_NetworkPort"))
              (:CIM-NAME "CIM_PortActiveConnection")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::Ports")
               (:DESCRIPTION
                "The PortActiveConnection relationship indicates that a NetworkPort is using the referenced PhysicalConnector to output to the network. This relationship is important when the port can choose to output from one of several connectors. The connectors can be associated with the NetworkPort in a Realizes relationship, but this is not required. This association provides additional information (for instance,'in use for communication') different than Realizes.")))