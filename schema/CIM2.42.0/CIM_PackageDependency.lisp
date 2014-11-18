
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PackageDependency.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PACKAGEDEPENDENCY (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The Logical Device for the Package.") :KEY)
                :INITFORM "CIM_LogicalDevice")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The PhysicalPackage whose environment is affected.")
                 :KEY)
                :INITFORM "CIM_PhysicalPackage"))
              (:CIM-NAME "CIM_PackageDependency")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Device::DeviceElements")
               (:DESCRIPTION
                "A LogicalDevice is installed in a Package such as a Chassis or a Rack, not for a specific Device, but to function with the Package in general. This relationship is described by the PackageDependency association.")))