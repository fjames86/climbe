
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ComputerSystemPackage.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COMPUTERSYSTEMPACKAGE (CIM_SYSTEMPACKAGING)
              ((PLATFORMGUID STRING :CIM-NAME "PlatformGUID" :QUALIFIERS
                ((:DESCRIPTION
                  "A Gloabally Unique Identifier for the System's Package."))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The PhysicalPackage(s) that realize a Unitary ComputerSystem.")
                 :KEY)
                :INITFORM "CIM_PhysicalPackage")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION "The UnitaryComputerSystem.") :KEY)
                :INITFORM "CIM_ComputerSystem"))
              (:CIM-NAME "CIM_ComputerSystemPackage")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.13.0")
               (:UML-PACKAGE-PATH "CIM::System::SystemElements")
               (:DESCRIPTION
                "Similar to the way that LogicalDevices are 'Realized' by PhysicalElements, ComputerSystem may be realized in one or more PhysicalPackages. The ComputerSystemPackage association explicitly defines this relationship.")))