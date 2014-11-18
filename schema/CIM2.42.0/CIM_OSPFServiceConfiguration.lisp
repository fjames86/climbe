
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_OSPFServiceConfiguration.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_OSPFSERVICECONFIGURATION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MIN "1") (:MAX "1")
                 (:DESCRIPTION "The OSPF service.") :KEY)
                :INITFORM "CIM_OSPFService")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The area configuration.") :KEY)
                :INITFORM "CIM_OSPFAreaConfiguration"))
              (:CIM-NAME "CIM_OSPFServiceConfiguration")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::OSPF")
               (:DESCRIPTION
                "OSPFServiceConfiguration connects an OSPF service to its area configurations. The configurations are defined for the OSPF Service, and so do not make sense as stand alone objects. This is the reason for the Min (1), Max (1) cardinalities on OSPFService. They mandate the instantiation of the service and of this association for the referenced instance of OSPFAreaConfiguration. The area configuration acts as a focal point to bring together the router (indicated as a ComputerSystem with an instance of OSPFService, associated to the AreaConfiguration using this relationship), the area (indicated as an OSPFArea, associated to the AreaConfiguration using AreaOfConfiguration) and the address ranges for advertising (indicated as instances of RangeOfIPAddresses, associated to the AreaConfiguration using RangesOfConfiguration). There would be an instance of OSPFAreaConfiguration for each connected area of a router/OSPFService.")))