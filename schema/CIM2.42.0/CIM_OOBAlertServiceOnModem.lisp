
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OOBAlertServiceOnModem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_OOBALERTSERVICEONMODEM (CIM_DEVICESERVICEIMPLEMENTATION)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION
                  "The Modem that implements the alerting Service.")
                 :KEY)
                :INITFORM "CIM_Modem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The alerting Service that is provided on the Modem.")
                 :KEY)
                :INITFORM "CIM_OOBAlertService"))
              (:CIM-NAME "CIM_OOBAlertServiceOnModem")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::Modems")
               (:DESCRIPTION
                "OOBAlertServiceOnModem defines where the out-of-band alerting Service is implemented. The Service can either employ a Modem or NetworkAdapter to send alerts.")))