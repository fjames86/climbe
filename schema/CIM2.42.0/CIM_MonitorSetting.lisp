
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MonitorSetting.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_MONITORSETTING (CIM_ELEMENTSETTING)
              ((ELEMENT NIL :CIM-NAME "Element" :QUALIFIERS
                ((:OVERRIDE "Element") (:DESCRIPTION "The DesktopMonitor.")
                 :KEY)
                :INITFORM "CIM_DesktopMonitor")
               (SETTING NIL :CIM-NAME "Setting" :QUALIFIERS
                ((:OVERRIDE "Setting")
                 (:DESCRIPTION
                  "The MonitorResolution associated with the DesktopMonitor.")
                 :KEY)
                :INITFORM "CIM_MonitorResolution"))
              (:CIM-NAME "CIM_MonitorSetting")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::UserDevices")
               (:DESCRIPTION
                "MonitorSetting associates the MonitorResolution Setting object with the DesktopMonitor to which it applies.")))