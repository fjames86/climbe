
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_WakeUpServiceOnNetworkAdapter.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_WAKEUPSERVICEONNETWORKADAPTER
              (CIM_DEVICESERVICEIMPLEMENTATION)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_WakeUpServiceOnNetworkPort.Antecedent"))
                 (:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The NetworkAdapter that implements the Service.")
                 :KEY)
                :INITFORM "CIM_NetworkAdapter")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_WakeUpServiceOnNetworkPort.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "Note: The use of this method has been deprecated. 
Deprecated description: The wakeup Service that is provided on the NetworkAdapter.")
                 :KEY)
                :INITFORM "CIM_WakeUpService"))
              (:CIM-NAME "CIM_WakeUpServiceOnNetworkAdapter")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_WakeUpServiceOnNetworkPort"))
               (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::NetworkAdapter")
               (:DESCRIPTION
                "Note: The use of the CIM_WakeUpServiceOnNetworkAdapter class has been deprecated because NetworkAdapter is deprecated. Instead use the CIM_WakeUpServiceOnNetworkPort class. 
Deprecated description: WakeUpServiceOnNetworkAdapter defines where the WakeUpService is implemented.")))