
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_QoSSubService.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_QOSSUBSERVICE (CIM_SERVICECOMPONENT)
              ((GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent") (:MAX "1")
                 (:DESCRIPTION
                  "The higher level QoSService that is constructed by aggregating one or more lower-level QoSServices.")
                 :KEY)
                :INITFORM "CIM_QoSService")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION
                  "The more concrete QoSService that is used to provide the higher level Service.")
                 :KEY)
                :INITFORM "CIM_QoSService"))
              (:CIM-NAME "CIM_QoSSubService")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Network::QoS")
               (:DESCRIPTION
                "The associations - QoSSubService and QoSConditioningSub Service - operate in conjunction. High level QoS definitions, such as 'John gets Gold Service', map to lower level, more concrete QoSServices (the subclasses of QoSService). This is described by the QoSSubService association. In turn, each of the SubServices may require their own conditioning. This is modeled using the QoSConditioningSubService aggregation. 

Note that a more concrete QoSService may only be aggregated into one higher level Service, using this association. The cardinality on the GroupComponent reference is Max (1).")))