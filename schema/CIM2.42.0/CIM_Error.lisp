
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_Error.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_ERROR NIL
              ((ERRORTYPE UINT16 :CIM-NAME "ErrorType" :QUALIFIERS
                ((:DESCRIPTION
                  "Primary classification of the error. The following values are defined: 
2 - Communications Error. Errors of this type are principally associated with the procedures and/or processes required to convey information from one point to another. 
3 - Quality of Service Error. Errors of this type are principally associated with failures that result in reduced functionality or performance. 
4 - Software Error. Error of this type are principally associated with a software or processing fault. 
5 - Hardware Error. Errors of this type are principally associated with an equipment or hardware failure. 
6 - Environmental Error. Errors of this type are principally associated with a failure condition relating the to facility, or other environmental considerations. 
7 - Security Error. Errors of this type are associated with security violations, detection of viruses, and similar issues. 
8 - Oversubscription Error. Errors of this type are principally associated with the failure to allocate sufficient resources to complete the operation. 
9 - Unavailable Resource Error. Errors of this type are principally associated with the failure to access a required resource. 
10 -Unsupported Operation Error. Errors of this type are principally associated with requests that are not supported.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" ".."))
                 (:VALUES
                  ("Unknown" "Other" "Communications Error"
                   "Quality of Service Error" "Software Error" "Hardware Error"
                   "Environmental Error" "Security Error"
                   "Oversubscription Error" "Unavailable Resource Error"
                   "Unsupported Operation Error" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE ("CIM_Error.OtherErrorType")))
                :INITFORM NIL)
               (OTHERERRORTYPE STRING :CIM-NAME "OtherErrorType" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string describing the ErrorType when 1, \"Other\", is specified as the ErrorType.")
                 (:MODEL-CORRESPONDENCE ("CIM_Error.ErrorType")))
                :INITFORM NIL)
               (OWNINGENTITY STRING :CIM-NAME "OwningEntity" :QUALIFIERS
                ((:DESCRIPTION
                  "A string that uniquely identifies the entity that owns the definition of the format of the Message described in this instance. OwningEntity MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity or standards body defining the format."))
                :INITFORM NIL)
               (MESSAGEID STRING :CIM-NAME "MessageID" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "An opaque string that uniquely identifies, within the scope of the OwningEntity, the format of the Message.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Error.Message" "CIM_Error.MessageArguments")))
                :INITFORM NIL)
               (MESSAGE STRING :CIM-NAME "Message" :QUALIFIERS
                ((:DESCRIPTION
                  "The formatted message. This message is constructed by combining some or all of the dynamic elements specified in the MessageArguments property with the static elements uniquely identified by the MessageID in a message registry or other catalog associated with the OwningEntity.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Error.MessageID" "CIM_Error.MessageArguments")))
                :INITFORM NIL)
               (PERCEIVEDSEVERITY UINT16 :CIM-NAME "PerceivedSeverity"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An enumerated value that describes the severity of the Indication from the notifier's point of view: 
0 - the Perceived Severity of the indication is unknown or indeterminate. 
1 - Other, by CIM convention, is used to indicate that the Severity's value can be found in the OtherSeverity property. 
2 - Information should be used when providing an informative response. 
3 - Degraded/Warning should be used when its appropriate to let the user decide if action is needed. 
4 - Minor should be used to indicate action is needed, but the situation is not serious at this time. 
5 - Major should be used to indicate action is needed NOW. 
6 - Critical should be used to indicate action is needed NOW and the scope is broad (perhaps an imminent outage to a critical resource will result). 
7 - Fatal/NonRecoverable should be used to indicate an error occurred, but it's too late to take remedial action. 
2 and 0 - Information and Unknown (respectively) follow common usage. Literally, the Error is purely informational or its severity is simply unknown.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7" ".."))
                 (:VALUES
                  ("Unknown" "Other" "Information" "Degraded/Warning" "Minor"
                   "Major" "Critical" "Fatal/NonRecoverable" "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("Recommendation.ITU|X733.Perceived severity")))
                :INITFORM NIL)
               (PROBABLECAUSE UINT16 :CIM-NAME "ProbableCause" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumerated value that describes the probable cause of the error.")
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
                   "128" "129" "130" ".."))
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
                   "Underlying Resource Unavailable" "Version Mismatch"
                   "Previous Alert Cleared" "Login Attempts Failed"
                   "Software Virus Detected" "Hardware Security Breached"
                   "Denial of Service Detected" "Security Credential Mismatch"
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
                   "Out of Service" "Procedural Error" "Unexpected Information"
                   "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("Recommendation.ITU|X733.Probable cause"
                   "Recommendation.ITU|M3100.probableCause"
                   "ITU-IANA-ALARM-TC"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Error.ProbableCauseDescription")))
                :INITFORM NIL)
               (PROBABLECAUSEDESCRIPTION STRING :CIM-NAME
                "ProbableCauseDescription" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string describing the probable cause of the error.")
                 (:MODEL-CORRESPONDENCE ("CIM_Error.ProbableCause")))
                :INITFORM NIL)
               (ERRORSOURCE STRING :CIM-NAME "ErrorSource" :QUALIFIERS
                ((:DESCRIPTION
                  "The identifying information of the entity (i.e., the instance) generating the error. If this entity is modeled in the CIM Schema, this property contains the path of the instance encoded as a string parameter. If not modeled, the property contains some identifying string that names the entity that generated the error. The path or identifying string is formatted per the ErrorSourceFormat property.")
                 (:MODEL-CORRESPONDENCE ("CIM_Error.ErrorSourceFormat")))
                :INITFORM NIL)
               (ERRORSOURCEFORMAT UINT16 :CIM-NAME "ErrorSourceFormat"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The format of the ErrorSource property is interpretable based on the value of this property. Values are defined as: 
0 - Unknown. The format is unknown or not meaningfully interpretable by a CIM client application. 
1 - Other. The format is defined by the value of the OtherErrorSourceFormat property.2 - CIMObjectPath. A CIM Object Path as defined in the CIM Infrastructure specification. Note: CIM 2.5 and earlier used the term object names.")
                 (:VALUE-MAP ("0" "1" "2" ".."))
                 (:VALUES ("Unknown" "Other" "CIMObjectPath" "DMTF Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Error.ErrorSource"
                   "CIM_Error.OtherErrorSourceFormat")))
                :INITFORM "0")
               (OTHERERRORSOURCEFORMAT STRING :CIM-NAME
                "OtherErrorSourceFormat" :QUALIFIERS
                ((:DESCRIPTION
                  "A string defining \"Other\" values for ErrorSourceFormat. This value MUST be set to a non NULL value when ErrorSourceFormat is set to a value of 1 (\"Other\"). For all other values of ErrorSourceFormat, the value of this string must be set to NULL.")
                 (:MODEL-CORRESPONDENCE ("CIM_Error.ErrorSourceFormat")))
                :INITFORM NIL)
               (CIMSTATUSCODE UINT32 :CIM-NAME "CIMStatusCode" :QUALIFIERS
                ((:DESCRIPTION
                  "The CIM status code that characterizes this instance. 
This property defines the status codes that MAY be return by a conforming CIM Server or Listener. Note that not all status codes are valid for each operation. The specification for each operation SHOULD define the status codes that may be returned by that operation. 
The following values for CIM status code are defined: 
1 - CIM_ERR_FAILED. A general error occurred that is not covered by a more specific error code. 
2 - CIM_ERR_ACCESS_DENIED. Access to a CIM resource was not available to the client. 
3 - CIM_ERR_INVALID_NAMESPACE. The target namespace does not exist. 
4 - CIM_ERR_INVALID_PARAMETER. One or more parameter values passed to the method were invalid. 
5 - CIM_ERR_INVALID_CLASS. The specified Class does not exist. 
6 - CIM_ERR_NOT_FOUND. The requested object could not be found. 
7 - CIM_ERR_NOT_SUPPORTED. The requested operation is not supported. 
8 - CIM_ERR_CLASS_HAS_CHILDREN. Operation cannot be carried out on this class since it has instances. 
9 - CIM_ERR_CLASS_HAS_INSTANCES. Operation cannot be carried out on this class since it has instances. 
10 - CIM_ERR_INVALID_SUPERCLASS. Operation cannot be carried out since the specified superclass does not exist. 
11 - CIM_ERR_ALREADY_EXISTS. Operation cannot be carried out because an object already exists. 
12 - CIM_ERR_NO_SUCH_PROPERTY. The specified Property does not exist. 
13 - CIM_ERR_TYPE_MISMATCH. The value supplied is incompatible with the type. 
14 - CIM_ERR_QUERY_LANGUAGE_NOT_SUPPORTED. The query language is not recognized or supported. 
15 - CIM_ERR_INVALID_QUERY. The query is not valid for the specified query language. 
16 - CIM_ERR_METHOD_NOT_AVAILABLE. The extrinsic Method could not be executed. 
17 - CIM_ERR_METHOD_NOT_FOUND. The specified extrinsic Method does not exist. 
18 - CIM_ERR_UNEXPECTED_RESPONSE. The returned response to the asynchronous operation was not expected. 
19 - CIM_ERR_INVALID_RESPONSE_DESTINATION. The specified destination for the asynchronous response is not valid. 
20 - CIM_ERR_NAMESPACE_NOT_EMPTY. The specified Namespace is not empty.
21 - CIM_ERR_INVALID_ENUMERATION_CONTEXT. The enumeration context supplied is not valid.
22 - CIM_ERR_INVALID_OPERATION_TIMEOUT. The specified Namespace is not empty.
23 - CIM_ERR_PULL_HAS_BEEN_ABANDONED. The specified Namespace is not empty.
24 - CIM_ERR_PULL_CANNOT_BE_ABANDONED. The attempt to abandon a pull operation has failed.
25 - CIM_ERR_FILTERED_ENUMERATION_NOT_SUPPORTED. Filtered Enumeratrions are not supported.
26 - CIM_ERR_CONTINUATION_ON_ERROR_NOT_SUPPORTED. Continue on error is not supported.
27 - CIM_ERR_SERVER_LIMITS_EXCEEDED. The WBEM Server limits have been exceeded (e.g. memory, connections, ...).
28 - CIM_ERR_SERVER_IS_SHUTTING_DOWN. The WBEM Server is shutting down.
29 - CIM_ERR_QUERY_FEATURE_NOT_SUPPORTED. The specified Query Feature is not supported.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26"
                   "27" "28" "29" ".."))
                 (:VALUES
                  ("CIM_ERR_FAILED" "CIM_ERR_ACCESS_DENIED"
                   "CIM_ERR_INVALID_NAMESPACE" "CIM_ERR_INVALID_PARAMETER"
                   "CIM_ERR_INVALID_CLASS" "CIM_ERR_NOT_FOUND"
                   "CIM_ERR_NOT_SUPPORTED" "CIM_ERR_CLASS_HAS_CHILDREN"
                   "CIM_ERR_CLASS_HAS_INSTANCES" "CIM_ERR_INVALID_SUPERCLASS"
                   "CIM_ERR_ALREADY_EXISTS" "CIM_ERR_NO_SUCH_PROPERTY"
                   "CIM_ERR_TYPE_MISMATCH"
                   "CIM_ERR_QUERY_LANGUAGE_NOT_SUPPORTED"
                   "CIM_ERR_INVALID_QUERY" "CIM_ERR_METHOD_NOT_AVAILABLE"
                   "CIM_ERR_METHOD_NOT_FOUND" "CIM_ERR_UNEXPECTED_RESPONSE"
                   "CIM_ERR_INVALID_RESPONSE_DESTINATION"
                   "CIM_ERR_NAMESPACE_NOT_EMPTY"
                   "CIM_ERR_INVALID_ENUMERATION_CONTEXT"
                   "CIM_ERR_INVALID_OPERATION_TIMEOUT"
                   "CIM_ERR_PULL_HAS_BEEN_ABANDONED"
                   "CIM_ERR_PULL_CANNOT_BE_ABANDONED"
                   "CIM_ERR_FILTERED_ENUMERATION_NOT_SUPPORTED"
                   "CIM_ERR_CONTINUATION_ON_ERROR_NOT_SUPPORTED"
                   "CIM_ERR_SERVER_LIMITS_EXCEEDED"
                   "CIM_ERR_SERVER_IS_SHUTTING_DOWN"
                   "CIM_ERR_QUERY_FEATURE_NOT_SUPPORTED" "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("DSP0201.DMTF|ERROR.CODE|2.3" "DSP0200.DMTF|CIMError|1.3"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Error.CIMStatusCodeDescription")))
                :INITFORM NIL)
               (CIMSTATUSCODEDESCRIPTION STRING :CIM-NAME
                "CIMStatusCodeDescription" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string containing a human-readable description of CIMStatusCode. This description MAY extend, but MUST be consistent with, the definition of CIMStatusCode.")
                 (:MAPPING-STRINGS
                  ("DSP0201.DMTF|ERROR.DESCRIPTION|2.3"
                   "DSP0200.DMTF|CIMError|1.3"))
                 (:MODEL-CORRESPONDENCE ("CIM_Error.CIMStatusCode")))
                :INITFORM NIL)
               (MESSAGEARGUMENTS (ARRAY STRING) :CIM-NAME "MessageArguments"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An array containing the dynamic content of the message.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Error.MessageID" "CIM_Error.Message")))
                :INITFORM NIL)
               (RECOMMENDEDACTIONS (ARRAY STRING) :CIM-NAME
                "RecommendedActions" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string describing recommended actions to take to resolve the error."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_Error")
              (:QUALIFIERS :INDICATION (:VERSION "2.22.1") :EXCEPTION
               (:UML-PACKAGE-PATH "CIM::Interop")
               (:DESCRIPTION
                "CIM_Error is a specialized class that contains information about the severity, cause, recommended actions and other data related to the failure of a CIM Operation. Instances of this type MAY be included as part of the response to a CIM Operation.")))