
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ProvidesServiceToElement.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PROVIDESSERVICETOELEMENT (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_ServiceAvailableToElement.ServiceProvided"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated. Deprecated description: The Service provided.")
                 :KEY)
                :INITFORM "CIM_Service")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_ServiceAvailableToElement.UserOfService"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "Note: The use of this element is deprecated. Deprecated description: The ManagedElement that is dependent on the Service.")
                 :KEY)
                :INITFORM "CIM_ManagedElement"))
              (:CIM-NAME "CIM_ProvidesServiceToElement")
              (:QUALIFIERS :ASSOCIATION
               (:DEPRECATED ("CIM_ServiceAvailableToElement"))
               (:VERSION "2.10.0") (:UML-PACKAGE-PATH "CIM::Core::Service")
               (:DESCRIPTION
                "Note: The use of the CIM_ProvidesServiceToElement class has been deprecated. Instead, ServiceAvailableToElement conveys the semantics of use, while the subclasses of ProvidesServiceToElement (or the ConcreteDependency association) describe dependency relationships. CIM_ProvidesServiceToElement was meant to generalize the ServiceServiceDependency association. This method indicates that ManagedElements can use the functionality provided by one or more Services. An example of the association is that a Processor and an enclosure (a PhysicalElement) can use AlertOnLAN Services to signal an incomplete or erroneous boot. In reality, AlertOnLAN is simply a HostedService on a computer system that is generally available for use and is not a dependency of the processor or enclosure. To describe that the use of the service might be restricted or have limited availability or applicability, the CIM_ServiceAvailableToElement association would be instantiated.")))