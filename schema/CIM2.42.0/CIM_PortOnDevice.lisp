
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PortOnDevice.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PORTONDEVICE (CIM_HOSTEDDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The Device that includes the Port.") (:MAX "1")
                 :KEY)
                :INITFORM "CIM_LogicalDevice")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The Port on the Device.") :KEY)
                :INITFORM "CIM_LogicalPort"))
              (:CIM-NAME "CIM_PortOnDevice")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Device::Ports")
               (:DESCRIPTION
                "PortOnDevice associates a Port or connection point with its Device.")))