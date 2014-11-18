
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_FCPortStatistics.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_FCPORTSTATISTICS (CIM_NETWORKPORTSTATISTICS)
              ((LIPCOUNT UINT64 :CIM-NAME "LIPCount" :QUALIFIERS
                ((:DESCRIPTION
                  "LIPCount is the number of LIP events that have occurred on an arbitrated loop.")
                 :COUNTER)
                :INITFORM NIL)
               (NOSCOUNT UINT64 :CIM-NAME "NOSCount" :QUALIFIERS
                ((:DESCRIPTION
                  "NOSCount is the number of NOS events that have occurred on the switched fabric.")
                 :COUNTER)
                :INITFORM NIL)
               (ERRORFRAMES UINT64 :CIM-NAME "ErrorFrames" :QUALIFIERS
                ((:DESCRIPTION
                  "ErrorFrames is the number of frames that have been received in error.")
                 :COUNTER)
                :INITFORM NIL)
               (DUMPEDFRAMES UINT64 :CIM-NAME "DumpedFrames" :QUALIFIERS
                ((:DESCRIPTION
                  "DumpedFrames is the number of frames that were lost due to a lack of host buffers available.")
                 :COUNTER)
                :INITFORM NIL)
               (LINKFAILURES UINT64 :CIM-NAME "LinkFailures" :QUALIFIERS
                ((:DESCRIPTION
                  "LinkFailure is the number of times that a link error has occurred. This count is part of the Link Error Status Block (LESB).")
                 :COUNTER)
                :INITFORM NIL)
               (LOSSOFSIGNALCOUNTER UINT64 :CIM-NAME "LossOfSignalCounter"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Number of times the signal is lost on the Port since the last reset of the Device. This count is part of the Link Error Status Block (LESB).")
                 :COUNTER)
                :INITFORM NIL)
               (LOSSOFSYNCCOUNTER UINT64 :CIM-NAME "LossOfSyncCounter"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Number of times that synchronization is lost on the Port since the last reset of the Device. Synchronization is assumed lost after a timeout period (identified by the Receiver TransmitterTimeout property) is exceeded. This count is part of the Link Error Status Block (LESB).")
                 :COUNTER)
                :INITFORM NIL)
               (PRIMITIVESEQPROTOCOLERRCOUNT UINT64 :CIM-NAME
                "PrimitiveSeqProtocolErrCount" :QUALIFIERS
                ((:DESCRIPTION
                  "Count of primitive sequence protocol errors that are detected at this port. This count is part of the Link Error Status Block (LESB).")
                 :COUNTER)
                :INITFORM NIL)
               (CRCERRORS UINT64 :CIM-NAME "CRCErrors" :QUALIFIERS
                ((:DESCRIPTION
                  "Number of times that the CRC in a frame does not match the CRC that is computed by the receiver. This count is part of the Link Error Status Block (LESB).")
                 :COUNTER)
                :INITFORM NIL)
               (INVALIDTRANSMISSIONWORDS UINT64 :CIM-NAME
                "InvalidTransmissionWords" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of transmission words that had an invalid character (8b10b code violation) in one or more of its characters, had a K28.5 (8b10b control) in its second, third, or fourth character position, or had an incorrect Beginning Running Disparity. This count is part of the Link Error Status Block (LESB).")
                 :COUNTER)
                :INITFORM NIL)
               (FRAMESTOOSHORT UINT64 :CIM-NAME "FramesTooShort" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of frames received that were shorter than 28 octets. The value of 28 is calculated based on an assumption of 24 header bytes plus 4 CRC bytes. The count does not include SOF/EOF bytes, which are not data.")
                 :COUNTER)
                :INITFORM NIL)
               (FRAMESTOOLONG UINT64 :CIM-NAME "FramesTooLong" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of frames received that were longer than 2140 octets. The value of 2140 is calculated based on an assumption of 24 header bytes plus 4 CRC bytes and 2112 bytes of payload.")
                 :COUNTER)
                :INITFORM NIL)
               (ADDRESSERRORS UINT64 :CIM-NAME "AddressErrors" :QUALIFIERS
                ((:DESCRIPTION
                  "Count of frames received with unknown addressing. An example is an unknown SID or DID. The SID or DID is not known to the routing algorithm.")
                 :COUNTER)
                :INITFORM NIL)
               (BUFFERCREDITNOTPROVIDED UINT64 :CIM-NAME
                "BufferCreditNotProvided" :QUALIFIERS
                ((:DESCRIPTION
                  "Count of occurrences when all input buffers of a port were full and outbound buffer-to-buffer credit was transitioned to zero. There is no credit to provide to the other side.")
                 :COUNTER)
                :INITFORM NIL)
               (BUFFERCREDITNOTRECEIVED UINT64 :CIM-NAME
                "BufferCreditNotReceived" :QUALIFIERS
                ((:DESCRIPTION
                  "Count of transitions in or out of BBcredit zero state. The other side is not providing any credit.")
                 :COUNTER)
                :INITFORM NIL)
               (DELIMITERERRORS UINT64 :CIM-NAME "DelimiterErrors" :QUALIFIERS
                ((:DESCRIPTION
                  "Count of invalid frame delimiters that are received at this port. An example is a frame with a class 2 start and a class 3 at the end.")
                 :COUNTER)
                :INITFORM NIL)
               (ENCODINGDISPARITYERRORS UINT64 :CIM-NAME
                "EncodingDisparityErrors" :QUALIFIERS
                ((:DESCRIPTION
                  "Count of disparity errors that are received at this port.")
                 :COUNTER)
                :INITFORM NIL)
               (LINKRESETSRECEIVED UINT64 :CIM-NAME "LinkResetsReceived"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Count of Link resets. This count is the number of LRs received.")
                 :COUNTER)
                :INITFORM NIL)
               (LINKRESETSTRANSMITTED UINT64 :CIM-NAME "LinkResetsTransmitted"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Count of Link resets. This count is the number of LRs transmitted.")
                 :COUNTER)
                :INITFORM NIL)
               (MULTICASTFRAMESRECEIVED UINT64 :CIM-NAME
                "MulticastFramesReceived" :QUALIFIERS
                ((:DESCRIPTION
                  "Count of Multicast Frames or Packets received.")
                 :COUNTER)
                :INITFORM NIL)
               (MULTICASTFRAMESTRANSMITTED UINT64 :CIM-NAME
                "MulticastFramesTransmitted" :QUALIFIERS
                ((:DESCRIPTION
                  "Count of Multicast Frames or Packets transmitted.")
                 :COUNTER)
                :INITFORM NIL)
               (FBSYFRAMES UINT64 :CIM-NAME "FBSYFrames" :QUALIFIERS
                ((:DESCRIPTION
                  "FBSYFrames is the number of times that FBSY was returned to the port.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|ErrorCounters|1.SWAPI_STATS_LBL_FBSY")))
                :INITFORM NIL)
               (PBSYFRAMES UINT64 :CIM-NAME "PBSYFrames" :QUALIFIERS
                ((:DESCRIPTION
                  "PBSYFrames is the number of times that PBSY was returned to the port.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|ErrorCounters|1.SWAPI_STATS_LBL_PBSY")))
                :INITFORM NIL)
               (FRJTFRAMES UINT64 :CIM-NAME "FRJTFrames" :QUALIFIERS
                ((:DESCRIPTION
                  "FRJTFrames is the number of times that FRJT was returned to the port.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|ErrorCounters|1.SWAPI_STATS_LBL_FRJT")))
                :INITFORM NIL)
               (PRJTFRAMES UINT64 :CIM-NAME "PRJTFrames" :QUALIFIERS
                ((:DESCRIPTION
                  "PRJTFrames is the number of times that PRJT was returned to the port.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|ErrorCounters|1.SWAPI_STATS_LBL_PRJT")))
                :INITFORM NIL)
               (RXCLASS1FRAMES UINT64 :CIM-NAME "RXClass1Frames" :QUALIFIERS
                ((:DESCRIPTION
                  "RXClass1Frames is the number of class 1 frames received.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|PerformanceCounters|1.SWAPI_STATS_LBL_C1RF")))
                :INITFORM NIL)
               (TXCLASS1FRAMES UINT64 :CIM-NAME "TXClass1Frames" :QUALIFIERS
                ((:DESCRIPTION
                  "TXClass1Frames is the number of class 1 frames transmitted.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|PerformanceCounters|1.SWAPI_STATS_LBL_C1TF")))
                :INITFORM NIL)
               (CLASS1FBSY UINT64 :CIM-NAME "Class1FBSY" :QUALIFIERS
                ((:DESCRIPTION
                  "Class1FBSY is the number of times that FBSY was returned to the port.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|PerformanceCounters|1.SWAPI_STATS_LBL_C1FB")))
                :INITFORM NIL)
               (CLASS1PBSY UINT64 :CIM-NAME "Class1PBSY" :QUALIFIERS
                ((:DESCRIPTION
                  "Class1PBSY is the number of times that PBSY was returned to the port.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|PerformanceCounters|1.SWAPI_STATS_LBL_C1PB")))
                :INITFORM NIL)
               (CLASS1FRJT UINT64 :CIM-NAME "Class1FRJT" :QUALIFIERS
                ((:DESCRIPTION
                  "Class1FRJT is the number of times that FRJT was returned to the port.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|PerformanceCounters|1.SWAPI_STATS_LBL_C1FR")))
                :INITFORM NIL)
               (CLASS1PRJT UINT64 :CIM-NAME "Class1PRJT" :QUALIFIERS
                ((:DESCRIPTION
                  "Class1PRJT is the number of times that PRJT was returned to the port.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|PerformanceCounters|1.SWAPI_STATS_LBL_C1PR")))
                :INITFORM NIL)
               (RXCLASS2FRAMES UINT64 :CIM-NAME "RXClass2Frames" :QUALIFIERS
                ((:DESCRIPTION
                  "RXClass2Frames is the number of class 2 frames received.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|PerformanceCounters|1.SWAPI_STATS_LBL_C2RF")))
                :INITFORM NIL)
               (TXCLASS2FRAMES UINT64 :CIM-NAME "TXClass2Frames" :QUALIFIERS
                ((:DESCRIPTION
                  "TXClass2Frames is the number of class 2 frames transmitted.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|PerformanceCounters|1.SWAPI_STATS_LBL_C2LF")))
                :INITFORM NIL)
               (CLASS2FBSY UINT64 :CIM-NAME "Class2FBSY" :QUALIFIERS
                ((:DESCRIPTION
                  "Class2FBSY is the number of times that FBSY was returned to the port.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|PerformanceCounters|1.SWAPI_STATS_LBL_C2FB")))
                :INITFORM NIL)
               (CLASS2PBSY UINT64 :CIM-NAME "Class2PBSY" :QUALIFIERS
                ((:DESCRIPTION
                  "Class2PBSY is the number of times that PBSY was returned to the port.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|PerformanceCounters|1.SWAPI_STATS_LBL_C2PB")))
                :INITFORM NIL)
               (CLASS2FRJT UINT64 :CIM-NAME "Class2FRJT" :QUALIFIERS
                ((:DESCRIPTION
                  "Class2FRJT is the number of times that FRJT was returned to the port.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|PerformanceCounters|1.SWAPI_STATS_LBL_C2FR")))
                :INITFORM NIL)
               (CLASS2PRJT UINT64 :CIM-NAME "Class2PRJT" :QUALIFIERS
                ((:DESCRIPTION
                  "Class2PRJT is the number of times that PRJT was returned to the port.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|PerformanceCounters|1.SWAPI_STATS_LBL_C2PR")))
                :INITFORM NIL)
               (RXCLASS3FRAMES UINT64 :CIM-NAME "RXClass3Frames" :QUALIFIERS
                ((:DESCRIPTION
                  "RXClass3Frames is the number of class 3 frames received.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|PerformanceCounters|1.SWAPI_STATS_LBL_C3RF")))
                :INITFORM NIL)
               (TXCLASS3FRAMES UINT64 :CIM-NAME "TXClass3Frames" :QUALIFIERS
                ((:DESCRIPTION
                  "TXClass3Frames is the number of class 3 frames transmitted.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|PerformanceCounters|1.SWAPI_STATS_LBL_C3TF")))
                :INITFORM NIL)
               (CLASS3FRAMESDISCARDED UINT64 :CIM-NAME "Class3FramesDiscarded"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Class3FramesDiscarded is the number of class 3 frames that were discarded upon reception.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|PerformanceCounters|1.SWAPI_STATS_LBL_C3DC")))
                :INITFORM NIL)
               (RXBROADCASTFRAMES UINT64 :CIM-NAME "RXBroadcastFrames"
                :QUALIFIERS
                ((:DESCRIPTION
                  "RXBroadcastFrames is the number of broadcast frames or packets received.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|PerformanceCounters|1.SWAPI_STATS_LBL_RBCO")))
                :INITFORM NIL)
               (TXBROADCASTFRAMES UINT64 :CIM-NAME "TXBroadcastFrames"
                :QUALIFIERS
                ((:DESCRIPTION
                  "TXBroadcastFrames is the number of broadcast frames or packets transmitted.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("FC-SWAPI.T11|PerformanceCounters|1.SWAPI_STATS_LBL_TBCO")))
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
              (:CIM-NAME "CIM_FCPortStatistics")
              (:QUALIFIERS (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::FC")
               (:DESCRIPTION
                "FCPortStatistics is the statistics for the FCPort.")))
(DEFCIM-METHOD RESETSELECTEDSTATS
    ((INSTANCE CIM_FCPORTSTATISTICS)
     (SELECTEDSTATISTICS (ARRAY STRING) "SelectedStatistics" :IN
      (:DESCRIPTION "Array of strings indicating which statistics to reset.")))
    ((:CIM-NAME "ResetSelectedStats")
     (:QUALIFIERS
      (:DESCRIPTION
       "Method to reset one or more of the instance's statistics. The method takes one parameter as input - an array of strings indicating which statistics to reset. If all the statistics in the instance should be reset, the first element of the array MUST be set to \"All\" or \"ALL\". If one or more individual statistics should be reset, the corresponding property names are entered into the elements of the array. 
The method returns 0 if successful, 1 if not supported, and any other value if an error occurred. A method is specified so that the StatisticalInformation's provider/ instrumentation, which calculates the statistics, can reset its internal processing, counters, etc. 
In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))