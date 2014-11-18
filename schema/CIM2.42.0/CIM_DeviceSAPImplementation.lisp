
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DeviceSAPImplementation.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DEVICESAPIMPLEMENTATION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The LogicalDevice.")
                 :KEY)
                :INITFORM "CIM_LogicalDevice")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The ServiceAccessPoint implemented using the LogicalDevice.")
                 :KEY)
                :INITFORM "CIM_ServiceAccessPoint"))
              (:CIM-NAME "CIM_DeviceSAPImplementation")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Device")
               (:DESCRIPTION
                "An association between a ServiceAccessPoint (SAP) and how it is implemented. The cardinality of this association is many-to-many. A SAP can be provided by more than one LogicalDevice, operating in conjunction. And, any Device can provide more than one ServiceAccessPoint. When many LogicalDevices are associated with a single SAP, it is assumed that these elements operate in conjunction to provide the AccessPoint. If different implementations of a SAP exist, each of these implementations would result in individual instantiations of the ServiceAccessPoint object. These individual instantiations would then have associations to the unique implementations.")))