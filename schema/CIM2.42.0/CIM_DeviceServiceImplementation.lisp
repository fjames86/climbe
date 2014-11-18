
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DeviceServiceImplementation.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DEVICESERVICEIMPLEMENTATION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:DESCRIPTION "The LogicalDevice.")
                 :KEY)
                :INITFORM "CIM_LogicalDevice")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The Service implemented using the Logical Device.")
                 :KEY)
                :INITFORM "CIM_Service"))
              (:CIM-NAME "CIM_DeviceServiceImplementation")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Device")
               (:DESCRIPTION
                "An association between a Service and how it is implemented. The cardinality of this association is many-to-many. A Service can be provided by more than one Logical Device, operating in conjunction. And, any Device can provide more than one Service. When multiple Devices are associated with a single Service, it is assumed that these elements operate in conjunction to provide the Service. If different implementations of a Service exist, each of these implementations would result in individual instantiations of the Service object. These individual instantiations would then have associations to the unique implementations.")))