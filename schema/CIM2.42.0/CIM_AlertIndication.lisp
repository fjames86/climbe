
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_AlertIndication.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ALERTINDICATION (CIM_PROCESSINDICATION)
              ((DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION "A short description of the Indication.")
                 (:MAPPING-STRINGS
                  ("Recommendation.ITU|X733.Additional text")))
                :INITFORM NIL)
               (ALERTINGMANAGEDELEMENT STRING :CIM-NAME
                "AlertingManagedElement" :QUALIFIERS
                ((:DESCRIPTION
                  "The identifying information of the entity (ie, the instance) for which this Indication is generated. The property contains the path of an instance, encoded as a string parameter - if the instance is modeled in the CIM Schema. If not a CIM instance, the property contains some identifying string that names the entity for which the Alert is generated. The path or identifying string is formatted per the AlertingElementFormat property.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AlertIndication.AlertingElementFormat")))
                :INITFORM NIL)
               (ALERTINGELEMENTFORMAT UINT16 :CIM-NAME "AlertingElementFormat"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The format of the AlertingManagedElement property is interpretable based upon the value of this property. Values are defined as: 
0 - Unknown. The format is unknown or not meaningfully interpretable by a CIM client application. 
1 - Other. The format is defined by the value of the OtherAlertingElementFormat property. 
2 - CIMObjectPath. The format is a CIMObjectPath, with format <NamespacePath>:<ClassName>.<Prop1>=\"<Value1>\", <Prop2>=\"<Value2>\", . . . specifying an instance in the CIM Schema.")
                 (:VALUE-MAP ("0" "1" "2"))
                 (:VALUES ("Unknown" "Other" "CIMObjectPath"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AlertIndication.AlertingManagedElement"
                   "CIM_AlertIndication.OtherAlertingElementFormat")))
                :INITFORM "0")
               (OTHERALERTINGELEMENTFORMAT STRING :CIM-NAME
                "OtherAlertingElementFormat" :QUALIFIERS
                ((:DESCRIPTION
                  "A string defining \"Other\" values for AlertingElementFormat. This value MUST be set to a non NULL value when AlertingElementFormat is set to a value of 1 (\"Other\"). For all other values of AlertingElementFormat, the value of this string must be set to NULL.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AlertIndication.AlertingElementFormat")))
                :INITFORM NIL)
               (ALERTTYPE UINT16 :CIM-NAME "AlertType" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "Primary classification of the Indication. The following values are defined: 
1 - Other. The Indication's OtherAlertType property conveys its classification. Use of \"Other\" in an enumeration is a standard CIM convention. It means that the current Indication does not fit into the categories described by this enumeration. 
2 - Communications Alert. An Indication of this type is principally associated with the procedures and/or processes required to convey information from one point to another. 
3 - Quality of Service Alert. An Indication of this type is principally associated with a degradation or errors in the performance or function of an entity. 
4 - Processing Error. An Indication of this type is principally associated with a software or processing fault. 
5 - Device Alert. An Indication of this type is principally associated with an equipment or hardware fault. 
6 - Environmental Alert. An Indication of this type is principally associated with a condition relating to an enclosure in which the hardware resides, or other environmental considerations. 
7 - Model Change. The Indication addresses changes in the Information Model. For example, it may embed a Lifecycle Indication to convey the specific model change being alerted. 
8 - Security Alert. An Indication of this type is associated with security violations, detection of viruses, and similar issues.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" "6" "7" "8"))
                 (:VALUES
                  ("Other" "Communications Alert" "Quality of Service Alert"
                   "Processing Error" "Device Alert" "Environmental Alert"
                   "Model Change" "Security Alert"))
                 (:MAPPING-STRINGS ("Recommendation.ITU|X733.Event type")))
                :INITFORM NIL)
               (OTHERALERTTYPE STRING :CIM-NAME "OtherAlertType" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the Alert type - used when the AlertType property is set to 1, \"Other State Change\".")
                 (:MODEL-CORRESPONDENCE ("CIM_AlertIndication.AlertType")))
                :INITFORM NIL)
               (PERCEIVEDSEVERITY UINT16 :CIM-NAME "PerceivedSeverity"
                :QUALIFIERS
                (:REQUIRED (:OVERRIDE "PerceivedSeverity")
                 (:DESCRIPTION
                  "An enumerated value that describes the severity of the Alert Indication from the notifier's point of view: 
1 - Other, by CIM convention, is used to indicate that the Severity's value can be found in the OtherSeverity property. 
3 - Degraded/Warning should be used when its appropriate to let the user decide if action is needed. 
4 - Minor should be used to indicate action is needed, but the situation is not serious at this time. 
5 - Major should be used to indicate action is needed NOW. 
6 - Critical should be used to indicate action is needed NOW and the scope is broad (perhaps an imminent outage to a critical resource will result). 
7 - Fatal/NonRecoverable should be used to indicate an error occurred, but it's too late to take remedial action. 
2 and 0 - Information and Unknown (respectively) follow common usage. Literally, the AlertIndication is purely informational or its severity is simply unknown.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7"))
                 (:VALUES
                  ("Unknown" "Other" "Information" "Degraded/Warning" "Minor"
                   "Major" "Critical" "Fatal/NonRecoverable"))
                 (:MAPPING-STRINGS
                  ("Recommendation.ITU|X733.Perceived severity")))
                :INITFORM NIL)
               (PROBABLECAUSE UINT16 :CIM-NAME "ProbableCause" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "An enumerated value that describes the probable cause of the situation which resulted in the AlertIndication.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25"
                   "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37"
                   "38" "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "49"
                   "50" "51" "52" "53" "54" "55" "56" "57" "58" "59" "60" "61"
                   "62" "63" "64" "65" "66" "67" "68" "69" "70" "71" "72" "73"
                   "74" "75" "76" "77" "78" "79" "80" "81" "82" "83" "84" "85"
                   "86" "87" "88" "89" "90" "91" "92" "93" "94" "95" "96" "97"
                   "98" "99" "100" "101" "102" "103" "104" "105" "106" "107"
                   "108" "109" "110" "111" "112" "113" "114" "115" "116" "117"
                   "118" "119" "120" "121" "122" "123" "124" "125" "126" "127"
                   "128" "129" "130"))
                 (:VALUES
                  ("Unknown" "Other" "Adapter/Card Error"
                   "Application Subsystem Failure" "Bandwidth Reduced"
                   "Connection Establishment Error"
                   "Communications Protocol Error"
                   "Communications Subsystem Failure"
                   "Configuration/Customization Error" "Congestion"
                   "Corrupt Data" "CPU Cycles Limit Exceeded"
                   "Dataset/Modem Error" "Degraded Signal"
                   "DTE-DCE Interface Error" "Enclosure Door Open"
                   "Equipment Malfunction" "Excessive Vibration"
                   "File Format Error" "Fire Detected" "Flood Detected"
                   "Framing Error" "HVAC Problem" "Humidity Unacceptable"
                   "I/O Device Error" "Input Device Error" "LAN Error"
                   "Non-Toxic Leak Detected" "Local Node Transmission Error"
                   "Loss of Frame" "Loss of Signal" "Material Supply Exhausted"
                   "Multiplexer Problem" "Out of Memory" "Output Device Error"
                   "Performance Degraded" "Power Problem"
                   "Pressure Unacceptable"
                   "Processor Problem (Internal Machine Error)" "Pump Failure"
                   "Queue Size Exceeded" "Receive Failure" "Receiver Failure"
                   "Remote Node Transmission Error"
                   "Resource at or Nearing Capacity" "Response Time Excessive"
                   "Retransmission Rate Excessive" "Software Error"
                   "Software Program Abnormally Terminated"
                   "Software Program Error (Incorrect Results)"
                   "Storage Capacity Problem" "Temperature Unacceptable"
                   "Threshold Crossed" "Timing Problem" "Toxic Leak Detected"
                   "Transmit Failure" "Transmitter Failure"
                   "Underlying Resource Unavailable" "Version MisMatch"
                   "Previous Alert Cleared" "Login Attempts Failed"
                   "Software Virus Detected" "Hardware Security Breached"
                   "Denial of Service Detected" "Security Credential MisMatch"
                   "Unauthorized Access" "Alarm Received" "Loss of Pointer"
                   "Payload Mismatch" "Transmission Error"
                   "Excessive Error Rate" "Trace Problem" "Element Unavailable"
                   "Element Missing" "Loss of Multi Frame"
                   "Broadcast Channel Failure" "Invalid Message Received"
                   "Routing Failure" "Backplane Failure"
                   "Identifier Duplication" "Protection Path Failure"
                   "Sync Loss or Mismatch" "Terminal Problem"
                   "Real Time Clock Failure" "Antenna Failure"
                   "Battery Charging Failure" "Disk Failure"
                   "Frequency Hopping Failure" "Loss of Redundancy"
                   "Power Supply Failure" "Signal Quality Problem"
                   "Battery Discharging" "Battery Failure"
                   "Commercial Power Problem" "Fan Failure" "Engine Failure"
                   "Sensor Failure" "Fuse Failure" "Generator Failure"
                   "Low Battery" "Low Fuel" "Low Water" "Explosive Gas"
                   "High Winds" "Ice Buildup" "Smoke" "Memory Mismatch"
                   "Out of CPU Cycles" "Software Environment Problem"
                   "Software Download Failure" "Element Reinitialized"
                   "Timeout" "Logging Problems" "Leak Detected"
                   "Protection Mechanism Failure" "Protecting Resource Failure"
                   "Database Inconsistency" "Authentication Failure"
                   "Breach of Confidentiality" "Cable Tamper"
                   "Delayed Information" "Duplicate Information"
                   "Information Missing" "Information Modification"
                   "Information Out of Sequence" "Key Expired"
                   "Non-Repudiation Failure" "Out of Hours Activity"
                   "Out of Service" "Procedural Error"
                   "Unexpected Information"))
                 (:MAPPING-STRINGS
                  ("Recommendation.ITU|X733.Probable cause"
                   "Recommendation.ITU|M3100.probableCause"
                   "ITU-IANA-ALARM-TC"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AlertIndication.ProbableCauseDescription"
                   "CIM_AlertIndication.EventID"
                   "CIM_AlertIndication.EventTime")))
                :INITFORM NIL)
               (PROBABLECAUSEDESCRIPTION STRING :CIM-NAME
                "ProbableCauseDescription" :QUALIFIERS
                ((:DESCRIPTION
                  "Provides additional information related to the ProbableCause.")
                 (:MODEL-CORRESPONDENCE ("CIM_AlertIndication.ProbableCause")))
                :INITFORM NIL)
               (TRENDING UINT16 :CIM-NAME "Trending" :QUALIFIERS
                ((:DESCRIPTION
                  "Provides information on trending - trending up, down or no change.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES
                  ("Unknown" "Not Applicable" "Trending Up" "Trending Down"
                   "No Change"))
                 (:MAPPING-STRINGS
                  ("Recommendation.ITU|X733.TrendIndication")))
                :INITFORM NIL)
               (EVENTID STRING :CIM-NAME "EventID" :QUALIFIERS
                ((:DESCRIPTION
                  "An instrumentation or provider specific value that describes the underlying \"real-world\" event represented by the Indication. Two Indications with the same, non NULL EventID value are considered, by the creating entity, to represent the same event. The comparison of two EventID values is only defined for Alert Indications with identical, non NULL values of SystemCreateClassName, SystemName and ProviderName.")
                 (:MODEL-CORRESPONDENCE ("CIM_AlertIndication.ProbableCause")))
                :INITFORM NIL)
               (EVENTTIME DATETIME :CIM-NAME "EventTime" :QUALIFIERS
                ((:DESCRIPTION
                  "The time and date the underlying event was first detected. If specified, this property MUST be set to NULL if the creating entity is not capable of providing this information. This value is based on the notion of local date and time of the Managed System Element generating the Indication.")
                 (:MODEL-CORRESPONDENCE ("CIM_AlertIndication.ProbableCause")))
                :INITFORM NIL)
               (SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                ((:DESCRIPTION
                  "The scoping System's CreationClassName for the Provider generating this Indication.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                ((:DESCRIPTION
                  "The scoping System's Name for the Provider generating this Indication.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (PROVIDERNAME STRING :CIM-NAME "ProviderName" :QUALIFIERS
                ((:DESCRIPTION
                  "The name of the Provider generating this Indication.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (MESSAGE STRING :CIM-NAME "Message" :QUALIFIERS
                ((:DESCRIPTION
                  "The formatted message. This message is constructed by combining some or all of the dynamic elements specified in the MessageArguments property with the static elements uniquely identified by the MessageID in a message registry or other catalog associated with the OwningEntity.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AlertIndication.MessageID"
                   "CIM_AlertIndication.MessageArguments")))
                :INITFORM NIL)
               (MESSAGEID STRING :CIM-NAME "MessageID" :QUALIFIERS
                ((:DESCRIPTION
                  "A string that uniquely identifies, within the scope of the OwningEntity, the format of the Message.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AlertIndication.Message"
                   "CIM_AlertIndication.MessageArguments")))
                :INITFORM NIL)
               (OWNINGENTITY STRING :CIM-NAME "OwningEntity" :QUALIFIERS
                ((:DESCRIPTION
                  "A string that uniquely identifies the entity that owns the definition of the format of the Message described in this instance. OwningEntity MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity or standards body defining the format."))
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
               (RECOMMENDEDACTIONS (ARRAY STRING) :CIM-NAME
                "RecommendedActions" :QUALIFIERS
                ((:DESCRIPTION
                  "Free form descriptions of the recommended actions to take to resolve the cause of the notification.")
                 (:MAPPING-STRINGS
                  ("Recommendation.ITU|X733.Proposed repair actions")))
                :INITFORM NIL)
               (MESSAGEARGUMENTS (ARRAY STRING) :CIM-NAME "MessageArguments"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An array containing the dynamic content of the message.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_AlertIndication.Message"
                   "CIM_AlertIndication.MessageID")))
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
              (:CIM-NAME "CIM_AlertIndication")
              (:QUALIFIERS :INDICATION (:VERSION "2.27.0")
               (:UML-PACKAGE-PATH "CIM::Event")
               (:DESCRIPTION
                "A concrete superclass for CIM Alert notifications. An AlertIndication is a specialized type of CIM_Indication that contains information about the severity, cause, recommended actions and other data of a real world event. This event and its data may or may not be modeled in the CIM class hierarchy.")))