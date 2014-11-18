
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ErrorCountersForDevice.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ERRORCOUNTERSFORDEVICE (CIM_STATISTICS)
              ((STATS NIL :CIM-NAME "Stats" :QUALIFIERS
                ((:OVERRIDE "Stats") :WEAK
                 (:DESCRIPTION
                  "The statistical object, in this case, the error counter class.")
                 :KEY)
                :INITFORM "CIM_DeviceErrorCounts")
               (ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                ((:OVERRIDE "Element") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The Device to which the error counters apply.")
                 :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_ErrorCountersForDevice")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::DeviceElements")
               (:DESCRIPTION
                "ErrorCountersForDevice relates the DeviceErrorCounts class to the LogicalDevice to which it applies.")))