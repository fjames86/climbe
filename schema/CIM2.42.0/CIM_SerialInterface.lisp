
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SerialInterface.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SERIALINTERFACE (CIM_CONTROLLEDBY)
              ((NEGOTIATEDDATAWIDTH UINT32 :CIM-NAME "NegotiatedDataWidth"
                :QUALIFIERS
                ((:OVERRIDE "NegotiatedDataWidth")
                 (:DESCRIPTION
                  "For the SerialInterface, NegotiatedDataWidth is the number of data bits to be transmitted, without stop bits or parity.")
                 (NIL "Bits") (:P-UNIT "bit")
                 (:MAPPING-STRINGS ("MIF.DMTF|Bus Port Association|001.3")))
                :INITFORM NIL)
               (NUMBEROFSTOPBITS UINT16 :CIM-NAME "NumberOfStopBits"
                :QUALIFIERS
                ((:DESCRIPTION "Number of stop bits to be transmitted.")
                 (NIL "Bits") (:P-UNIT "bit"))
                :INITFORM NIL)
               (PARITYINFO UINT16 :CIM-NAME "ParityInfo" :QUALIFIERS
                ((:DESCRIPTION
                  "Information on the parity setting for transmitted data. No parity (value=1), even (value=2), or odd (value=3) can be specified.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES ("Unknown" "None" "Even" "Odd")))
                :INITFORM NIL)
               (FLOWCONTROLINFO UINT16 :CIM-NAME "FlowControlInfo" :QUALIFIERS
                ((:DESCRIPTION
                  "An integer enumeration that indicates the flow control (Xon-Xoff or RTS/CTS) for transmitted data.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "Not Supported" "None" "XonXoff" "RTS/CTS"
                   "Both XonXoff and RTS/CTS")))
                :INITFORM NIL)
               (ACCESSSTATE UINT16 :CIM-NAME "AccessState" :QUALIFIERS
                ((:DESCRIPTION
                  "The State property indicates whether the Controller is actively commanding or accessing the Device (value=1) or not (value=2). Also, the value, \"Unknown\" (0), can be defined. This information is necessary when a LogicalDevice can be commanded by, or accessed through, multiple Controllers.")
                 (:VALUE-MAP ("0" "1" "2"))
                 (:VALUES ("Unknown" "Active" "Inactive")))
                :INITFORM NIL)
               (TIMEOFDEVICERESET DATETIME :CIM-NAME "TimeOfDeviceReset"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The time that the downstream Device was last reset by the Controller."))
                :INITFORM NIL)
               (NUMBEROFHARDRESETS UINT32 :CIM-NAME "NumberOfHardResets"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Number of hard resets issued by the Controller. A hard reset returns the Device to its initialization or boot-up state. All internal Device state information and data are lost.")
                 :COUNTER)
                :INITFORM NIL)
               (NUMBEROFSOFTRESETS UINT32 :CIM-NAME "NumberOfSoftResets"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Number of soft resets issued by the Controller. A soft reset does not completely clear current Device state or data. Exact semantics are dependent on the Device and on the protocols and mechanisms used to communicate with the Device.")
                 :COUNTER)
                :INITFORM NIL)
               (DEVICENUMBER STRING :CIM-NAME "DeviceNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "Address of associated Device in context of the antecedent Controller."))
                :INITFORM NIL)
               (ACCESSMODE UINT16 :CIM-NAME "AccessMode" :QUALIFIERS
                ((:DESCRIPTION
                  "This property describes the accessibility of the device through the antecedent controller.")
                 (:VALUE-MAP ("2" "3" "4"))
                 (:VALUES ("ReadWrite" "ReadOnly" "NoAccess")))
                :INITFORM NIL)
               (ACCESSPRIORITY UINT16 :CIM-NAME "AccessPriority" :QUALIFIERS
                ((:DESCRIPTION
                  "The property describes the priority given to accesses of the device through this controller. The highest priority path will have the lowest value for this parameter."))
                :INITFORM NIL)
               (NEGOTIATEDSPEED UINT64 :CIM-NAME "NegotiatedSpeed" :QUALIFIERS
                ((:DESCRIPTION
                  "When several bus and connection speeds are possible, the NegotiatedSpeed property defines the one that is in use between the Devices. Speed is specified in bits per second. If connection or bus speeds are not negotiated, or if this information is not available or not important to Device management, the property should be set to 0.")
                 (NIL "Bits per Second")
                 (:MAPPING-STRINGS ("MIF.DMTF|Bus Port Association|001.2"))
                 (:P-UNIT "bit / second"))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The SerialController.") :KEY)
                :INITFORM "CIM_SerialController")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The controlled Device.") :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_SerialInterface")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::Controller")
               (:DESCRIPTION
                "SerialInterface is a ControlledBy relationship that indicates which Devices are accessed through the SerialController and describes the characteristics of this access.")))