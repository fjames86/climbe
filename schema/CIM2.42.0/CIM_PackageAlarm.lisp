
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PackageAlarm.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PACKAGEALARM (CIM_PACKAGEDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_PackageDependency.Antecedent"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The AlarmDevice for the Package.") :KEY)
                :INITFORM "CIM_AlarmDevice")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_PackageDependency.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The PhysicalPackage whose health, security, environment, etc. is alarmed.")
                 :KEY)
                :INITFORM "CIM_PhysicalPackage"))
              (:CIM-NAME "CIM_PackageAlarm")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_PackageDependency"))
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Device::Sensors")
               (:DESCRIPTION
                "Often, an AlarmDevice is installed as part of a Package, not to indicate issues with any particular LogicalDevice or PhysicalComponent, but with the Package's environment in general, its security state or its overall health. The use of this association has been deprecated. Instead, use PackageDependency to describe this relationship.")))