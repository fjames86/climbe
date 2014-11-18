
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_NetworkPipeComposition.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_NETWORKPIPECOMPOSITION (CIM_COMPONENT)
              ((AGGREGATIONSEQUENCE UINT16 :CIM-NAME "AggregationSequence"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the ordering of the PartComponent pipes in the GroupComponent. If the AggregationBehavior property of the GroupComponent pipe is set to 0 or 3 (\"Unknown\" or \"Combined In Parallel\"), then this property MUST be set to 0. If the AggregationBehavior is set to 4 (\"Combined In Sequence\"), then this property SHOULD indicate the ordering of the component pipes. Ordering starts with 1 and larger numbers indicate subsequent pipes. The numbering does not have to be in sequence. The word SHOULD is used in this Description, since the specific ordering of all the component pipes may not be known. In these cases, a value of 0 would be placed in AggregationSequence to indicate that ordering information is not available."))
                :INITFORM NIL)
               (GROUPCOMPONENT NIL :CIM-NAME "GroupComponent" :QUALIFIERS
                (:AGGREGATE (:OVERRIDE "GroupComponent")
                 (:DESCRIPTION
                  "The higher level pipe that is composed of lower-level parts/pipes.")
                 :KEY)
                :INITFORM "CIM_NetworkPipe")
               (PARTCOMPONENT NIL :CIM-NAME "PartComponent" :QUALIFIERS
                ((:OVERRIDE "PartComponent")
                 (:DESCRIPTION "A pipe which is a part of a higher-level one.")
                 :KEY)
                :INITFORM "CIM_NetworkPipe"))
              (:CIM-NAME "CIM_NetworkPipeComposition")
              (:QUALIFIERS :ASSOCIATION (NIL "true") :COMPOSITION
               (:VERSION "2.7.0") (:UML-PACKAGE-PATH "CIM::Network::Pipes")
               (:DESCRIPTION
                "NetworkPipeComposition describes the makeup a pipe, based on lower-level ones. If the pipe is not composed of lower-level entities (i.e., its AggregationBehavior property is set to 2), then no instances of this association should be defined where the pipe has the role of GroupComponent. 

In the context of M.3100, this semantic is modeled as a Trail that is made up of one or more Connections. Both Trails and Connections are subclasses of M.3100's Pipe. Because of the flexibility of the NetworkPipeComposition association, there is no need to subclass NetworkPipe, as was done in M.3100, but merely to instantiate this association to describe the bundling of the lower-level pipes (connections), or the sequencing of them. How the lower-level pipes are aggregated is described by the property, AggregationBehavior, of NetworkPipe. If the pipes are combined in a sequence, the ordering is conveyed via the property, AggregationSequence, on this association.")
               (:MAPPING-STRINGS
                ("Recommendation.ITU|M3100.TrailR1.serverConnectionListPackage"
                 "Recommendation.ITU|M3100.TrailR1.clientConnectionListPackage"))))