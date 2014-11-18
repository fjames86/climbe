
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_RangesOfConfiguration.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_RANGESOFCONFIGURATION (CIM_DEPENDENCY)
              ((ENABLEADVERTISE BOOLEAN :CIM-NAME "EnableAdvertise" :QUALIFIERS
                ((:DESCRIPTION
                  "The address range is advertised (TRUE) or not (FALSE), see C.2 in RFC 2328."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The address range that is in the OSPF area configuration.")
                 :KEY)
                :INITFORM "CIM_RangeOfIPAddresses")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The OSPF area configuration that contains the range.")
                 :KEY)
                :INITFORM "CIM_OSPFAreaConfiguration"))
              (:CIM-NAME "CIM_RangesOfConfiguration")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::OSPF")
               (:DESCRIPTION
                "This association connects address ranges to the OSPF area configuration. When network administrators want to control the advertisements of OSPF routers by filters, they first define the relevant ranges. In order for a router to handle a range, an instance of RangeOfIPAddresses MUST be associated to the router's OSPFAreaConfiguration, using this relationship. The association between the range and area configuration contains a property (EnableAdvertise) defining the handling - to allow or disallow advertismenets in the range.")))