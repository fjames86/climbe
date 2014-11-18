
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ServiceAvailableToElement.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SERVICEAVAILABLETOELEMENT NIL
              ((SERVICEPROVIDED NIL :CIM-NAME "ServiceProvided" :QUALIFIERS
                (:KEY (:DESCRIPTION "The Service that is available."))
                :INITFORM "CIM_Service")
               (USEROFSERVICE NIL :CIM-NAME "UserOfService" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "The ManagedElement that can use the Service."))
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_ServiceAvailableToElement")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Core::Service")
               (:DESCRIPTION
                "CIM_ServiceAvailableToElement conveys the semantics of a Service that is available for the use of a ManagedElement. An example of an available Service is that a Processor and an enclosure (a PhysicalElement) can use AlertOnLAN Services to signal an incomplete or erroneous boot. In reality, AlertOnLAN is simply a HostedService on a computer system that is generally available for use and is not a dependency of the processor or enclosure. To describe that the use of this service might be restricted or have limited availability or applicability, the CIM_ServiceAvailableToElement association would be instantiated between the Service and specific CIM_Processors and CIM_Chassis.")))