
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OOBAlertServiceOnNetworkAdapter.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_OOBALERTSERVICEONNETWORKADAPTER
              (CIM_DEVICESERVICEIMPLEMENTATION)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_OOBAlertServiceOnNetworkPort.Antecedent"))
                 (:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The NetworkAdapter that implements the Service.")
                 :KEY)
                :INITFORM "CIM_NetworkAdapter")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_OOBAlertServiceOnNetworkPort.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The alerting Service that is provided on the NetworkAdapter.")
                 :KEY)
                :INITFORM "CIM_OOBAlertService"))
              (:CIM-NAME "CIM_OOBAlertServiceOnNetworkAdapter")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_OOBAlertServiceOnNetworkPort"))
               (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::NetworkAdapter")
               (:DESCRIPTION
                "Note: The use of CIM_OOBAlertServiceOnNetworkAdapter has been deprecated because NetworkAdapter has been deprecated. Instead use the CIM_OOBAlertServiceOnNetworkPort class. 
Deprecated description: OOBAlertServiceOnNetworkAdapter defines where the out-of-band alerting Service is implemented.")))