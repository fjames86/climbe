
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_LinkHasConnector.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LINKHASCONNECTOR (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION "The PhysicalLink that has a Connector.") :KEY)
                :INITFORM "CIM_PhysicalLink")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "The PhysicalConnector.") :KEY)
                :INITFORM "CIM_PhysicalConnector"))
              (:CIM-NAME "CIM_LinkHasConnector")
              (:QUALIFIERS :ASSOCIATION (NIL "true") (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Link")
               (:DESCRIPTION
                "Cables and Links utilize PhysicalConnectors to actually 'connect' PhysicalElements. This association explicitly defines this relationship of Connectors for PhysicalLinks.")))