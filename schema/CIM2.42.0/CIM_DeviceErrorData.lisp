
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DeviceErrorData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DEVICEERRORDATA (CIM_STATISTICALDATA)
              ((INDETERMINATEERRORCOUNT UINT64 :CIM-NAME
                "IndeterminateErrorCount" :QUALIFIERS
                ((:DESCRIPTION "Count of the indeterminate errors.") :COUNTER)
                :INITFORM NIL)
               (CRITICALERRORCOUNT UINT64 :CIM-NAME "CriticalErrorCount"
                :QUALIFIERS
                ((:DESCRIPTION "Count of the critical errors.") :COUNTER
                 (:MAPPING-STRINGS ("MIF.DMTF|Operational State|006.7")))
                :INITFORM NIL)
               (MAJORERRORCOUNT UINT64 :CIM-NAME "MajorErrorCount" :QUALIFIERS
                ((:DESCRIPTION "Count of the major errors.") :COUNTER
                 (:MAPPING-STRINGS ("MIF.DMTF|Operational State|006.8")))
                :INITFORM NIL)
               (MINORERRORCOUNT UINT64 :CIM-NAME "MinorErrorCount" :QUALIFIERS
                ((:DESCRIPTION "Count of the minor errors.") :COUNTER)
                :INITFORM NIL)
               (WARNINGCOUNT UINT64 :CIM-NAME "WarningCount" :QUALIFIERS
                ((:DESCRIPTION "Count of the warnings.") :COUNTER
                 (:MAPPING-STRINGS ("MIF.DMTF|Operational State|006.9")))
                :INITFORM NIL)
               (LASTERRORCODE STRING :CIM-NAME "LastErrorCode" :QUALIFIERS
                ((:DESCRIPTION
                  "LastErrorCode captures the last error code reported by the LogicalDevice. While the device is in this error condition, then the OperationalStatus of the LogicalDevice should not reflect an 'Okay' status. When this error condition is cleared, then the OperationalStatus of the LogicalDevice should report an 'Okay' status."))
                :INITFORM NIL)
               (ERRORDESCRIPTION STRING :CIM-NAME "ErrorDescription"
                :QUALIFIERS
                ((:DESCRIPTION
                  "ErrorDescription is a free-form string that supplies more information about the error recorded in LastErrorCode, and information on any corrective actions that might be taken."))
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
              (:CIM-NAME "CIM_DeviceErrorData")
              (:QUALIFIERS (:VERSION "2.10.0")
               (:UML-PACKAGE-PATH "CIM::Device::DeviceElements")
               (:DESCRIPTION
                "DeviceErrorData is a statistical class that contains error- related counters for a LogicalDevice. The types of errors are defined by CCITT (Rec X.733) and ISO (IEC 10164-4). The element, whose statistics are described, is associated using the relationship, ElementStatisticalData. Note that this class uses a simplified identity or naming algorithm over CIM_DeviceErrorCounts.")))
(DEFCIM-METHOD RESETSELECTEDSTATS
    ((INSTANCE CIM_DEVICEERRORDATA)
     (SELECTEDSTATISTICS (ARRAY STRING) "SelectedStatistics" :IN
      (:DESCRIPTION "Array of strings indicating which statistics to reset.")))
    ((:CIM-NAME "ResetSelectedStats")
     (:QUALIFIERS
      (:DESCRIPTION
       "Method to reset one or more of the instance's statistics. The method takes one parameter as input - an array of strings indicating which statistics to reset. If all the statistics in the instance should be reset, the first element of the array MUST be set to \"All\" or \"ALL\". If one or more individual statistics should be reset, the corresponding property names are entered into the elements of the array. 
The method returns 0 if successful, 1 if not supported, and any other value if an error occurred. A method is specified so that the StatisticalInformation's provider/ instrumentation, which calculates the statistics, can reset its internal processing, counters, etc. 
In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))