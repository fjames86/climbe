
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_CIMOMStatisticalData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CIMOMSTATISTICALDATA (CIM_STATISTICALDATA)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                ((:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "The InstanceID property opaquely identifies a unique instance of CIMOMStatisticalData and MUST be unique within a namespace. In order to ensure uniqueness, the value of InstanceID MUST be constructed in the following manner: 
CIM<ID> 
The <ID> MUST include a CIM Object Manager specified unique identifier.")
                 :KEY)
                :INITFORM NIL)
               (OPERATIONTYPE UINT16 :CIM-NAME "OperationType" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The OperationType property identifies the type of CIM operation for which data is reported in this instance. Batched CIM operations (consisting of multiple simple CIM operations) are reported against the \"Batched\" type only.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25"
                   "26"))
                 (:VALUES
                  ("Unknown" "Other" "Batched" "GetClass" "GetInstance"
                   "DeleteClass" "DeleteInstance" "CreateClass"
                   "CreateInstance" "ModifyClass" "ModifyInstance"
                   "EnumerateClasses" "EnumerateClassNames"
                   "EnumerateInstances" "EnumerateInstanceNames" "ExecQuery"
                   "Associators" "AssociatorNames" "References"
                   "ReferenceNames" "GetProperty" "SetProperty" "GetQualifier"
                   "SetQualifier" "DeleteQualifier" "EnumerateQualifiers"
                   "IndicationDelivery"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_CIMOMStatisticalData.OtherOperationType")))
                :INITFORM NIL)
               (OTHEROPERATIONTYPE STRING :CIM-NAME "OtherOperationType"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The OtherOperationType property identifies the operation if the OperationType property has a value of 1 (\"Other\"). For all other values of OperationType, the property is NULL.")
                 (:MAX-LEN "64")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_CIMOMStatisticalData.OperationType")))
                :INITFORM NIL)
               (NUMBEROFOPERATIONS UINT64 :CIM-NAME "NumberOfOperations"
                :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The NumberOfOperations property contains the number of CIM operations of the specified type. This property can be used to calculate average values per CIM operation.")
                 :COUNTER)
                :INITFORM NIL)
               (CIMOMELAPSEDTIME DATETIME :CIM-NAME "CimomElapsedTime"
                :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The CimomElapsedTime property contains the elapsed time spent in the CIM Object Manager for this operation type, not counting the elapsed time spent in providers and the underlying instrumentation. The measurement points for this property SHOULD be at the transport layer interface on the network side, and at the provider interface on the instrumentation side of the CIM Object Manager."))
                :INITFORM NIL)
               (PROVIDERELAPSEDTIME DATETIME :CIM-NAME "ProviderElapsedTime"
                :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "The ProviderElapsedTime property contains the elapsed time spent in all providers involved with this operation type, including the underlying instrumentation. The measurement point for this property SHOULD be from the provider interface of the CIM Object Manager."))
                :INITFORM NIL)
               (REQUESTSIZE UINT64 :CIM-NAME "RequestSize" :QUALIFIERS
                ((:DESCRIPTION
                  "The RequestSize property contains the size of the operation requests sent to the CIM Object Manager. Any overhead of protocols above the transport protocol SHOULD be included in the count. For example, for the HTTP protocol, the size would include the size of the HTTP payload and the size of the HTTP headers.")
                 (NIL "Bytes") :COUNTER (:P-UNIT "byte"))
                :INITFORM NIL)
               (RESPONSESIZE UINT64 :CIM-NAME "ResponseSize" :QUALIFIERS
                ((:DESCRIPTION
                  "The ResponseSize property contains the size of the operation responses sent back from the CIM Object Manager. Any overhead of protocols above the transport protocol SHOULD be included in the count. For example, for the HTTP protocol, the size would include the size of the HTTP payload and the size of the HTTP headers.")
                 (NIL "Bytes") :COUNTER (:P-UNIT "byte"))
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
              (:CIM-NAME "CIM_CIMOMStatisticalData")
              (:QUALIFIERS (:VERSION "2.19.0")
               (:UML-PACKAGE-PATH "CIM::Interop")
               (:DESCRIPTION
                "CIM_CIMOMStatisticalData provides statistical data about the performance of the CIM Object Manager. Each object of this class provides elapsed time and size data for a particular type of CIM operation. All operations of that type, regardless of the CIM operations protocol being used, are accumulated in one object and covers the CIM operations issued by all clients of the Object Manager scoping the instance. Batched CIM operations are accumulated into a separate operation type for \"Batched\". The counters in this class SHOULD be implemented such that they always increment and naturally wrap around when their numerical limit is exceeded. A client that calculates the difference of two snapshots of a counter at the beginning and end of a measurement interval should get the correct result, even if there was a wrap-around in between obtaining the two snapshots. (Two or more wrap arounds will result in wrong data being calculated.) The gathering of the data can be controlled through the property, CIM_ObjectManager.GatherStatisticalData. The time interval to which the statistical data applies, ends at the current time and therefore includes the most current CIM operations. The interval starts when the statistical data gathering was last turned on for the Object Manager.")))
(DEFCIM-METHOD RESETSELECTEDSTATS
    ((INSTANCE CIM_CIMOMSTATISTICALDATA)
     (SELECTEDSTATISTICS (ARRAY STRING) "SelectedStatistics" :IN
      (:DESCRIPTION "Array of strings indicating which statistics to reset.")))
    ((:CIM-NAME "ResetSelectedStats")
     (:QUALIFIERS
      (:DESCRIPTION
       "Method to reset one or more of the instance's statistics. The method takes one parameter as input - an array of strings indicating which statistics to reset. If all the statistics in the instance should be reset, the first element of the array MUST be set to \"All\" or \"ALL\". If one or more individual statistics should be reset, the corresponding property names are entered into the elements of the array. 
The method returns 0 if successful, 1 if not supported, and any other value if an error occurred. A method is specified so that the StatisticalInformation's provider/ instrumentation, which calculates the statistics, can reset its internal processing, counters, etc. 
In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))