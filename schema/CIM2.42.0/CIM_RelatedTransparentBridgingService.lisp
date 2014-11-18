
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RelatedTransparentBridgingService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_RELATEDTRANSPARENTBRIDGINGSERVICE (CIM_SERVICESAPDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The VLAN.") :KEY)
                :INITFORM "CIM_VLAN")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The BridgingService that determines the port, given the the VLAN and addressing information.")
                 :KEY)
                :INITFORM "CIM_TransparentBridgingService"))
              (:CIM-NAME "CIM_RelatedTransparentBridgingService")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value"))
               (:VERSION "2.8.0") (:UML-PACKAGE-PATH "CIM::Network::VLAN")
               (:DESCRIPTION
                "This class is deprecated as a fall out of the previous deprecations within the existing model The association between a VLAN and the forwarding database (some use the term filtering database) used to determine which port a packet should be transmitted on, given that it is assigned to the VLAN and that it has a particular destination MAC address. The TransparentBridgingService represents a forwarding database.")))