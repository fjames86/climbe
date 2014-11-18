
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SuppliesPower.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SUPPLIESPOWER (CIM_DEPENDENCY)
              ((ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:OVERRIDE "Antecedent")
                 (:DESCRIPTION "The Supply that is providing power.") :KEY)
                :INITFORM "CIM_PowerSupply")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "A ManagedSystemElement in the power domain of the Supply.")
                 :KEY)
                :INITFORM "CIM_ManagedSystemElement"))
              (:CIM-NAME "CIM_SuppliesPower")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.19.1")
               (:UML-PACKAGE-PATH "CIM::Device::CoolingAndPower")
               (:DESCRIPTION
                "The SuppliesPower relationship indicates that a ManagedSystemElementis in the power domain of the referenced PowerSource. It indicates which ManagedSystemElements are dependent on the PowerSource, and therefore, which ManagedSystemElements are affected if the PowerSource is lost.")))