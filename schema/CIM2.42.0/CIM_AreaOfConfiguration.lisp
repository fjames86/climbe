
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AreaOfConfiguration.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_AREAOFCONFIGURATION (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent") (:MAX "1")
                 (:DESCRIPTION "The OSPF area.") :KEY)
                :INITFORM "CIM_OSPFArea")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The configuration which is applied to an OSPF area. This is the Dependent reference in this association, since it depends on the area for any functional significance.")
                 :KEY)
                :INITFORM "CIM_OSPFAreaConfiguration"))
              (:CIM-NAME "CIM_AreaOfConfiguration")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::OSPF")
               (:DESCRIPTION
                "This association connects an area configuration to its area. The OSPFAreaConfiguration class is defined to act as a focal point to bring together the router (indicated as a ComputerSystem with an instance of OSPFService, associated to the AreaConfiguration using OSPFServiceConfiguration), the area (indicated as an OSPFArea, associated to the AreaConfiguration using AreaOfConfiguration) and the address ranges for advertising (indicated as instances of RangeOfIPAddresses, associated to the AreaConfiguration using RangesOfConfiguration). There is an instance of OSPFAreaConfiguration for each connected area of a router/OSPFService.")))