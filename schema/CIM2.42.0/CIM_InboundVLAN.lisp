
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_InboundVLAN.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_INBOUNDVLAN (CIM_SAPSAPDEPENDENCY)
              ((TAGGED BOOLEAN :CIM-NAME "Tagged" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "If TRUE, packets already tagged with this VLAN number will be accepted when arriving at this port. For example, if there is an InboundVLAN association between port 12 and VLAN 7 for which Tagged is true, then when a packet tagged with VLAN 7 arrives at port 12, the packet will be accepted into the switch for further processing. If there is no such association, then the packet will be dropped. 

If FALSE, it means that any untagged packets arriving at this port MIGHT be classified into the associated VLAN. If, for a particular SwitchPort, there is only one instance of the association for which Tagged is FALSE, then all incoming untagged packets will be classified into that VLAN. This is the typical configuration of a non-trunk port in a switch implementing port-based VLANs. If there is more than one such association instance, then the packet MIGHT be classified into any one of them, based on some criterion other than the identity of the switch port. For example, in a MAC-based VLAN switch, the decision would be based on the source MAC address. In a protocol-based VLAN switch, the decision would be based on the values of some set of bits in the packet. 

Note that the MAC address is formatted as twelve hexadecimal digits (e.g., \"010203040506\"), with each pair representing one of the six octets of the MAC address in \"canonical\" bit order according to RFC 2469."))
                :INITFORM NIL)
               (DEFAULT BOOLEAN :CIM-NAME "Default" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Default should be TRUE if untagged packets received by the SwitchPort are assigned to the VLAN. For 802.1Q-compliant ports, the Default property should be TRUE on the association instance connecting a SwitchPort to the VLAN corresponding to the port's PVID. Default MUST never be TRUE if Tagged is true -- it applies only to untagged packets."))
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
              (:CIM-NAME "CIM_InboundVLAN")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value"))
               (:VERSION "2.8.0") (:UML-PACKAGE-PATH "CIM::Network::VLAN")
               (:DESCRIPTION
                "This class is deprecated in lieu or not being necessary to indicate whether the VLAN is inbound/outbound This association makes explicit the operational dependencies of a SwitchPort when operating in a VLAN. If there is an association between a particular SwitchPort and a particular VLAN, then there is the possibility that a packet received by the port will be assigned to the VLAN (or if the packet already has a VLAN tag, that the packet will not be dropped). If there is no such association, then there is NO possibility that a packet received by the port will progress through the switch having been assigned to the referenced VLAN.")))