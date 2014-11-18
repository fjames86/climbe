
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_BlockStatisticsManifest.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_BLOCKSTATISTICSMANIFEST (CIM_MANAGEDELEMENT)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> must include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> must not contain a colon (:). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements. If the above \"preferred\" algorithm is not used, the defining entity must assure that the resulting InstanceID is not reused across any InstanceIDs produced by this or other providers for the NameSpace of this instance. 
For DMTF-defined instances, the \"preferred\" algorithm must be used with the <OrgID> set to CIM."))
                :INITFORM NIL)
               (ELEMENTTYPE UINT16 :CIM-NAME "ElementType" :QUALIFIERS
                ((:DESCRIPTION
                  "Determines the type of elements that this BlockStatisticsManifest can be applied to (e.g. during a GetStatisticsCollection request). This is used when the same set of statistical metrics is calculated for several types of devices. In this way, a single BlockStatisticsManifest instance can be used to filter all the StatsiticalData instances that contain metrics for the same type of element in a StatisticsCollection. If used, a subclass should override this property to specify the element types supported by that class, preferably through ValueMap and Values qualifiers to allow clients to programmatically retrieve those supported types.")
                 (:VALUE-MAP
                  ("2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" ".."
                   "0x8000.."))
                 (:VALUES
                  ("Computer System" "Front-end Computer System"
                   "Peer Computer System" "Back-end Computer System"
                   "Front-end Port" "Back-end Port" "Volume" "Extent"
                   "Disk Drive" "Arbitrary LUs" "Remote Replica Group"
                   "DMTF Reserved" "Vendor Specific"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.ElementType")))
                :INITFORM NIL)
               (INCLUDESTARTSTATISTICTIME BOOLEAN :CIM-NAME
                "IncludeStartStatisticTime" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates whether or not the Statistics property of StatisticsService.GetStatisticsCollection method will include the time at time when statistics for this BlockStatisticsManifest were first captured.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.StartStatisticTime")))
                :INITFORM "false")
               (INCLUDESTATISTICTIME BOOLEAN :CIM-NAME "IncludeStatisticTime"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates whether or not the Statistics property of StatisticsService.GetStatisticsCollection method will include the time when statistics for this BlockStatisticsManifest were last captured.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.StatisticTime")))
                :INITFORM "false")
               (INCLUDETOTALIOS BOOLEAN :CIM-NAME "IncludeTotalIOs" :QUALIFIERS
                ((:DESCRIPTION
                  "Whether to include in a filter for a metered element the cumulative count of I/Os for that element.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.StatisticTime")))
                :INITFORM "false")
               (INCLUDEKBYTESTRANSFERRED BOOLEAN :CIM-NAME
                "IncludeKBytesTransferred" :QUALIFIERS
                ((:DESCRIPTION
                  "Whether to include in a filter for a metered element the cumulative count of data transferred in Kbytes for that element.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.KBytesTransferred")))
                :INITFORM "false")
               (INCLUDEIOTIMECOUNTER BOOLEAN :CIM-NAME "IncludeIOTimeCounter"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Whether to include in a filter for a metered element the cumulative elapsed I/O time (number of Clock Tick Intervals) for all I/Os for that element as defined in 'Total I/Os'.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.IOTimeCounter")))
                :INITFORM "false")
               (INCLUDEREADIOS BOOLEAN :CIM-NAME "IncludeReadIOs" :QUALIFIERS
                ((:DESCRIPTION
                  "Whether to include in a filter for a metered element the cumulative count of all reads for that element.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.ReadIOs")))
                :INITFORM "false")
               (INCLUDEREADHITIOS BOOLEAN :CIM-NAME "IncludeReadHitIOs"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Whether to include in a filter for a metered element the cumulative count of all read cache hits (Reads from Cache) for that element.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.ReadHitIOs")))
                :INITFORM "false")
               (INCLUDEREADIOTIMECOUNTER BOOLEAN :CIM-NAME
                "IncludeReadIOTimeCounter" :QUALIFIERS
                ((:DESCRIPTION
                  "Whether to include in a filter for a metered element the cumulative elapsed time for all cumulative Read I/Os for that element.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.ReadIOTimeCounter")))
                :INITFORM "false")
               (INCLUDEREADHITIOTIMECOUNTER BOOLEAN :CIM-NAME
                "IncludeReadHitIOTimeCounter" :QUALIFIERS
                ((:DESCRIPTION
                  "Whether to include in a filter for a metered element the cumulative elapsed time for all Read I/Os read from cache for that element.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.ReadHitIOTimeCounter")))
                :INITFORM "false")
               (INCLUDEKBYTESREAD BOOLEAN :CIM-NAME "IncludeKBytesRead"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Whether to include in a filter for a metered element the cumulative count of data read in Kbytes for that element.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.KBytesRead")))
                :INITFORM "false")
               (INCLUDEWRITEIOS BOOLEAN :CIM-NAME "IncludeWriteIOs" :QUALIFIERS
                ((:DESCRIPTION
                  "Whether to include in a filter for a metered element the cumulative count of all writes for tat element.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.WriteIOs")))
                :INITFORM "false")
               (INCLUDEWRITEHITIOS BOOLEAN :CIM-NAME "IncludeWriteHitIOs"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Whether to include in a filter for a metered element the cumulative count of Write Cache Hits (Writes that went directly to Cache) for that element.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.WriteHitIOs")))
                :INITFORM "false")
               (INCLUDEWRITEIOTIMECOUNTER BOOLEAN :CIM-NAME
                "IncludeWriteIOTimeCounter" :QUALIFIERS
                ((:DESCRIPTION
                  "Whether to include in a filter for a metered element the cumulative elapsed time for all Write I/Os for that element.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.WriteIOTimeCounter")))
                :INITFORM "false")
               (INCLUDEWRITEHITIOTIMECOUNTER BOOLEAN :CIM-NAME
                "IncludeWriteHitIOTimeCounter" :QUALIFIERS
                ((:DESCRIPTION
                  "Whether to include in a filter for a metered element the cumulative elapsed time for all Write I/Os written to cache for that element.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.WriteHitIOTimeCounter")))
                :INITFORM "false")
               (INCLUDEKBYTESWRITTEN BOOLEAN :CIM-NAME "IncludeKBytesWritten"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Whether to include in a filter for a metered element the cumulative count of data written in Kbytes for that element.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.KBytesWritten")))
                :INITFORM "false")
               (INCLUDEIDLETIMECOUNTER BOOLEAN :CIM-NAME
                "IncludeIdleTimeCounter" :QUALIFIERS
                ((:DESCRIPTION
                  "Whether to include in a filter for a metered element the cumulative elapsed idle time for that element.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.IdleTimeCounter")))
                :INITFORM "false")
               (INCLUDEMAINTOP BOOLEAN :CIM-NAME "IncludeMaintOp" :QUALIFIERS
                ((:DESCRIPTION
                  "Whether to include in a filter for a metered element the cumulative count of all maintenance operations for that element.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.MaintOp")))
                :INITFORM "false")
               (INCLUDEMAINTTIMECOUNTER BOOLEAN :CIM-NAME
                "IncludeMaintTimeCounter" :QUALIFIERS
                ((:DESCRIPTION
                  "Whether to include in a filter for a metered element the cumulative elapsed maintenance time for that element.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BlockStorageStatisticalData.MaintTimeCounter")))
                :INITFORM "false")
               (CAPTION STRING :CIM-NAME "Caption" :QUALIFIERS
                ((:DESCRIPTION
                  "The Caption property is a short textual description (one- line string) of the object.")
                 (:MAX-LEN "64"))
                :INITFORM NIL)
               (DESCRIPTION STRING :CIM-NAME "Description" :QUALIFIERS
                ((:DESCRIPTION
                  "The Description property provides a textual description of the object."))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                ((:DESCRIPTION
                  "A user-friendly name for the object. This property allows each instance to define a user-friendly name in addition to its key properties, identity data, and description information. 
Note that the Name property of ManagedSystemElement is also defined as a user-friendly name. But, it is often subclassed to be a Key. It is not reasonable that the same property can convey both identity and a user-friendly name, without inconsistencies. Where Name exists and is not a Key (such as for instances of LogicalDevice), the same information can be present in both the Name and ElementName properties. Note that if there is an associated instance of CIM_EnabledLogicalElementCapabilities, restrictions on this properties may exist as defined in ElementNameMask and MaxElementNameLen properties defined in that class."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_BlockStatisticsManifest")
              (:QUALIFIERS (:VERSION "2.19.0")
               (:UML-PACKAGE-PATH "CIM::Device::StorageStatistics")
               (:DESCRIPTION
                "Instances of this class define a list of supported or desired properties of BlockStatisticalData instances. In the case where a BlockStatisticsManifest instance is a member of a BlockStatisticsManifestCollection used in a BlockStatisticsService.GetStatisticsCollection request, for each of the boolean \"include\" properties set to true in that BlockStatisticsManifest, the corresponding BlockStatisticalData property will be included, if available, in the statistics returned for BlockStatisticalData instances whose ElementType matches the ElementType of the BlockStatisticsManifest.")))