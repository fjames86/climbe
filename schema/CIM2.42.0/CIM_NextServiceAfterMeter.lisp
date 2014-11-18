
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_NextServiceAfterMeter.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_NEXTSERVICEAFTERMETER NIL
              ((METERRESULT UINT16 :CIM-NAME "MeterResult" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "Information on the result of the metering. Traffic is distinguished as being conforming, non-conforming, or partially conforming. More complicated metering can be built either by extending the enumeration or by cascading meters.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES
                  ("Unknown" "Conforming" "Partially Conforming"
                   "Non-Conforming")))
                :INITFORM NIL)
               (PRECEDINGSERVICE NIL :CIM-NAME "PrecedingService" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "The preceding MeterService, 'earlier' in the processing sequence for a packet."))
                :INITFORM "CIM_MeterService")
               (FOLLOWINGSERVICE NIL :CIM-NAME "FollowingService" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "The 'next' or following ConditioningService."))
                :INITFORM "CIM_ConditioningService"))
              (:CIM-NAME "CIM_NextServiceAfterMeter")
              (:QUALIFIERS :ASSOCIATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "This association describes a predecessor-successor relationship between a MeterService and one or more ConditioningService objects that process traffic from the meter. For example, for devices that implement preamble marking, the FollowingService reference (after the meter) is a PreambleMarkerService - to record the results of the metering in the preamble. 

It might be expected that the NextServiceAfterMeter association would subclass from NextService. However, meters are 1:n fan-out elements, and require a mechanism to distinguish between the different results/outputs of the meter. Therefore, this association defines a new key property, MeterResult, which is used to record the result and identify the output through which this traffic left the meter.")))