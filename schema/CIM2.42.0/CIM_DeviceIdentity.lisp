
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DeviceIdentity.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DEVICEIDENTITY (CIM_LOGICALIDENTITY)
              ((SYSTEMELEMENT NIL :CIM-NAME "SystemElement" :QUALIFIERS
                ((:OVERRIDE "SystemElement")
                 (:DESCRIPTION
                  "SystemElement represents one aspect of the Device.")
                 :KEY)
                :INITFORM "CIM_LogicalDevice")
               (SAMEELEMENT NIL :CIM-NAME "SameElement" :QUALIFIERS
                ((:OVERRIDE "SameElement")
                 (:DESCRIPTION
                  "SameElement represents an alternate aspect of the System entity.")
                 :KEY)
                :INITFORM "CIM_LogicalDevice"))
              (:CIM-NAME "CIM_DeviceIdentity")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::DeviceElements")
               (:DESCRIPTION
                "CIM_DeviceIdentity indicates that two LogicalDevices represent different aspects of the same underlying entity. This association refines the CIM_LogicalIdentity superclass by restricting it to the Device level and defining its use in well understood scenarios. One of these scenarios is to represent that a Device is both a 'bus' entity and a 'functional' entity. For example, a Device could be both a PCI Device (or a USB Device), as well as a CIM_Keyboard. The other scenario is where a Device plays multiple functional roles that can not be distinguished by their hardware realization alone. For example, a Fibre Channel adapter might have aspects of both a NetworkAdapter and a SCSIController.")))