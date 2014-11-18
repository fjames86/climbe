
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_InstModification.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_INSTMODIFICATION (CIM_INSTINDICATION)
              ((PREVIOUSINSTANCE STRING :CIM-NAME "PreviousInstance"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A copy of the 'previous' instance whose change generated the Indication. PreviousInstance contains 'older' values of an instance's properties (as compared to SourceInstance), selected by the IndicationFilter's Query.")
                 :EMBEDDED-OBJECT)
                :INITFORM NIL)
               (SOURCEINSTANCE STRING :CIM-NAME "SourceInstance" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "A copy of the instance that changed to generate the Indication. SourceInstance contains the current values of the properties selected by the Indication Filter's Query. In the case of CIM_InstDeletion, the property values are copied before the instance is deleted.")
                 :EMBEDDED-OBJECT)
                :INITFORM NIL)
               (SOURCEINSTANCEMODELPATH STRING :CIM-NAME
                "SourceInstanceModelPath" :QUALIFIERS
                ((:DESCRIPTION
                  "The Model Path of the SourceInstance. The following format MUST be used to encode the Model Path: 
<NamespacePath>:<ClassName>.<Prop1>=\"<Value1>\", 
<Prop2>=\"<Value2>\", ...")
                 (:MODEL-CORRESPONDENCE ("CIM_InstIndication.SourceInstance")))
                :INITFORM NIL)
               (SOURCEINSTANCEHOST STRING :CIM-NAME "SourceInstanceHost"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The host name or IP address of the SourceInstance.")
                 (:MODEL-CORRESPONDENCE ("CIM_InstIndication.SourceInstance")))
                :INITFORM NIL)
               (INDICATIONIDENTIFIER STRING :CIM-NAME "IndicationIdentifier"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An identifier for the Indication. This property is similar to a key value in that it can be used for identification, when correlating Indications (see the CorrelatedIndications array). Its value SHOULD be unique as long as correlations are reported, but MAY be reused or left NULL if no future Indications will reference it in their CorrelatedIndications array.To ensure uniqueness, the value of IndicationIdentifier should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> must include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the IndicationIdentifier or that is a recognized ID that is assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> must not contain a colon (:). When using this algorithm, the first colon to appear in IndicationIdentifier must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be re-used to identify different underlying (real-world) elements. 
If the above \"preferred\" algorithm is not used, the defining entity should assure that the resulting IndicationIdentifier is not re-used across any IndicationIdentifiers that are produced by this or other providers for the NameSpace of this instance. 
For DMTF-defined instances, the \"preferred\" algorithm should be used with the <OrgID> set to CIM.")
                 (:MAPPING-STRINGS
                  ("Recommendation.ITU|X733.Notification identifier")))
                :INITFORM NIL)
               (INDICATIONTIME DATETIME :CIM-NAME "IndicationTime" :QUALIFIERS
                ((:DESCRIPTION
                  "The time and date of creation of the Indication. The property may be set to NULL if the entity creating the Indication is not capable of determining this information. Note that IndicationTime may be the same for two Indications that are generated in rapid succession."))
                :INITFORM NIL)
               (PERCEIVEDSEVERITY UINT16 :CIM-NAME "PerceivedSeverity"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An enumerated value that describes the severity of the Indication from the notifier's point of view: 
1 - Other, by CIM convention, is used to indicate that the Severity's value can be found in the OtherSeverity property. 
3 - Degraded/Warning should be used when its appropriate to let the user decide if action is needed. 
4 - Minor should be used to indicate action is needed, but the situation is not serious at this time. 
5 - Major should be used to indicate action is needed NOW. 
6 - Critical should be used to indicate action is needed NOW and the scope is broad (perhaps an imminent outage to a critical resource will result). 
7 - Fatal/NonRecoverable should be used to indicate an error occurred, but it's too late to take remedial action. 
2 and 0 - Information and Unknown (respectively) follow common usage. Literally, the Indication is purely informational or its severity is simply unknown.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7" ".."))
                 (:VALUES
                  ("Unknown" "Other" "Information" "Degraded/Warning" "Minor"
                   "Major" "Critical" "Fatal/NonRecoverable" "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("Recommendation.ITU|X733.Perceived severity")))
                :INITFORM NIL)
               (OTHERSEVERITY STRING :CIM-NAME "OtherSeverity" :QUALIFIERS
                ((:DESCRIPTION
                  "Holds the value of the user defined severity value when 'PerceivedSeverity' is 1 (\"Other\").")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AlertIndication.PerceivedSeverity")))
                :INITFORM NIL)
               (INDICATIONFILTERNAME STRING :CIM-NAME "IndicationFilterName"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An identifier for the indication filter that selects this indication and causes it to be sent. This property is to be filled out by the indication sending service. The value shall be correlatable with the Name property of the instance of CIM_IndicationFilter describing the criteria of the indication. The value of the IndicationFilterName should be formatted using the following algorithm: < OrgID > : < LocalID >, where < OrgID > and < LocalID > are separated by a colon (:) and < OrgID > shall include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the value or that is a registered ID assigned to the business entity by a recognized global authority. In addition, to ensure uniqueness, < OrgID > shall not contain a colon (:).When using this algorithm, the first colon to appear in the value shall appear between < OrgID > and < LocalID >. < LocalID > is chosen by the business entity and shall be used uniquely.")
                 (:MODEL-CORRESPONDENCE ("CIM_IndicationFilter.Name")))
                :INITFORM NIL)
               (SEQUENCECONTEXT STRING :CIM-NAME "SequenceContext" :QUALIFIERS
                ((:DESCRIPTION
                  "The sequence context portion of a sequence identifier for the indication. The sequence number portion of the sequence identifier is provided by the SequenceNumber property. The combination of both property values represents the sequence identifier for the indication.
The sequence identifier for the indication enables a CIM listener to identify duplicate indications when the CIM service attempts the delivery retry of indications, to reorder indications that arrive out-of-order, and to detect lost indications.
If a CIM service does not support sequence identifiers for indications, this property shall be NULL.
If a CIM service supports sequence identifiers for indications, this property shall be maintained by the CIM service for each registered listener destination, and its value shall uniquely identify the CIM service and the indication service within the CIM service such that restarts of the CIM service and deregistration of listener destinations to the CIM service cause the value to change, without reusing earlier values for a sufficiently long time.
When retrying the delivery of an indication, this property shall have the same value as in the original delivery.
To guarantee this uniqueness, the property value should be constructed using the following format (defined in ABNF): sequence-context = indication-service-name \"#\" cim-service-start-id \"#\" listener-destination-creation-time
Where: indication-service-name is the value of the Name property of the CIM_IndicationService instance responsible for delivering the indication. cim-service-start-id is an identifier that uniquely identifies the CIM service start, for example via a timestamp of the start time, or via a counter that increases for each start or restart. listener-destination-creation-time is a timestamp of the creation time of the CIM_ListenerDestination instance representing the listener destination.
Since this format is only a recommendation, CIM clients shall treat the value as an opaque identifier for the sequence context and shall not rely on this format.")
                 (:MODEL-CORRESPONDENCE ("CIM_Indication.SequenceNumber")))
                :INITFORM NIL)
               (SEQUENCENUMBER SINT64 :CIM-NAME "SequenceNumber" :QUALIFIERS
                ((:DESCRIPTION
                  "The sequence number portion of a sequence identifier for the indication. The sequence context portion of the sequence identifier is provided by the SequenceContext property. The combination of both property values represents the sequence identifier for the indication.
The sequence identifier for the indication enables a CIM listener to identify duplicate indications when the CIM service attempts the delivery retry of indications, to reorder indications that arrive out-of-order, and to detect lost indications.
If a CIM service does not support sequence identifiers for indications, this property shall be NULL.
If a CIM service supports sequence identifiers for indications, this property shall be maintained by the CIM service for each registered listener destination, and its value shall uniquely identify the indication within the sequence context provided by SequenceContext. It shall start at 0 whenever the sequence context string changes. Otherwise, it shall be increased by 1 for every new indication to that listener destination, and it shall wrap to 0 when the value range is exceeded.
When retrying the delivery of an indication, this property shall have the same value as in the original delivery.")
                 (:MODEL-CORRESPONDENCE ("CIM_Indication.SequenceContext")))
                :INITFORM NIL)
               (CORRELATEDINDICATIONS (ARRAY STRING) :CIM-NAME
                "CorrelatedIndications" :QUALIFIERS
                ((:DESCRIPTION
                  "A list of IndicationIdentifiers whose notifications are correlated with (related to) this one.")
                 (:MAPPING-STRINGS
                  ("Recommendation.ITU|X733.Correlated notifications"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Indication.IndicationIdentifier")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_InstModification")
              (:QUALIFIERS :INDICATION (:VERSION "2.27.0")
               (:UML-PACKAGE-PATH "CIM::Event")
               (:DESCRIPTION
                "CIM_InstModification notifies when an instance is modified.")))