
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_TokenRingPortStatistics.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_TOKENRINGPORTSTATISTICS (CIM_NETWORKPORTSTATISTICS)
              ((BURSTERRORS UINT32 :CIM-NAME "BurstErrors" :QUALIFIERS
                ((:DESCRIPTION
                  "This counter is incremented when a station detects the absence of transitions for five half-bit timers (burst-five errors).")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.5 Token Ring MIB.dot5StatsBurstErrors")))
                :INITFORM NIL)
               (ACERRORS UINT32 :CIM-NAME "ACErrors" :QUALIFIERS
                ((:DESCRIPTION
                  "This counter is incremented when a station receives an AMP or SMP frame in which A is equal to C and C is equal to 0, and then receives another SMP frame with A equal to C and C equal to 0 without first receiving an AMP frame. This condition indicates a station that cannot set the AC bits properly.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.5 Token Ring MIB.dot5StatsACErrors")))
                :INITFORM NIL)
               (ABORTTRANSERRORS UINT32 :CIM-NAME "AbortTransErrors"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This counter is incremented when a station transmits an abort delimiter while transmitting data.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.5 Token Ring MIB.dot5StatsAbortTransErrors")))
                :INITFORM NIL)
               (INTERNALERRORS UINT32 :CIM-NAME "InternalErrors" :QUALIFIERS
                ((:DESCRIPTION
                  "This counter is incremented when a station recognizes an internal error.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.5 Token Ring MIB.dot5StatsInternalErrors")))
                :INITFORM NIL)
               (LOSTFRAMEERRORS UINT32 :CIM-NAME "LostFrameErrors" :QUALIFIERS
                ((:DESCRIPTION
                  "This counter is incremented when a station is transmitting and its TRR timer expires. This condition indicates where a transmitting station in strip mode does not receive the trailer of the frame before the TRR timer goes off.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.5 Token Ring MIB.dot5StatsLostFrameErrors")))
                :INITFORM NIL)
               (RECEIVECONGESTIONS UINT32 :CIM-NAME "ReceiveCongestions"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This counter is incremented when a station recognizes a frame addressed to its specific address but has no available buffer space, which indicates that the station is congested.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.5 Token Ring MIB.dot5StatsReceiveCongestions")))
                :INITFORM NIL)
               (FRAMECOPIEDERRORS UINT32 :CIM-NAME "FrameCopiedErrors"
                :QUALIFIERS
                ((:DESCRIPTION
                  "This counter is incremented when a station recognizes a frame addressed to its specific address and detects that the FS field A bits are set to 1, which indicates a possible line hit or duplicate address.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.5 Token Ring MIB.dot5StatsFrameCopiedErrors")))
                :INITFORM NIL)
               (TOKENERRORS UINT32 :CIM-NAME "TokenErrors" :QUALIFIERS
                ((:DESCRIPTION
                  "This counter is incremented when a station acting as the active monitor recognizes an error condition that needs a token transmitted.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.5 Token Ring MIB.dot5StatsTokenErrors")))
                :INITFORM NIL)
               (SOFTERRORS UINT32 :CIM-NAME "SoftErrors" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of Soft Errors that the Device has detected. This condition directly corresponds to the number of Report Error MAC frames that this Device has transmitted. Soft Errors are those which are recoverable by the MAC layer protocols.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.5 Token Ring MIB.dot5StatsSoftErrors")))
                :INITFORM NIL)
               (HARDERRORS UINT32 :CIM-NAME "HardErrors" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of times this Device has detected an immediately recoverable fatal error. The number of times this Device is either transmitting or receiving beacon MAC frames.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.5 Token Ring MIB.dot5StatsHardErrors")))
                :INITFORM NIL)
               (SIGNALLOSSCOUNT UINT32 :CIM-NAME "SignalLossCount" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of times this Device has detected the loss of a signal condition from the ring.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.5 Token Ring MIB.dot5StatsSignalLoss")))
                :INITFORM NIL)
               (TRANSMITTEDBEACONS UINT32 :CIM-NAME "TransmittedBeacons"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The number of times this Device has transmitted a beacon frame.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.5 Token Ring MIB.dot5StatsTransmitBeacons")))
                :INITFORM NIL)
               (RECOVERYS UINT32 :CIM-NAME "Recoverys" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of Claim Token MAC frames that are received or transmitted after the Device has received a Ring Purge MAC frame. This counter signifies the number of times that the ring has been purged and is being recovered back into a normal operating state.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.5 Token Ring MIB.dot5StatsRecoverys")))
                :INITFORM NIL)
               (LOBEWIRES UINT32 :CIM-NAME "LobeWires" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of times that the Device has detected an open or short circuit in the lobe data path. The port will be closed and RingState will signify this condition.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.5 Token Ring MIB.dot5StatsLobeWires")))
                :INITFORM NIL)
               (REMOVES UINT32 :CIM-NAME "Removes" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of times that the Device has received a Remove Ring Station MAC frame request. When this frame is received, the Device will enter the close state and RingState will signify this condition.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.5 Token Ring MIB.dot5StatsRemoves")))
                :INITFORM NIL)
               (SINGLES UINT32 :CIM-NAME "Singles" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of times that the Device has sensed that it is the only station on the ring. This condition occurs if the Device is the first one up on a ring or if there is a hardware problem.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.5 Token Ring MIB.dot5StatsSingles")))
                :INITFORM NIL)
               (FREQUENCYERRORS UINT32 :CIM-NAME "FrequencyErrors" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of times that the Device has detected that the frequency of the incoming signal differs from the expected frequency by more than that specified by the IEEE 802.5 standard.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|IEEE 802.5 Token Ring MIB.dot5StatsFreqErrors")))
                :INITFORM NIL)
               (BYTESTRANSMITTED UINT64 :CIM-NAME "BytesTransmitted"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of bytes that are transmitted, including framing characters.")
                 (NIL "Bytes") :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|MIB-II.ifOutOctets"
                   "MIF.DMTF|Network Adapter 802 Port|001.7"))
                 (:P-UNIT "byte"))
                :INITFORM NIL)
               (BYTESRECEIVED UINT64 :CIM-NAME "BytesReceived" :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of bytes that are received, including framing characters.")
                 (NIL "Bytes") :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|MIB-II.ifInOctets"
                   "MIF.DMTF|Network Adapter 802 Port|001.9"))
                 (:P-UNIT "byte"))
                :INITFORM NIL)
               (PACKETSTRANSMITTED UINT64 :CIM-NAME "PacketsTransmitted"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of packets that are transmitted.")
                 :COUNTER)
                :INITFORM NIL)
               (PACKETSRECEIVED UINT64 :CIM-NAME "PacketsReceived" :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of packets that are received.")
                 :COUNTER)
                :INITFORM NIL)
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "The user friendly name for this instance of StatisticalData. In addition, the user friendly name can be used as a index property for a search of query. (Note: Name does not have to be unique within a namespace.)"))
                :INITFORM NIL)
               (STARTSTATISTICTIME DATETIME :CIM-NAME "StartStatisticTime"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The time, relative to managed element where the statistic was collected, when the first measurement was taken. If the statistic is reset, the StartStatisticTime is the time when the reset was performed."))
                :INITFORM NIL)
               (STATISTICTIME DATETIME :CIM-NAME "StatisticTime" :QUALIFIERS
                ((:DESCRIPTION
                  "The time the most recent measurement was taken, relative to the managed element where the statistic was collected."))
                :INITFORM NIL)
               (SAMPLEINTERVAL DATETIME :CIM-NAME "SampleInterval" :QUALIFIERS
                ((:DESCRIPTION
                  "Some statistics are sampled at consistent time intervals. This property provides the sample interval so that client applications can determine the minimum time that new statistics should be pulled. If the statistics are not sampled at consistent time intervals, this property must be set to a zero time interval."))
                :INITFORM "00000000000000.000000:000")
               (CAPTION STRING :CIM-NAME "Caption" :QUALIFIERS
                ((:DESCRIPTION
                  "The Caption property is a short textual description (one- line string) of the object.")
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION
                  "The Description property provides a textual description of the object."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_TokenRingPortStatistics")
              (:QUALIFIERS (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::Ports")
               (:DESCRIPTION
                "The TokenRingPortStatistics class describes the statistics for the TokenRingPort.")))
(DEFCIM-METHOD RESETSELECTEDSTATS
    ((INSTANCE CIM_TOKENRINGPORTSTATISTICS)
     (SELECTEDSTATISTICS (ARRAY STRING) "SelectedStatistics" :IN
      (:DESCRIPTION "Array of strings indicating which statistics to reset.")))
    ((:CIM-NAME "ResetSelectedStats")
     (:QUALIFIERS
      (:DESCRIPTION
       "Method to reset one or more of the instance's statistics. The method takes one parameter as input - an array of strings indicating which statistics to reset. If all the statistics in the instance should be reset, the first element of the array MUST be set to \"All\" or \"ALL\". If one or more individual statistics should be reset, the corresponding property names are entered into the elements of the array. 
The method returns 0 if successful, 1 if not supported, and any other value if an error occurred. A method is specified so that the StatisticalInformation's provider/ instrumentation, which calculates the statistics, can reset its internal processing, counters, etc. 
In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))