
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DeviceConnection.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DEVICECONNECTION (CIM_DEPENDENCY)
              ((NEGOTIATEDSPEED UINT64 :CIM-NAME "NegotiatedSpeed" :QUALIFIERS
                ((:DESCRIPTION
                  "When several bus and connection speeds are possible, the NegotiatedSpeed property defines the one that is in use between the Devices. Speed is specified in bits per second. If connection or bus speeds are not negotiated, or if this information is not available or not important to Device management, the property should be set to 0.")
                 (NIL "Bits per Second")
                 (:MAPPING-STRINGS ("MIF.DMTF|Bus Port Association|001.2"))
                 (:P-UNIT "bit / second"))
                :INITFORM NIL)
               (NEGOTIATEDDATAWIDTH UINT32 :CIM-NAME "NegotiatedDataWidth"
                :QUALIFIERS
                ((:DESCRIPTION
                  "When several bus and connection data widths are possible, the NegotiatedDataWidth property defines the one that is in use between the Devices. Data width is specified in bits. If data width is not negotiated, or if this information is not available or not important to Device management, the property should be set to 0.")
                 (NIL "Bits")
                 (:MAPPING-STRINGS ("MIF.DMTF|Bus Port Association|001.3"))
                 (:P-UNIT "bit"))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "A LogicalDevice.")
                 :KEY)
                :INITFORM "CIM_LogicalDevice")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "A second LogicalDevice that is connected to the Antecedent Device.")
                 :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_DeviceConnection")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::DeviceElements")
               (:DESCRIPTION
                "The DeviceConnection relationship indicates that two or more Devices are connected together.")))