
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_TransparentBridgingStaticForwarding.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_TRANSPARENTBRIDGINGSTATICFORWARDING (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The TransparentBridgingService.") :KEY)
                :INITFORM "CIM_TransparentBridgingService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") :WEAK
                 (:DESCRIPTION
                  "StaticForwardingEntry of the forwarding database.")
                 :KEY)
                :INITFORM "CIM_StaticForwardingEntry"))
              (:CIM-NAME "CIM_TransparentBridgingStaticForwarding")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Network::SwitchingBridging")
               (:DESCRIPTION
                "This association links an instance of the Transparent BridgingService to the entries of its static (destination-address filtering) database.")))