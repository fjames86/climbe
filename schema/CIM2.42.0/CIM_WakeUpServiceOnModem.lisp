
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_WakeUpServiceOnModem.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_WAKEUPSERVICEONMODEM (CIM_DEVICESERVICEIMPLEMENTATION)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The Modem that implements the WakeUpService.")
                 :KEY)
                :INITFORM "CIM_Modem")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The wakeup Service that is provided on the Modem.")
                 :KEY)
                :INITFORM "CIM_WakeUpService"))
              (:CIM-NAME "CIM_WakeUpServiceOnModem")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::Modems")
               (:DESCRIPTION
                "WakeUpServiceOnModem defines where the WakeUpService is implemented. The Service can either employ a Modem or NetworkAdapter to receive a wakeup signal.")))