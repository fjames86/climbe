
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PackageTempSensor.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PACKAGETEMPSENSOR (CIM_PACKAGEDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_PackageDependency.Antecedent"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The TemperatureSensor for the Package.") :KEY)
                :INITFORM "CIM_TemperatureSensor")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_PackageDependency.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The PhysicalPackage whose environment is monitored.")
                 :KEY)
                :INITFORM "CIM_PhysicalPackage"))
              (:CIM-NAME "CIM_PackageTempSensor")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_PackageDependency"))
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Device::Sensors")
               (:DESCRIPTION
                "Often, a TemperatureSensor is installed in a Package such as a Chassis or a Rack, not to measure any particular Device, but the Package's environment in general. The use of this association has been deprecated. Instead, use PackageDependency to describe this relationship.")))