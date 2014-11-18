
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_USBControllerHasHub.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_USBCONTROLLERHASHUB (CIM_CONTROLLEDBY)
              ((ACCESSSTATE UINT16 :CIM-NAME "AccessState" :QUALIFIERS
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
               (NEGOTIATEDDATAWIDTH UINT32 :CIM-NAME "NegotiatedDataWidth"
                :QUALIFIERS
                ((:DESCRIPTION
                  "When several bus and connection data widths are possible, the NegotiatedDataWidth property defines the one that is in use between the Devices. Data width is specified in bits. If data width is not negotiated, or if this information is not available or not important to Device management, the property should be set to 0.")
                 (NIL "Bits")
                 (:MAPPING-STRINGS ("MIF.DMTF|Bus Port Association|001.3"))
                 (:P-UNIT "bit"))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The USBController.") :KEY)
                :INITFORM "CIM_USBController")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MIN "1")
                 (:DESCRIPTION
                  "The USBHub that is associated with the Controller.")
                 :KEY)
                :INITFORM "CIM_USBHub"))
              (:CIM-NAME "CIM_USBControllerHasHub")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::USB")
               (:DESCRIPTION
                "USBControllerHasHub defines the Hub(s) that are downstream of the USBController.")))