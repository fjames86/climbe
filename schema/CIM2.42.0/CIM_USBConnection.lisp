
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_USBConnection.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_USBCONNECTION (CIM_DEVICECONNECTION)
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
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The USBPort.") :KEY)
                :INITFORM "CIM_USBPort")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "The USBDevice that is connected to the Port.")
                 :KEY)
                :INITFORM "CIM_USBDevice"))
              (:CIM-NAME "CIM_USBConnection")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::USB")
               (:DESCRIPTION
                "USBConnection associates a Device with the USBPort to which it is connected.")))