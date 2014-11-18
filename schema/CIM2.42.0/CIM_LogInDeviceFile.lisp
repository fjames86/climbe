
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_LogInDeviceFile.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LOGINDEVICEFILE (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The I/O stream DeviceFile.") :KEY)
                :INITFORM "CIM_DeviceFile")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The MessageLog outputting to the DeviceFile.")
                 :KEY)
                :INITFORM "CIM_MessageLog"))
              (:CIM-NAME "CIM_LogInDeviceFile")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::System::Logs")
               (:DESCRIPTION
                "MessageLogs can reside in data files, on specially allocated storage areas such as disks or memory, or output as raw I/O streams. In fact, a single Log may use each of these mechanisms to output or capture its contents. The LogInDeviceFile association describes a Log outputting to a raw I/O stream DeviceFile - for example, a serial port on a UNIX system.")))