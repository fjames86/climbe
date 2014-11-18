
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AdapterActiveConnection.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ADAPTERACTIVECONNECTION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_PortActiveConnection.Antecedent"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The PhysicalConnector.")
                 :KEY)
                :INITFORM "CIM_PhysicalConnector")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_PortActiveConnection.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The NetworkAdapter that transmits using the Connector.")
                 :KEY)
                :INITFORM "CIM_NetworkAdapter"))
              (:CIM-NAME "CIM_AdapterActiveConnection")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_PortActiveConnection")) (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::NetworkAdapter")
               (:DESCRIPTION
                "Note: The use of the CIM_AdapterActiveConnection class has been deprecated, because NetworkAdapter is deprecated. Instead use the CIM_PortActiveConnection class. 
Deprecated description: The AdapterActiveConnection relationship indicates that a NetworkAdapter is using the referenced PhysicalConnector to output to the network. This relationship is important when the Adapter can choose to output from one of several Connectors. The Connectors can be associated with the NetworkAdapter in a Realizes relationship but this is not required. This association provides additional information (such as, 'in use for communication') different from Realizes.")))