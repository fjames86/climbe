
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_WakeUpServiceOnNetworkPort.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_WAKEUPSERVICEONNETWORKPORT (CIM_DEVICESERVICEIMPLEMENTATION)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The NetworkPort that implements the Service.")
                 :KEY)
                :INITFORM "CIM_NetworkPort")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The wakeup Service that is provided on the NetworkPort.")
                 :KEY)
                :INITFORM "CIM_WakeUpService"))
              (:CIM-NAME "CIM_WakeUpServiceOnNetworkPort")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::Ports")
               (:DESCRIPTION
                "WakeUpServiceOnNetworkPort defines where the WakeUpService is implemented. Currently, the Service can either employ a Modem or a NetworkPort for wakeup.")))