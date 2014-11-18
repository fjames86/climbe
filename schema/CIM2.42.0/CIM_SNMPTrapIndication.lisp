
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_SNMPTrapIndication.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_SNMPTRAPINDICATION (CIM_PROCESSINDICATION)
              ((ENTERPRISE STRING :CIM-NAME "Enterprise" :QUALIFIERS
                ((:DESCRIPTION "Type of object generating the trap.")
                 (:MAPPING-STRINGS ("PDU.IETF|RFC1157-TRAP-PDU.enterprise")))
                :INITFORM NIL)
               (AGENTADDRESS STRING :CIM-NAME "AgentAddress" :QUALIFIERS
                ((:DESCRIPTION "Address of the object generating the trap.")
                 (:MAPPING-STRINGS ("PDU.IETF|RFC1157-TRAP-PDU.agent-addr")))
                :INITFORM NIL)
               (GENERICTRAP UINT16 :CIM-NAME "GenericTrap" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumerated value that describes the generic trap type: 
- The coldStart(0) trap signifies that the sending protocol entity is reinitializing itself such that the agent's configuration or the protocol entity implementation may be altered. 
- The warmStart(1) trap signifies that the sending protocol entity is reinitializing itself such that neither the agent configuration nor the protocol entity implementation is altered. 
- The linkDown(2) trap signifies that the sending protocol recognizes a failure in one of the communication links represented in the agent's configuration. The Trap-PDU of type linkDown contains as the first element of its variable-bindings the name and value of the ifIndex instance for the affected interface. 
- The linkUp(3) trap signifies that the sending protocol entity recognizes that one of the communication links represented in the agent's configuration has come up. The Trap-PDU of type linkUp contains as the first element of its variable-bindings, the name and value of the ifIndex instance for the affected interface. 
- An authenticationFailure(4) trap signifies that the sending protocol entity is the adressee of a protocol message that was not properly authenticated. While implementations of SNMP must be capable of generating this trap, they must also be capable of suppressing the emission of such traps via an implementation- specific mechanism. 
- An egpNeighborLoss(5) trap signifies that an EGP neighbor for whom the sending protocol entity was an EGP peer has been marked as down and the peer relationship no longer pertains. The Trap-PDU of type egpNeighborLoss contains as the first element of its variable-bindings, the name and value of the egpNeighAddr instance for the affected neighbor. 
- An enterpriseSpecific(6) trap signifies that the sending protocol entity recognizes that some enterprise-specific event has occurred. The specific-trap field identifies the particular trap which occurred.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6"))
                 (:VALUES
                  ("Cold Start" "Warm Start" "Link Down" "Link Up"
                   "Authentication Failure" "EGP Neighbor Loss"
                   "Enterprise Specific"))
                 (:MAPPING-STRINGS ("PDU.IETF|RFC1157-TRAP-PDU.generic-trap")))
                :INITFORM NIL)
               (SPECIFICTRAP UINT32 :CIM-NAME "SpecificTrap" :QUALIFIERS
                ((:DESCRIPTION "Specific trap code.")
                 (:MAPPING-STRINGS
                  ("PDU.IETF|RFC1157-TRAP-PDU.specific-trap")))
                :INITFORM NIL)
               (TIMESTAMP DATETIME :CIM-NAME "TimeStamp" :QUALIFIERS
                ((:DESCRIPTION
                  "Time elapsed between the last (re)intialization of the managed entity and the generation of the trap.")
                 (:MAPPING-STRINGS ("PDU.IETF|RFC1157-TRAP-PDU.time-stamp")))
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
               (VARBINDNAMES (ARRAY STRING) :CIM-NAME "VarBindNames"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Object naming information (an OID) from the 'variable binding' portion of the Trap. This array is correlated with the VarBindSyntaxes and VarBindValues arrays. Each entry is related to the entries in the other arrays, that are located at the same index. In this way, the variable binding's name/syntax/value tuple can be constructed.")
                 (:ARRAYTYPE "Indexed")
                 (:MAPPING-STRINGS
                  ("PDU.IETF|RFC1157-TRAP-PDU.variable-bindings"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SNMPTrapIndication.VarBindSyntaxes"
                   "CIM_SNMPTrapIndication.VarBindValues")))
                :INITFORM NIL)
               (VARBINDSYNTAXES (ARRAY UINT16) :CIM-NAME "VarBindSyntaxes"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Object syntax information (defined as an enumerated value) from the 'variable binding' portion of the Trap. This array is correlated with the VarBindNames and VarBindValues arrays. Each entry is related to the entries in the other arrays, that are located at the same index. In this way, the variable binding's name/syntax/value tuple can be constructed.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" "6" "7" "8"))
                 (:VALUES
                  ("Integer" "OctetString" "ObjectIdentifier" "NetworkAddress"
                   "Counter" "Gauge" "TimeTicks" "Opaque"))
                 (:ARRAYTYPE "Indexed")
                 (:MAPPING-STRINGS
                  ("PDU.IETF|RFC1157-TRAP-PDU.variable-bindings"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SNMPTrapIndication.VarBindNames"
                   "CIM_SNMPTrapIndication.VarBindValues")))
                :INITFORM NIL)
               (VARBINDVALUES (ARRAY STRING) :CIM-NAME "VarBindValues"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An OctetString representing object value information from the 'variable binding' portion of the Trap. This array is correlated with the VarBindNames and VarBindSyntaxes arrays. Each entry is related to the entries in the other arrays, that are located at the same index. In this way, the variable binding's name/syntax/value tuple can be constructed.")
                 :OCTET-STRING (:ARRAYTYPE "Indexed")
                 (:MAPPING-STRINGS
                  ("PDU.IETF|RFC1157-TRAP-PDU.variable-bindings"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_SNMPTrapIndication.VarBindNames"
                   "CIM_SNMPTrapIndication.VarBindSyntaxes")))
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
              (:CIM-NAME "CIM_SNMPTrapIndication")
              (:QUALIFIERS :INDICATION (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Event")
               (:DESCRIPTION
                "A concrete class for mapping an SNMP Trap to CIM based on the IETF RFC 1157. The usefulness of this class is to describe common trap semantics. But, a complete understanding of any trap data received relies on the Indicaton recipient having access to the sender's MIB. Understanding can be improved by mapping the SNMP domain to CIM, and using CIM LifeCycle and standard subclasses of CIM_ProcessIndication.")))