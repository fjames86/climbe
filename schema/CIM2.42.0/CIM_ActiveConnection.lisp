
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ActiveConnection.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ACTIVECONNECTION (CIM_SAPSAPDEPENDENCY)
              ((TRAFFICTYPE UINT16 :CIM-NAME "TrafficType" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated because it is incorrectly placed on the association. Unicast, broadcast, or other traffic types are not a function of the connection between the referenced endpoints, but rather are a function of the addressing, protocol and basic functionality of the endpoints. 
Deprecated description: The type of traffic that is carried over this connection.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "Other" "Unicast" "Broadcast" "Multicast"
                   "Anycast"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ActiveConnection.OtherTrafficDescription")))
                :INITFORM NIL)
               (OTHERTRAFFICDESCRIPTION STRING :CIM-NAME
                "OtherTrafficDescription" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated because it is incorrectly placed on the association. Unicast, broadcast, or other traffic types are not a function of the connection between the referenced endpoints, but rather are a function of the addressing, protocol and basic functionality of the endpoints. 
Deprecated description: A string that describes the type of traffic that is being carried over this instance when its Type property is set, for example, to 1 (Other).")
                 (:MAX-LEN "64")
                 (:MODEL-CORRESPONDENCE ("CIM_ActiveConnection.TrafficType")))
                :INITFORM NIL)
               (ISUNIDIRECTIONAL BOOLEAN :CIM-NAME "IsUnidirectional"
                :QUALIFIERS
                ((:DESCRIPTION
                  "TRUE means that this connection is unidirectional; FALSE means that this connection is bidirectional. When the connection is unidirectional, the \"speaker\" should be defined as the Antecedent reference. In a bidirectional connection, the selection of which AccessPoint is the Antecedent or Dependent is immaterial."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "A ServiceAccessPoint that is configured to communicate or is actively communicating with the Dependent SAP. In a unidirectional connection, this SAP is the one that is transmitting.")
                 :KEY)
                :INITFORM "CIM_ServiceAccessPoint")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "A second ServiceAccessPoint that is configured to communicate or is actively communicating with the Antecedent SAP. In a unidirectional connection, this SAP is the one that is receiving the communication.")
                 :KEY)
                :INITFORM "CIM_ServiceAccessPoint"))
              (:CIM-NAME "CIM_ActiveConnection")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Service")
               (:DESCRIPTION
                "This association defines a connection that is currently communicating, or is configured to communicate, between two ServiceAccessPoints. It is used when the connection is not treated as a ManagedElement itself (that is, with Status, statistics, and so on), but its existence is known. The SAPs that are connected are typically at the same networking or application layer.")))