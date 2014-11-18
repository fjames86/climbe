
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OOBAlertServiceOnNetworkPort.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_OOBALERTSERVICEONNETWORKPORT
              (CIM_DEVICESERVICEIMPLEMENTATION)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The NetworkPort that implements the Service.")
                 :KEY)
                :INITFORM "CIM_NetworkPort")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The alerting Service that is provided on the NetworkPort.")
                 :KEY)
                :INITFORM "CIM_OOBAlertService"))
              (:CIM-NAME "CIM_OOBAlertServiceOnNetworkPort")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::Ports")
               (:DESCRIPTION
                "OOBAlertServiceOnNetworkPort defines where the out-of-band alerting Service is implemented. Currently, the Service can either employ a Modem or a NetworkPort to send alerts.")))