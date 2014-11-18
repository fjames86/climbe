
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DatabaseServiceStatistics.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DATABASESERVICESTATISTICS (CIM_STATISTICALDATA)
              ((LASTACTIVITY DATETIME :CIM-NAME "LastActivity" :QUALIFIERS
                ((:DESCRIPTION
                  "The date and time when the most recent inbound activity was observed for the database service. A value of all zeros indicates that no inbound activity has taken place since the service was started.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|RDBMS-MIB.rdbmsSrvInfoLastInboundActivity")))
                :INITFORM NIL)
               (ACTIVECONNECTIONS UINT64 :CIM-NAME "ActiveConnections"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The number of active inbound connections that are currently using the service.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|RDBMS-MIB.rdbmsSrvInfoapplInboundAssociation")))
                :INITFORM NIL)
               (CUMULATIVECONNECTIONS UINT64 :CIM-NAME "CumulativeConnections"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of inbound connections to the service since it was started.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|RDBMS-MIB.rdbmsSrvInfoapplAccumulatedInboundAssociations")))
                :INITFORM NIL)
               (REJECTEDCONNECTIONS UINT64 :CIM-NAME "RejectedConnections"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of inbound connections that were rejected by the service since it was started.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|RDBMS-MIB.rdbmsSrvInfoapplRejectedInboundAssociations")))
                :INITFORM NIL)
               (COMPLETEDTRANSACTIONS UINT64 :CIM-NAME "CompletedTransactions"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of transactions that have been completed by a commit or abort. Some database operations, such as read-only queries, might not create a transaction.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|RDBMS-MIB.rdbmsSrvInfoFinishedTransactions")))
                :INITFORM NIL)
               (DISKREADS UINT64 :CIM-NAME "DiskReads" :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of database file reads that were issued by the service since it was started.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|RDBMS-MIB.rdbmsSrvInfoDiskReads")))
                :INITFORM NIL)
               (DISKWRITES UINT64 :CIM-NAME "DiskWrites" :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of database file writes that were issued by the service since it was started.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|RDBMS-MIB.rdbmsSrvInfoDiskWrites")))
                :INITFORM NIL)
               (LOGICALREADS UINT64 :CIM-NAME "LogicalReads" :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of logical database file reads that were issued by the service since it was started.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|RDBMS-MIB.rdbmsSrvInfoLogicalReads")))
                :INITFORM NIL)
               (LOGICALWRITES UINT64 :CIM-NAME "LogicalWrites" :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of logical database file writes that were issued by the service since it was started. A logical write is a count of the number of times that parts of database files have been marked dirty to indicate that they need to be written to disk.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|RDBMS-MIB.rdbmsSrvInfoLogicalWrites")))
                :INITFORM NIL)
               (PAGEREADS UINT64 :CIM-NAME "PageReads" :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of database pages that have been read by the service since it was started.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|RDBMS-MIB.rdbmsSrvInfoPageReads")))
                :INITFORM NIL)
               (PAGEWRITES UINT64 :CIM-NAME "PageWrites" :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of database pages that have been written by the service since it was started.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|RDBMS-MIB.rdbmsSrvInfoPageWrites")))
                :INITFORM NIL)
               (DISKSPACEUNAVAILABLE UINT64 :CIM-NAME "DiskSpaceUnavailable"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of times that the database requested disk space and it was not available since the service was started.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|RDBMS-MIB.rdbmsSrvInfoDiskOutOfSpaces")))
                :INITFORM NIL)
               (REQUESTSHANDLED UINT64 :CIM-NAME "RequestsHandled" :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of requests that have been received by the service since it was started.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|RDBMS-MIB.rdbmsSrvInfoHandledRequests")))
                :INITFORM NIL)
               (REQUESTSRECEIVED UINT64 :CIM-NAME "RequestsReceived"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of receive operations made by the service during request processing since it was started.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|RDBMS-MIB.rdbmsSrvInfoRequestRecvs")))
                :INITFORM NIL)
               (REQUESTSSENT UINT64 :CIM-NAME "RequestsSent" :QUALIFIERS
                ((:DESCRIPTION
                  "The total number of send operations made by the service during request processing since it was started.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|RDBMS-MIB.rdbmsSrvInfoRequestsSent")))
                :INITFORM NIL)
               (HIGHWATERCONNECTIONS UINT64 :CIM-NAME "HighwaterConnections"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The maximum number of active inbound connections that have been concurrently using the service since it was started.")
                 :COUNTER
                 (:MAPPING-STRINGS
                  ("MIB.IETF|RDBMS-MIB.rdbmsSrvInfoHighwaterInboundAssociations")))
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
              (:CIM-NAME "CIM_DatabaseServiceStatistics")
              (:QUALIFIERS (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Database::Statistics")
               (:DESCRIPTION
                "The CIM_DatabaseServiceStatistics class contains the current statistics for a database service. These statistics are counters that are relative to the start of the service or from the time when a reset was issued.")))
(DEFCIM-METHOD RESETSELECTEDSTATS
    ((INSTANCE CIM_DATABASESERVICESTATISTICS)
     (SELECTEDSTATISTICS (ARRAY STRING) "SelectedStatistics" :IN
      (:DESCRIPTION "Array of strings indicating which statistics to reset.")))
    ((:CIM-NAME "ResetSelectedStats")
     (:QUALIFIERS
      (:DESCRIPTION
       "Method to reset one or more of the instance's statistics. The method takes one parameter as input - an array of strings indicating which statistics to reset. If all the statistics in the instance should be reset, the first element of the array MUST be set to \"All\" or \"ALL\". If one or more individual statistics should be reset, the corresponding property names are entered into the elements of the array. 
The method returns 0 if successful, 1 if not supported, and any other value if an error occurred. A method is specified so that the StatisticalInformation's provider/ instrumentation, which calculates the statistics, can reset its internal processing, counters, etc. 
In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))