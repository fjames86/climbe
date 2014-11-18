
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OutboundVLAN.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_OUTBOUNDVLAN (CIM_SAPSAPDEPENDENCY)
              ((TAGGED BOOLEAN :CIM-NAME "Tagged" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "If Tagged is TRUE, then the packet will be transmitted in encapsulated form, tagged with the associated VLAN tag. If Tagged is FALSE, the packet will be trasmitted without any VLAN tag."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The VLAN to which the SwitchPort is assigned.")
                 :KEY)
                :INITFORM "CIM_VLAN")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Dependent")
                 (:DESCRIPTION "The SwitchPort on the VLAN.") :KEY)
                :INITFORM "CIM_SwitchPort"))
              (:CIM-NAME "CIM_OutboundVLAN")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value"))
               (:VERSION "2.8.0") (:UML-PACKAGE-PATH "CIM::Network::VLAN")
               (:DESCRIPTION
                "This class is deprecated in lieu or not being necessary to indicate whether the VLAN is inbound/outbound This association makes explicit the operational dependencies of a SwitchPort when operating in a VLAN. If there is no instance of OutboundVLAN between a given SwitchPort and VLAN, then any packet that has been assigned to the VLAN and whose destination address is associated with the port will be dropped by the switch without being transmitted. Otherwise, the packet will be transmitted.")))