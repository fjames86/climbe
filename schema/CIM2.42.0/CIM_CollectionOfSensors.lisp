
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CollectionOfSensors.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_COLLECTIONOFSENSORS (CIM_COMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION "The MultiStateSensor.") :KEY)
                :INITFORM "CIM_MultiStateSensor")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent") (:MIN "2")
                 (:DESCRIPTION
                  "A Sensor that is part of the MultiStateSensor.")
                 :KEY)
                :INITFORM "CIM_Sensor"))
              (:CIM-NAME "CIM_CollectionOfSensors")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Device::Sensors")
               (:DESCRIPTION
                "The CollectionOfSensors association indicates the Sensors that make up a MultiStateSensor.")))