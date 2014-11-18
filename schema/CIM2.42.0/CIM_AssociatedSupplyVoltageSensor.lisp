
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AssociatedSupplyVoltageSensor.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ASSOCIATEDSUPPLYVOLTAGESENSOR (CIM_ASSOCIATEDSENSOR)
              ((MONITORINGRANGE UINT16 :CIM-NAME "MonitoringRange" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Indicates the PowerSupply's input voltage range measured by the associated sensor. Range 1, 2 or both can be specified using the values 2, 3 or 4, respectively.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES
                  ("Unknown" "Other" "Range 1" "Range 2"
                   "Both Range 1 and 2")))
                :INITFORM NIL)
               (ANTECEDENT NIL :CIM-NAME "Antecedent" :QUALIFIERS
                ((:DEPRECATED ("CIM_AssociatedSensor.Antecedent"))
                 (:OVERRIDE "Antecedent") (:DESCRIPTION "The VoltageSensor.")
                 :KEY)
                :INITFORM "CIM_VoltageSensor")
               (DEPENDENT NIL :CIM-NAME "Dependent" :QUALIFIERS
                ((:DEPRECATED ("CIM_AssociatedSensor.Dependent"))
                 (:OVERRIDE "Dependent")
                 (:DESCRIPTION
                  "The PowerSupply associated with the VoltageSensor.")
                 :KEY)
                :INITFORM "CIM_PowerSupply"))
              (:CIM-NAME "CIM_AssociatedSupplyVoltageSensor")
              (:QUALIFIERS :ASSOCIATION (:DEPRECATED ("CIM_AssociatedSensor"))
               (:VERSION "2.8.0") (:UML-PACKAGE-PATH "CIM::Device::Sensors")
               (:DESCRIPTION
                "The use of this association is being deprecated in lieu of using AssociatedSensor, since the use of the referenced class VoltageSensor is deprecated. 
A PowerSupply may have an associated VoltageSensor, monitoring its input voltage. This is described by this association.")))