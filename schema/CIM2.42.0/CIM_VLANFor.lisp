
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_VLANFor.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_VLANFOR (CIM_SERVICESAPDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The VLAN for the VLANService.") :KEY)
                :INITFORM "CIM_VLAN")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("No value")) (:OVERRIDE "Dependent") (:MIN "1")
                 (:DESCRIPTION
                  "The VLANService which uses the VLAN for processing.")
                 :KEY)
                :INITFORM "CIM_VLANService"))
              (:CIM-NAME "CIM_VLANFor")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("No value"))
               (:VERSION "2.8.0") (:UML-PACKAGE-PATH "CIM::Network::VLAN")
               (:DESCRIPTION "The VLAN for the VLAN Service.")))