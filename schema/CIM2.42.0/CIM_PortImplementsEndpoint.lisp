
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PortImplementsEndpoint.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PORTIMPLEMENTSENDPOINT (CIM_DEVICESAPIMPLEMENTATION)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The LogicalPort that represents the Device behind the ProtocolEndpoint.")
                 :KEY)
                :INITFORM "CIM_LogicalPort")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The ProtocolEndpoint that is implemented on the LogicalPort.")
                 :KEY)
                :INITFORM "CIM_ProtocolEndpoint"))
              (:CIM-NAME "CIM_PortImplementsEndpoint")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::Ports")
               (:DESCRIPTION
                "PortImplementsEndpoint associates a LogicalPort with one or more ProtocolEndpoints that are implemented on it. This class specializes the DeviceSAPImplementation association. It indicates that the referenced Endpoint is dependent on the operations of the Port Device.")))