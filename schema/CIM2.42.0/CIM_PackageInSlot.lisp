
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PackageInSlot.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PACKAGEINSLOT (CIM_PACKAGEINCONNECTOR)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION
                  "The Slot into which the PhysicalPackage is inserted.")
                 :KEY)
                :INITFORM "CIM_Slot")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent") (:MAX "1")
                 (:DESCRIPTION "The Package in the Slot.") :KEY)
                :INITFORM "CIM_PhysicalPackage"))
              (:CIM-NAME "CIM_PackageInSlot")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.6.0")
               (:UML-PACKAGE-PATH "CIM::Physical::Connector")
               (:DESCRIPTION
                "Complex networking devices often are Chassis-based. These Chassis allow for enhancement and/or augmentation of their base functionality by accepting additional Chassis devices, similar to accepting functionality in the form of adding Cards. This association models this capability.")))