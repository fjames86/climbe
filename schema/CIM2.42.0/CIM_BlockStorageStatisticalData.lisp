
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BlockStorageStatisticalData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BLOCKSTORAGESTATISTICALDATA (CIM_STATISTICALDATA)
              ((ELEMENTTYPE UINT16 :CIM-NAME "ElementType" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "Defines the role that the element played for which this statistics record was collected. If the metered element is a system or a component of a system associated to a RegisteredProfile, then that profile may provide a more specialized definition and additional usage information for this property. 
Generally, the ElementTypes defined here have the following meaning in the context of this class: 2, \"Computer System\": Cumulative statistics for the storage system. In the case of a complex system with multiple component Computer Systems, these are the statistics for the top-level aggregate Computer System. 3, \"Front-end Computer System\": Statistics for a component computer system that communicate with systems that initiate IO requests. 4, \"Peer Computer System\": Statistics for a component computer system that communicates with peer storage systems e.g. to provide remote mirroring of a volume. 5, \"Back-end Computer System\": Statistics for a component computer system that communicates with back-end storage. 6, \"Front-end Port\": Statistics for a port that communicates with systems that initiate IO requests. 7, \"Back-end Port\": Statistics for a port that initiates IO requests to storage devices. 8, \"Volume\": Statistics for an exposable storage extent, such as a StorageVolume or LogicalDisk. 9, \"Extent\": Statistics for an intermediate storage extent, i.e. an extent that is neither a volume or a disk. 10, \"Disk Drive: Statistics for a StorageExtent that is associated to a DiskDrive through the MediaPresent association. 11, \"Arbitrary LUs\": Statistics that derive from access to Logical Units that are NOT StorageVolumes (e.g., controller commands). 12, \"Remote Replica Group\": Statistics for control IOs between an array and a remote mirror across a Network. Note that statistics for the actual movement of data to the remote mirror are attributed to the targeted StorageVolume (or LogicalDisk). Note that a particular element could be associated to multiple BlockStorageStatisticalData instances if it had multiple roles. For example, a storage array could contain redundant component computer systems that communicate both with hosts on the front end and disks on the back end. Such a device could have one BlockStorageStatisticalData instance where ElementType=3 and another instance where ElementType=5.If only rated data is included per RateElementType, this property shall be set to 0.")
                 (:VALUE-MAP
                  ("0" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" ".."
                   "0x8000.."))
                 (:VALUES
                  ("Unknown" "Computer System" "Front-end Computer System"
                   "Peer Computer System" "Back-end Computer System"
                   "Front-end Port" "Back-end Port" "Volume" "Extent"
                   "Disk Drive" "Arbitrary LUs" "Remote Replica Group"
                   "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (TOTALIOS UINT64 :CIM-NAME "TotalIOs" :QUALIFIERS
                ((:DESCRIPTION "The cumulative count of I/Os for the object.")
                 :COUNTER)
                :INITFORM NIL)
               (KBYTESTRANSFERRED UINT64 :CIM-NAME "KBytesTransferred"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The cumulative count of data transferred in Kbytes (1024bytes = 1KByte).")
                 (NIL "KiloBytes") :COUNTER (:P-UNIT "byte * 10^3"))
                :INITFORM NIL)
               (KBYTESWRITTEN UINT64 :CIM-NAME "KBytesWritten" :QUALIFIERS
                ((:DESCRIPTION
                  "The cumulative count of data written in Kbytes (1024bytes = 1KByte).")
                 (NIL "KiloBytes") :COUNTER (:P-UNIT "byte * 10^3"))
                :INITFORM NIL)
               (IOTIMECOUNTER UINT64 :CIM-NAME "IOTimeCounter" :QUALIFIERS
                ((:DESCRIPTION
                  "The cumulative elapsed I/O time (number of Clock Tick Intervals) for all I/Os as defined in 'Total I/Os'. I/O response time is added to this counter at the completion of each measured I/O using ClockTickInterval units. This value can be divided by number of IOs to obtain an average response time.")
                 :COUNTER)
                :INITFORM NIL)
               (READIOS UINT64 :CIM-NAME "ReadIOs" :QUALIFIERS
                ((:DESCRIPTION "The cumulative count of all reads.") :COUNTER)
                :INITFORM NIL)
               (READHITIOS UINT64 :CIM-NAME "ReadHitIOs" :QUALIFIERS
                ((:DESCRIPTION
                  "The cumulative count of all read cache hits (Reads from Cache).")
                 :COUNTER)
                :INITFORM NIL)
               (READIOTIMECOUNTER UINT64 :CIM-NAME "ReadIOTimeCounter"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The cumulative elapsed time for all Read I/Os for all cumulative Read I/Os.")
                 :COUNTER)
                :INITFORM NIL)
               (READHITIOTIMECOUNTER UINT64 :CIM-NAME "ReadHitIOTimeCounter"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The cumulative elapsed time for all Read I/Os read from cache for all cumulative Read I/Os.")
                 :COUNTER)
                :INITFORM NIL)
               (KBYTESREAD UINT64 :CIM-NAME "KBytesRead" :QUALIFIERS
                ((:DESCRIPTION
                  "The cumulative count of data read in Kbytes (1024bytes = 1KByte).")
                 (NIL "KiloBytes") :COUNTER (:P-UNIT "byte * 10^3"))
                :INITFORM NIL)
               (WRITEIOS UINT64 :CIM-NAME "WriteIOs" :QUALIFIERS
                ((:DESCRIPTION "The cumulative count of all writes.") :COUNTER)
                :INITFORM NIL)
               (WRITEHITIOS UINT64 :CIM-NAME "WriteHitIOs" :QUALIFIERS
                ((:DESCRIPTION
                  "The cumulative count of Write Cache Hits (Writes that went directly to Cache).")
                 :COUNTER)
                :INITFORM NIL)
               (WRITEIOTIMECOUNTER UINT64 :CIM-NAME "WriteIOTimeCounter"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The cumulative elapsed time for all Write I/Os for all cumulative Writes.")
                 :COUNTER)
                :INITFORM NIL)
               (WRITEHITIOTIMECOUNTER UINT64 :CIM-NAME "WriteHitIOTimeCounter"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The cumulative elapsed time using ClockTickInterval units for all Write I/Os written to cache for all cumulative Write I/Os.")
                 :COUNTER)
                :INITFORM NIL)
               (IDLETIMECOUNTER UINT64 :CIM-NAME "IdleTimeCounter" :QUALIFIERS
                ((:DESCRIPTION
                  "The cumulative elapsed idle time using ClockTickInterval units (Cumulative Number of Time Units for all idle time in the array).")
                 :COUNTER)
                :INITFORM NIL)
               (MAINTOP UINT64 :CIM-NAME "MaintOp" :QUALIFIERS
                ((:DESCRIPTION
                  "The cumulative count of all disk maintenance operations (SCSI commands such as: Verify, skip-mask, XOR read, XOR write-read, etc).This is needed to understand the load on the disks that may interfere with normal read and write operations.")
                 :COUNTER)
                :INITFORM NIL)
               (MAINTTIMECOUNTER UINT64 :CIM-NAME "MaintTimeCounter"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The cumulative elapsed disk mainenance time. Maintainance response time is added to this counter at the completion of each measured maintenance operation using ClockTickInterval units.")
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
              (:CIM-NAME "CIM_BlockStorageStatisticalData")
              (:QUALIFIERS (:VERSION "2.39.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageStatistics")
               (:DESCRIPTION
                "A subclass of StatisticalData which identifies individual statistics for an element of a block storage system. This class defines the metrics that MAY be kept for managed elements of the system.")))
(DEFCIM-METHOD RESETSELECTEDSTATS
    ((INSTANCE CIM_BLOCKSTORAGESTATISTICALDATA)
     (SELECTEDSTATISTICS (ARRAY STRING) "SelectedStatistics" :IN
      (:DESCRIPTION "Array of strings indicating which statistics to reset.")))
    ((:CIM-NAME "ResetSelectedStats")
     (:QUALIFIERS
      (:DESCRIPTION
       "Method to reset one or more of the instance's statistics. The method takes one parameter as input - an array of strings indicating which statistics to reset. If all the statistics in the instance should be reset, the first element of the array MUST be set to \"All\" or \"ALL\". If one or more individual statistics should be reset, the corresponding property names are entered into the elements of the array. 
The method returns 0 if successful, 1 if not supported, and any other value if an error occurred. A method is specified so that the StatisticalInformation's provider/ instrumentation, which calculates the statistics, can reset its internal processing, counters, etc. 
In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))