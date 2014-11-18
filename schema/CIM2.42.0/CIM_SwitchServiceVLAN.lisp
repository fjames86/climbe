
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SwitchServiceVLAN.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SWITCHSERVICEVLAN (CIM_SERVICECOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                ((:DEPRECATED ("No value")) :AGGREGATE
                 (:OVERRIDE "GroupComponent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The SwitchService containing the VLANService.")
                 :KEY)
                :INITFORM "CIM_SwitchService")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The VLANService that is a component of the SwitchService.")
                 :KEY)
                :INITFORM "CIM_VLANService"))
              (:CIM-NAME "CIM_SwitchServiceVLAN")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value")) (NIL "true")
               (:VERSION "2.8.0") (:UML-PACKAGE-PATH "CIM::Network::VLAN")
               (:DESCRIPTION
                "This class is deprecated as a fall out of the previous deprecations within the existing model An association linking SwitchService to a component VLANService.")))