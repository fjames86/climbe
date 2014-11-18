
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PackageCooling.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PACKAGECOOLING (CIM_PACKAGEDEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_PackageDependency.Antecedent"))
                 (:OVERRIDE "Antecedent")
                 (:DESCRIPTION "Note: The use of this method is deprecated. 
Deprecated description: The CoolingDevice for the Package.")
                 :KEY)
                :INITFORM "CIM_CoolingDevice")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_PackageDependency.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION "Note: The use of this method is deprecated. 
Deprecated description: The PhysicalPackage whose environment is cooled.")
                 :KEY)
                :INITFORM "CIM_PhysicalPackage"))
              (:CIM-NAME "CIM_PackageCooling")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_PackageDependency"))
               (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::CoolingAndPower")
               (:DESCRIPTION
                "Note: The use of this association has been deprecated. Instead, the more generic PackageDependency relationship should be used. 
Deprecated description: Often, a CoolingDevice is installed in a Package such as a Chassis or a Rack, not for a specific Device, but to assist in the cooling of the Package in general.")))