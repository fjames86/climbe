
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_StatisticalRuntimeOverview.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_STATISTICALRUNTIMEOVERVIEW (CIM_STATISTICALDATA)
              ((LASTACTIVITY DATETIME :CIM-NAME "LastActivity" :QUALIFIERS
                ((:DESCRIPTION
                  "The point in time (date and time) when the most recent inbound activity was observed for the application. A value of all zeros indicates that no inbound activity has taken place since the application was started."))
                :INITFORM NIL)
               (NUMBEROFACTIVEREQUESTS UINT32 :CIM-NAME
                "NumberOfActiveRequests" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of requests currently being served. This is not the count of open connections! Very often it reflects the number of current user requests. Note that the semantics of a request are general enough to characterize the entire application system.")
                 :COUNTER)
                :INITFORM NIL)
               (NUMBEROFACTIVEREQUESTORS UINT32 :CIM-NAME
                "NumberOfActiveRequestors" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of active requestors in the application system. It may differ from the number of active requests (greater if a requestor has issued multiple requests, smaller if some of the requestors have no request running at the considered point in time). Very often it reflects the number of user logged on to the application system or the number of sessions being served by the system. 
Note that the semantics of a requestor are general enough to characterize the entire application system.")
                 :COUNTER)
                :INITFORM NIL)
               (AVERAGERESPONSETIME UINT32 :CIM-NAME "AverageResponseTime"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The average response time is the mean of a number of requests captured between StatisticTime and a close point in time in the past. This interval or duration, that the average depends on, is defined by the underlying implementation such that it still has a reasonable proximity to one point in time. The term average is not focused on averaging a number of requests but averaging a period of time. Therefore, the average does not relate to more than a couple of minutes and, consequently, AverageResponseTime has the notion of the response time at the point in time of StatisticTime. If the interval is too great, AverageResponseTime becomes meaningless for monitoring. If no response time can be determined, the value is 0.")
                 (NIL "MilliSeconds") (:P-UNIT "second * 10^-3"))
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
              (:CIM-NAME "CIM_StatisticalRuntimeOverview")
              (:QUALIFIERS (:VERSION "2.8.0")
               (:UML-PACKAGE-PATH "CIM::Application::AppRuntime")
               (:DESCRIPTION
                "This class represents statistical data and metrics that characterize the application as a whole. It exists only once per application system instance and provides primarily raw data for the monitoring of service levels. Therefore, the metrics presented are only a summary or overview of the application system behavior at a certain point of time. Instances are only available if the concerned application is running. Therefore, an instance of ApplicationSystem MUST exist when the instance of this class is created.")))
(DEFCIM-METHOD RESETSELECTEDSTATS
    ((INSTANCE CIM_STATISTICALRUNTIMEOVERVIEW)
     (SELECTEDSTATISTICS (ARRAY STRING) "SelectedStatistics" :IN
      (:DESCRIPTION "Array of strings indicating which statistics to reset.")))
    ((:CIM-NAME "ResetSelectedStats")
     (:QUALIFIERS
      (:DESCRIPTION
       "Method to reset one or more of the instance's statistics. The method takes one parameter as input - an array of strings indicating which statistics to reset. If all the statistics in the instance should be reset, the first element of the array MUST be set to \"All\" or \"ALL\". If one or more individual statistics should be reset, the corresponding property names are entered into the elements of the array. 
The method returns 0 if successful, 1 if not supported, and any other value if an error occurred. A method is specified so that the StatisticalInformation's provider/ instrumentation, which calculates the statistics, can reset its internal processing, counters, etc. 
In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are 'translated' may also be specified in the subclass as a Values array qualifier."))))