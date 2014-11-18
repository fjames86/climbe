
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_ConcreteJob.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_CONCRETEJOB (CIM_JOB)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> must include a copyrighted, trademarked or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID, or that is a registered ID that is assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> must not contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity must assure that the resulting InstanceID is not re-used across any InstanceIDs produced by this or other providers for the NameSpace of this instance. 
For DMTF defined instances, the 'preferred' algorithm must be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "Name")
                 (:DESCRIPTION
                  "The user-friendly name for this instance of a Job. In addition, the user-friendly name can be used as a property for a search or query. (Note: Name does not have to be unique within a namespace.)")
                 (:MAX-LEN "1024"))
                :INITFORM NIL)
               (JOBSTATE UINT16 :CIM-NAME "JobState" :QUALIFIERS
                ((:DESCRIPTION
                  "JobState is an integer enumeration that indicates the operational state of a Job. It can also indicate transitions between these states, for example, 'Shutting Down' and 'Starting'. Following is a brief description of the states: 
New (2) indicates that the job has never been started. 
Starting (3) indicates that the job is moving from the 'New', 'Suspended', or 'Service' states into the 'Running' state. 
Running (4) indicates that the Job is running. 
Suspended (5) indicates that the Job is stopped, but can be restarted in a seamless manner. 
Shutting Down (6) indicates that the job is moving to a 'Completed', 'Terminated', or 'Killed' state. 
Completed (7) indicates that the job has completed normally. 
Terminated (8) indicates that the job has been stopped by a 'Terminate' state change request. The job and all its underlying processes are ended and can be restarted (this is job-specific) only as a new job. 
Killed (9) indicates that the job has been stopped by a 'Kill' state change request. Underlying processes might have been left running, and cleanup might be required to free up resources. 
Exception (10) indicates that the Job is in an abnormal state that might be indicative of an error condition. Actual status might be displayed though job-specific objects. 
Service (11) indicates that the Job is in a vendor-specific state that supports problem discovery, or resolution, or both.
Query pending (12) waiting for a client to resolve a query")
                 (:VALUE-MAP
                  ("2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13..32767"
                   "32768..65535"))
                 (:VALUES
                  ("New" "Starting" "Running" "Suspended" "Shutting Down"
                   "Completed" "Terminated" "Killed" "Exception" "Service"
                   "Query Pending" "DMTF Reserved" "Vendor Reserved")))
                :INITFORM NIL)
               (TIMEOFLASTSTATECHANGE DATETIME :CIM-NAME
                "TimeOfLastStateChange" :QUALIFIERS
                ((:DESCRIPTION
                  "The date or time when the state of the Job last changed. If the state of the Job has not changed and this property is populated, then it must be set to a 0 interval value. If a state change was requested, but rejected or not yet processed, the property must not be updated."))
                :INITFORM NIL)
               (TIMEBEFOREREMOVAL DATETIME :CIM-NAME "TimeBeforeRemoval"
                :QUALIFIERS
                (:REQUIRED :WRITE
                 (:DESCRIPTION
                  "The amount of time that the Job is retained after it has finished executing, either succeeding or failing in that execution. The job must remain in existence for some period of time regardless of the value of the DeleteOnCompletion property. 
The default is five minutes."))
                :INITFORM "00000000000500.000000:000")
               (JOBINPARAMETERS STRING :CIM-NAME "JobInParameters" :QUALIFIERS
                ((:DESCRIPTION
                  "The input (including inout), parameters of the job, formatted as an embedded instance with a class name of \"__JobInParameters\".
In the case where a job represents an intrinsic operation or an extrinsic method call, that embedded instance contains properties representing the input parameters of that call. Each input parameter is mapped to a corresponding property of the same name and type. REF-typed parameters are represented as Reference-qualified properties of type string whose value is the instance path in WBEM URI format.
The value of each property shall be the value of the corresponding input parameter at the time the job was started.")
                 :EMBEDDED-OBJECT)
                :INITFORM NIL)
               (JOBOUTPARAMETERS STRING :CIM-NAME "JobOutParameters"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The output (including inout), parameters of the job, formatted as an embedded instance with a class name of \"__JobOutParameters\".

This property shall be NULL unless JobStatus has the value Completed (7).

In the case where a job represents an intrinsic operation or an extrinsic method call, that embedded instance contains properties representing the output parameters and return value of that call. Each output parameter is mapped to a corresponding property of the same name and type, and the return value is mapped to a property with the name __ReturnValue of the same type. REF-typed parameters and return values are mapped to Reference-qualified properties of type string whose value is the instance path in WBEM URI format.

The value of each such property shall be the value of the corresponding output parameter or return value at the time the job completed.")
                 :EMBEDDED-OBJECT)
                :INITFORM NIL)
               (JOBSTATUS STRING :CIM-NAME "JobStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string that represents the status of the job. The primary status is reflected in the inherited OperationalStatus property. JobStatus provides additional, implementation-specific details.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.OperationalStatus")))
                :INITFORM NIL)
               (TIMESUBMITTED DATETIME :CIM-NAME "TimeSubmitted" :QUALIFIERS
                ((:DESCRIPTION
                  "The time that the Job was submitted to execute. A value of all zeroes indicates that the owning element is not capable of reporting a date and time. Therefore, the ScheduledStartTime and StartTime are reported as intervals relative to the time their values are requested."))
                :INITFORM NIL)
               (SCHEDULEDSTARTTIME DATETIME :CIM-NAME "ScheduledStartTime"
                :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_Job.RunMonth" "CIM_Job.RunDay" "CIM_Job.RunDayOfWeek"
                   "CIM_Job.RunStartInterval"))
                 :WRITE
                 (:DESCRIPTION
                  "The time that the current Job is scheduled to start. This time can be represented by the actual date and time, or an interval relative to the time that this property is requested. A value of all zeroes indicates that the Job is already executing. The property is deprecated in lieu of the more expressive scheduling properties, RunMonth, RunDay, RunDayOfWeek, and RunStartInterval."))
                :INITFORM NIL)
               (STARTTIME DATETIME :CIM-NAME "StartTime" :QUALIFIERS
                ((:DESCRIPTION
                  "The time that the Job was actually started. This time can be represented by an actual date and time, or by an interval relative to the time that this property is requested. Note that this property is also present in the JobProcessingStatistics class. This class is necessary to capture the processing information for recurring Jobs, because only the 'last' run time can be stored in this single-valued property."))
                :INITFORM NIL)
               (ELAPSEDTIME DATETIME :CIM-NAME "ElapsedTime" :QUALIFIERS
                ((:DESCRIPTION
                  "The time interval that the Job has been executing or the total execution time if the Job is complete. Note that this property is also present in the JobProcessingStatistics class. This class is necessary to capture the processing information for recurring Jobs, because only the 'last' run time can be stored in this single-valued property."))
                :INITFORM NIL)
               (JOBRUNTIMES UINT32 :CIM-NAME "JobRunTimes" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The number of times that the Job should be run. A value of 1 indicates that the Job is not recurring, while any non-zero value indicates a limit to the number of times that the Job will recur. Zero indicates that there is no limit to the number of times that the Job can be processed, but that it is terminated either after the UntilTime or by manual intervention. By default, a Job is processed once."))
                :INITFORM "1")
               (RUNMONTH UINT8 :CIM-NAME "RunMonth" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The month during which the Job should be processed. Specify 0 for January, 1 for February, and so on.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11"))
                 (:VALUES
                  ("January" "February" "March" "April" "May" "June" "July"
                   "August" "September" "October" "November" "December"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Job.RunDay" "CIM_Job.RunDayOfWeek"
                   "CIM_Job.RunStartInterval")))
                :INITFORM NIL)
               (RUNDAY SINT8 :CIM-NAME "RunDay" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The day in the month on which the Job should be processed. There are two different interpretations for this property, depending on the value of DayOfWeek. In one case, RunDay defines the day-in-month on which the Job is processed. This interpretation is used when the DayOfWeek is 0. A positive or negative integer indicates whether the RunDay should be calculated from the beginning or end of the month. For example, 5 indicates the fifth day in the RunMonth and -1 indicates the last day in the RunMonth. 

When RunDayOfWeek is not 0, RunDay is the day-in-month on which the Job is processed, defined in conjunction with RunDayOfWeek. For example, if RunDay is 15 and RunDayOfWeek is Saturday, then the Job is processed on the first Saturday on or after the 15th day in the RunMonth (for example, the third Saturday in the month). If RunDay is 20 and RunDayOfWeek is -Saturday, then this indicates the first Saturday on or before the 20th day in the RunMonth. If RunDay is -1 and RunDayOfWeek is -Sunday, then this indicates the last Sunday in the RunMonth.")
                 (:MIN-VALUE "-31") (:MAX-VALUE "31")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Job.RunMonth" "CIM_Job.RunDayOfWeek"
                   "CIM_Job.RunStartInterval")))
                :INITFORM NIL)
               (RUNDAYOFWEEK SINT8 :CIM-NAME "RunDayOfWeek" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "A positive or negative integer used in conjunction with RunDay to indicate the day of the week on which the Job is processed. RunDayOfWeek is set to 0 to indicate an exact day of the month, such as March 1. A positive integer (representing Sunday, Monday, ..., Saturday) means that the day of week is found on or after the specified RunDay. A negative integer (representing -Sunday, -Monday, ..., -Saturday) means that the day of week is found on or BEFORE the RunDay.")
                 (:VALUE-MAP
                  ("-7" "-6" "-5" "-4" "-3" "-2" "-1" "0" "1" "2" "3" "4" "5"
                   "6" "7"))
                 (:VALUES
                  ("-Saturday" "-Friday" "-Thursday" "-Wednesday" "-Tuesday"
                   "-Monday" "-Sunday" "ExactDayOfMonth" "Sunday" "Monday"
                   "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Job.RunMonth" "CIM_Job.RunDay"
                   "CIM_Job.RunStartInterval")))
                :INITFORM NIL)
               (RUNSTARTINTERVAL DATETIME :CIM-NAME "RunStartInterval"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The time interval after midnight when the Job should be processed. For example, 
00000000020000.000000:000 
indicates that the Job should be run on or after two o'clock, local time or UTC time (distinguished using the LocalOrUtcTime property.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Job.RunMonth" "CIM_Job.RunDay" "CIM_Job.RunDayOfWeek"
                   "CIM_Job.RunStartInterval")))
                :INITFORM NIL)
               (LOCALORUTCTIME UINT16 :CIM-NAME "LocalOrUtcTime" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "This property indicates whether the times represented in the RunStartInterval and UntilTime properties represent local times or UTC times. Time values are synchronized worldwide by using the enumeration value 2, \"UTC Time\".")
                 (:VALUE-MAP ("1" "2")) (:VALUES ("Local Time" "UTC Time")))
                :INITFORM NIL)
               (UNTILTIME DATETIME :CIM-NAME "UntilTime" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The time after which the Job is invalid or should be stopped. This time can be represented by an actual date and time, or by an interval relative to the time that this property is requested. A value of all nines indicates that the Job can run indefinitely.")
                 (:MODEL-CORRESPONDENCE ("CIM_Job.LocalOrUtcTime")))
                :INITFORM NIL)
               (NOTIFY STRING :CIM-NAME "Notify" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The User who is to be notified upon the Job completion or failure."))
                :INITFORM NIL)
               (OWNER STRING :CIM-NAME "Owner" :QUALIFIERS
                ((:DESCRIPTION
                  "The User that submitted the Job, or the Service or method name that caused the job to be created.")
                 (:MODEL-CORRESPONDENCE ("CIM_OwningJobElement")))
                :INITFORM NIL)
               (PRIORITY UINT32 :CIM-NAME "Priority" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Indicates the urgency or importance of execution of the Job. The lower the number, the higher the priority. Note that this property is also present in the JobProcessingStatistics class. This class is necessary to capture the setting information that would influence the results of a job."))
                :INITFORM NIL)
               (PERCENTCOMPLETE UINT16 :CIM-NAME "PercentComplete" :QUALIFIERS
                ((:DESCRIPTION
                  "The percentage of the job that has completed at the time that this value is requested. Note that this property is also present in the JobProcessingStatistics class. This class is necessary to capture the processing information for recurring Jobs, because only the 'last' run data can be stored in this single-valued property. 
Note that the value 101 is undefined and will be not be allowed in the next major revision of the specification.")
                 (NIL "Percent") (:MIN-VALUE "0") (:MAX-VALUE "101")
                 (:P-UNIT "percent"))
                :INITFORM NIL)
               (DELETEONCOMPLETION BOOLEAN :CIM-NAME "DeleteOnCompletion"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Indicates whether or not the job should be automatically deleted upon completion. Note that the 'completion' of a recurring job is defined by its JobRunTimes or UntilTime properties, or when the Job is terminated by manual intervention. If this property is set to false and the job completes, then the extrinsic method DeleteInstance must be used to delete the job instead of updating this property."))
                :INITFORM NIL)
               (ERRORCODE UINT16 :CIM-NAME "ErrorCode" :QUALIFIERS
                ((:DESCRIPTION
                  "A vendor-specific error code. The value must be set to zero if the Job completed without error. Note that this property is also present in the JobProcessingStatistics class. This class is necessary to capture the processing information for recurring Jobs, because only the 'last' run error can be stored in this single-valued property.")
                 (:MODEL-CORRESPONDENCE ("CIM_Job.ErrorDescription")))
                :INITFORM NIL)
               (ERRORDESCRIPTION STRING :CIM-NAME "ErrorDescription"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A free-form string that contains the vendor error description. Note that this property is also present in the JobProcessingStatistics class. This class is necessary to capture the processing information for recurring Jobs, because only the 'last' run error can be stored in this single-valued property.")
                 (:MODEL-CORRESPONDENCE ("CIM_Job.ErrorCode")))
                :INITFORM NIL)
               (RECOVERYACTION UINT16 :CIM-NAME "RecoveryAction" :QUALIFIERS
                ((:DESCRIPTION
                  "Describes the recovery action to be taken for an unsuccessfully run Job. The possible values are: 
0 = \"Unknown\", meaning it is unknown as to what recovery action to take 
1 = \"Other\", indicating that the recovery action will be specified in the OtherRecoveryAction property 
2 = \"Do Not Continue\", meaning stop the execution of the job and appropriately update its status 
3 = \"Continue With Next Job\", meaning continue with the next job in the queue 
4 = \"Re-run Job\", indicating that the job should be re-run 
5 = \"Run Recovery Job\", meaning run the Job associated using the RecoveryJob relationship. Note that the recovery Job must already be in the queue from which it will run.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "Other" "Do Not Continue" "Continue With Next Job"
                   "Re-run Job" "Run Recovery Job"))
                 (:MODEL-CORRESPONDENCE ("CIM_Job.OtherRecoveryAction")))
                :INITFORM NIL)
               (OTHERRECOVERYACTION STRING :CIM-NAME "OtherRecoveryAction"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the recovery action when the RecoveryAction property of the instance is 1 (\"Other\").")
                 (:MODEL-CORRESPONDENCE ("CIM_Job.RecoveryAction")))
                :INITFORM NIL)
               (INSTALLDATE DATETIME :CIM-NAME "InstallDate" :QUALIFIERS
                ((:DESCRIPTION
                  "A datetime value that indicates when the object was installed. Lack of a value does not indicate that the object is not installed.")
                 (:MAPPING-STRINGS ("MIF.DMTF|ComponentID|001.5")))
                :INITFORM NIL)
               (STATUS STRING :CIM-NAME "Status" :QUALIFIERS
                ((:DEPRECATED ("CIM_ManagedSystemElement.OperationalStatus"))
                 (:DESCRIPTION
                  "A string indicating the current status of the object. Various operational and non-operational statuses are defined. This property is deprecated in lieu of OperationalStatus, which includes the same semantics in its enumeration. This change is made for 3 reasons: 
1) Status is more correctly defined as an array. This definition overcomes the limitation of describing status using a single value, when it is really a multi-valued property (for example, an element might be OK AND Stopped. 
2) A MaxLen of 10 is too restrictive and leads to unclear enumerated values. 
3) The change to a uint16 data type was discussed when CIM V2.0 was defined. However, existing V1.0 implementations used the string property and did not want to modify their code. Therefore, Status was grandfathered into the Schema. Use of the deprecated qualifier allows the maintenance of the existing property, but also permits an improved definition using OperationalStatus.")
                 (:VALUE-MAP
                  ("OK" "Error" "Degraded" "Unknown" "Pred Fail" "Starting"
                   "Stopping" "Service" "Stressed" "NonRecover" "No Contact"
                   "Lost Comm" "Stopped"))
                 (:MAX-LEN "10"))
                :INITFORM NIL)
               (HEALTHSTATE UINT16 :CIM-NAME "HealthState" :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the current health of the element. This attribute expresses the health of this element but not necessarily that of its subcomponents. The possible values are 0 to 30, where 5 means the element is entirely healthy and 30 means the element is completely non-functional. The following continuum is defined: 
\"Non-recoverable Error\" (30) - The element has completely failed, and recovery is not possible. All functionality provided by this element has been lost. 
\"Critical Failure\" (25) - The element is non-functional and recovery might not be possible. 
\"Major Failure\" (20) - The element is failing. It is possible that some or all of the functionality of this component is degraded or not working. 
\"Minor Failure\" (15) - All functionality is available but some might be degraded. 
\"Degraded/Warning\" (10) - The element is in working order and all functionality is provided. However, the element is not working to the best of its abilities. For example, the element might not be operating at optimal performance or it might be reporting recoverable errors. 
\"OK\" (5) - The element is fully functional and is operating within normal operational parameters and without error. 
\"Unknown\" (0) - The implementation cannot report on HealthState at this time. 
DMTF has reserved the unused portion of the continuum for additional HealthStates in the future.")
                 (:VALUE-MAP
                  ("0" "5" "10" "15" "20" "25" "30" ".." "32768..65535"))
                 (:VALUES
                  ("Unknown" "OK" "Degraded/Warning" "Minor failure"
                   "Major failure" "Critical failure" "Non-recoverable error"
                   "DMTF Reserved" "Vendor Specific")))
                :INITFORM NIL)
               (COMMUNICATIONSTATUS UINT16 :CIM-NAME "CommunicationStatus"
                :QUALIFIERS
                ((:DESCRIPTION
                  "CommunicationStatus indicates the ability of the instrumentation to communicate with the underlying ManagedElement. CommunicationStatus consists of one of the following values: Unknown, None, Communication OK, Lost Communication, or No Contact. 
A Null return indicates the implementation (provider) does not implement this property. 
\"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"Not Available\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"Communication OK \" indicates communication is established with the element, but does not convey any quality of service. 
\"No Contact\" indicates that the monitoring system has knowledge of this element, but has never been able to establish communications with it. 
\"Lost Communication\" indicates that the Managed Element is known to exist and has been contacted successfully in the past, but is currently unreachable.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Not Available" "Communication OK"
                   "Lost Communication" "No Contact" "DMTF Reserved"
                   "Vendor Reserved")))
                :INITFORM NIL)
               (DETAILEDSTATUS UINT16 :CIM-NAME "DetailedStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "DetailedStatus compliments PrimaryStatus with additional status detail. It consists of one of the following values: Not Available, No Additional Information, Stressed, Predictive Failure, Error, Non-Recoverable Error, SupportingEntityInError. Detailed status is used to expand upon the PrimaryStatus of the element. 
A Null return indicates the implementation (provider) does not implement this property. 
\"Not Available\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"No Additional Information\" indicates that the element is functioning normally as indicated by PrimaryStatus = \"OK\". 
\"Stressed\" indicates that the element is functioning, but needs attention. Examples of \"Stressed\" states are overload, overheated, and so on. 
\"Predictive Failure\" indicates that an element is functioning normally but a failure is predicted in the near future. 
\"Non-Recoverable Error \" indicates that this element is in an error condition that requires human intervention. 
\"Supporting Entity in Error\" indicates that this element might be \"OK\" but that another element, on which it is dependent, is in error. An example is a network service or endpoint that cannot function due to lower-layer networking problems.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" ".." "0x8000.."))
                 (:VALUES
                  ("Not Available" "No Additional Information" "Stressed"
                   "Predictive Failure" "Non-Recoverable Error"
                   "Supporting Entity in Error" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.PrimaryStatus"
                   "CIM_ManagedSystemElement.HealthState")))
                :INITFORM NIL)
               (OPERATINGSTATUS UINT16 :CIM-NAME "OperatingStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "OperatingStatus provides a current status value for the operational condition of the element and can be used for providing more detail with respect to the value of EnabledState. It can also provide the transitional states when an element is transitioning from one state to another, such as when an element is transitioning between EnabledState and RequestedState, as well as other transitional conditions.
OperatingStatus consists of one of the following values: Unknown, Not Available, In Service, Starting, Stopping, Stopped, Aborted, Dormant, Completed, Migrating, Emmigrating, Immigrating, Snapshotting. Shutting Down, In Test 
A Null return indicates the implementation (provider) does not implement this property. 
\"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"None\" indicates that the implementation (provider) is capable of returning a value for this property, but not ever for this particular piece of hardware/software or the property is intentionally not used because it adds no meaningful information (as in the case of a property that is intended to add additional info to another property). 
\"Servicing\" describes an element being configured, maintained, cleaned, or otherwise administered. 
\"Starting\" describes an element being initialized. 
\"Stopping\" describes an element being brought to an orderly stop. 
\"Stopped\" and \"Aborted\" are similar, although the former implies a clean and orderly stop, while the latter implies an abrupt stop where the state and configuration of the element might need to be updated. 
\"Dormant\" indicates that the element is inactive or quiesced. 
\"Completed\" indicates that the element has completed its operation. This value should be combined with either OK, Error, or Degraded in the PrimaryStatus so that a client can tell if the complete operation Completed with OK (passed), Completed with Error (failed), or Completed with Degraded (the operation finished, but it did not complete OK or did not report an error). 
\"Migrating\" element is being moved between host elements. 
\"Immigrating\" element is being moved to new host element. 
\"Emigrating\" element is being moved away from host element. 
\"Shutting Down\" describes an element being brought to an abrupt stop. 
\"In Test\" element is performing test functions. 
\"Transitioning\" describes an element that is between states, that is, it is not fully available in either its previous state or its next state. This value should be used if other values indicating a transition to a specific state are not applicable.
\"In Service\" describes an element that is in service and operational.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Not Available" "Servicing" "Starting" "Stopping"
                   "Stopped" "Aborted" "Dormant" "Completed" "Migrating"
                   "Emigrating" "Immigrating" "Snapshotting" "Shutting Down"
                   "In Test" "Transitioning" "In Service" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_EnabledLogicalElement.EnabledState")))
                :INITFORM NIL)
               (PRIMARYSTATUS UINT16 :CIM-NAME "PrimaryStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "PrimaryStatus provides a high level status value, intended to align with Red-Yellow-Green type representation of status. It should be used in conjunction with DetailedStatus to provide high level and detailed health status of the ManagedElement and its subcomponents. 
PrimaryStatus consists of one of the following values: Unknown, OK, Degraded or Error. \"Unknown\" indicates the implementation is in general capable of returning this property, but is unable to do so at this time. 
\"OK\" indicates the ManagedElement is functioning normally. 
\"Degraded\" indicates the ManagedElement is functioning below normal. 
\"Error\" indicates the ManagedElement is in an Error condition.")
                 (:VALUE-MAP ("0" "1" "2" "3" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "OK" "Degraded" "Error" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.DetailedStatus"
                   "CIM_ManagedSystemElement.HealthState")))
                :INITFORM NIL)
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
                :INITFORM NIL)
               (OPERATIONALSTATUS (ARRAY UINT16) :CIM-NAME "OperationalStatus"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Indicates the current statuses of the element. Various operational statuses are defined. Many of the enumeration's values are self-explanatory. However, a few are not and are described here in more detail. 
\"Stressed\" indicates that the element is functioning, but needs attention. Examples of \"Stressed\" states are overload, overheated, and so on. 
\"Predictive Failure\" indicates that an element is functioning nominally but predicting a failure in the near future. 
\"In Service\" describes an element being configured, maintained, cleaned, or otherwise administered. 
\"No Contact\" indicates that the monitoring system has knowledge of this element, but has never been able to establish communications with it. 
\"Lost Communication\" indicates that the ManagedSystem Element is known to exist and has been contacted successfully in the past, but is currently unreachable. 
\"Stopped\" and \"Aborted\" are similar, although the former implies a clean and orderly stop, while the latter implies an abrupt stop where the state and configuration of the element might need to be updated. 
\"Dormant\" indicates that the element is inactive or quiesced. 
\"Supporting Entity in Error\" indicates that this element might be \"OK\" but that another element, on which it is dependent, is in error. An example is a network service or endpoint that cannot function due to lower-layer networking problems. 
\"Completed\" indicates that the element has completed its operation. This value should be combined with either OK, Error, or Degraded so that a client can tell if the complete operation Completed with OK (passed), Completed with Error (failed), or Completed with Degraded (the operation finished, but it did not complete OK or did not report an error). 
\"Power Mode\" indicates that the element has additional power model information contained in the Associated PowerManagementService association. 
\"Relocating\" indicates the element is being relocated.
OperationalStatus replaces the Status property on ManagedSystemElement to provide a consistent approach to enumerations, to address implementation needs for an array property, and to provide a migration path from today's environment to the future. This change was not made earlier because it required the deprecated qualifier. Due to the widespread use of the existing Status property in management applications, it is strongly recommended that providers or instrumentation provide both the Status and OperationalStatus properties. Further, the first value of OperationalStatus should contain the primary status for the element. When instrumented, Status (because it is single-valued) should also provide the primary status of the element.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" ".." "0x8000.."))
                 (:VALUES
                  ("Unknown" "Other" "OK" "Degraded" "Stressed"
                   "Predictive Failure" "Error" "Non-Recoverable Error"
                   "Starting" "Stopping" "Stopped" "In Service" "No Contact"
                   "Lost Communication" "Aborted" "Dormant"
                   "Supporting Entity in Error" "Completed" "Power Mode"
                   "Relocating" "DMTF Reserved" "Vendor Reserved"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.StatusDescriptions")))
                :INITFORM NIL)
               (STATUSDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "StatusDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "Strings describing the various OperationalStatus array values. For example, if \"Stopping\" is the value assigned to OperationalStatus, then this property may contain an explanation as to why an object is being stopped. Note that entries in this array are correlated with those at the same array index in OperationalStatus.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_ManagedSystemElement.OperationalStatus")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_ConcreteJob")
              (:QUALIFIERS (:VERSION "2.38.0")
               (:UML-PACKAGE-PATH "CIM::Core::CoreElements")
               (:DESCRIPTION
                "A concrete version of Job. This class represents a generic and instantiable unit of work, such as a batch or a print job.")))
(DEFCIM-METHOD REQUESTSTATECHANGE
    ((INSTANCE CIM_CONCRETEJOB)
     (REQUESTEDSTATE UINT16 "RequestedState"
      (:DESCRIPTION
       "RequestStateChange changes the state of a job. The possible values are as follows: 
Start (2) changes the state to 'Running'. 
Suspend (3) stops the job temporarily. The intention is to subsequently restart the job with 'Start'. It might be possible to enter the 'Service' state while suspended. (This is job-specific.) 
Terminate (4) stops the job cleanly, saving data, preserving the state, and shutting down all underlying processes in an orderly manner. 
Kill (5) terminates the job immediately with no requirement to save data or preserve the state. 
Service (6) puts the job into a vendor-specific service state. It might be possible to restart the job.")
      (:VALUE-MAP ("2" "3" "4" "5" "6" "7..32767" "32768..65535"))
      (:VALUES
       ("Start" "Suspend" "Terminate" "Kill" "Service" "DMTF Reserved"
        "Vendor Reserved")))
     (TIMEOUTPERIOD DATETIME "TimeoutPeriod"
      (:DESCRIPTION
       "A timeout period that specifies the maximum amount of time that the client expects the transition to the new state to take. The interval format must be used to specify the TimeoutPeriod. A value of 0 or a null parameter indicates that the client has no time requirements for the transition. 
If this property does not contain 0 or null and the implementation does not support this parameter, a return code of 'Use Of Timeout Parameter Not Supported' must be returned.")))
    ((:CIM-NAME "RequestStateChange")
     (:QUALIFIERS
      (:DESCRIPTION
       "Requests that the state of the job be changed to the value specified in the RequestedState parameter. Invoking the RequestStateChange method multiple times could result in earlier requests being overwritten or lost. 
If 0 is returned, then the task completed successfully. Any other return code indicates an error condition.")
      (:VALUE-MAP
       ("0" "1" "2" "3" "4" "5" "6" ".." "4096" "4097" "4098" "4099"
        "4100..32767" "32768..65535"))
      (:VALUES
       ("Completed with No Error" "Not Supported" "Unknown/Unspecified Error"
        "Can NOT complete within Timeout Period" "Failed" "Invalid Parameter"
        "In Use" "DMTF Reserved"
        "Method Parameters Checked - Transition Started"
        "Invalid State Transition" "Use of Timeout Parameter Not Supported"
        "Busy" "Method Reserved" "Vendor Specific")))))
(DEFCIM-METHOD GETERROR
    ((INSTANCE CIM_CONCRETEJOB)
     (ERROR STRING "Error" :OUT
            (:DESCRIPTION
             "If the OperationalStatus on the Job is not \"OK\", then this method will return a CIM Error instance. Otherwise, when the Job is \"OK\", null is returned.")
            (:EMBEDDED-INSTANCE "CIM_Error")))
    ((:CIM-NAME "GetError")
     (:QUALIFIERS (:DEPRECATED ("CIM_ConcreteJob.GetErrors"))
      (:DESCRIPTION
       "GetError is deprecated because Error should be an array,not a scalar.
When the job is executing or has terminated without error, then this method returns no CIM_Error instance. However, if the job has failed because of some internal problem or because the job has been terminated by a client, then a CIM_Error instance is returned.")
      (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" ".." "32768..65535"))
      (:VALUES
       ("Success" "Not Supported" "Unspecified Error" "Timeout" "Failed"
        "Invalid Parameter" "Access Denied" "DMTF Reserved"
        "Vendor Specific")))))
(DEFCIM-METHOD GETERRORS
    ((INSTANCE CIM_CONCRETEJOB)
     (ERRORS (ARRAY STRING) "Errors" :OUT
      (:DESCRIPTION
       "If the OperationalStatus on the Job is not \"OK\", then this method will return one or more CIM Error instance(s). Otherwise, when the Job is \"OK\", null is returned.")
      (:EMBEDDED-INSTANCE "CIM_Error")))
    ((:CIM-NAME "GetErrors")
     (:QUALIFIERS
      (:DESCRIPTION
       "If JobState is \"Completed\" and Operational Status is \"Completed\" then no instance of CIM_Error is returned. 
If JobState is \"Exception\" then GetErrors may return intances of CIM_Error related to the execution of the procedure or method invoked by the job.
If Operatational Status is not \"OK\" or \"Completed\"then GetErrors may return CIM_Error instances related to the running of the job.")
      (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" ".." "32768..65535"))
      (:VALUES
       ("Success" "Not Supported" "Unspecified Error" "Timeout" "Failed"
        "Invalid Parameter" "Access Denied" "DMTF Reserved"
        "Vendor Specific")))))
(DEFCIM-METHOD KILLJOB
    ((INSTANCE CIM_CONCRETEJOB)
     (DELETEONKILL BOOLEAN "DeleteOnKill" :IN
      (:DESCRIPTION
       "Indicates whether or not the Job should be automatically deleted upon termination. This parameter takes precedence over the property, DeleteOnCompletion.")))
    ((:CIM-NAME "KillJob")
     (:QUALIFIERS (:DEPRECATED ("CIM_ConcreteJob.RequestStateChange()"))
      (:DESCRIPTION
       "KillJob is being deprecated because there is no distinction made between an orderly shutdown and an immediate kill. CIM_ConcreteJob.RequestStateChange() provides 'Terminate' and 'Kill' options to allow this distinction. 
A method to kill this job and any underlying processes, and to remove any 'dangling' associations.")
      (:VALUE-MAP ("0" "1" "2" "3" "4" "6" "7" ".." "32768..65535"))
      (:VALUES
       ("Success" "Not Supported" "Unknown" "Timeout" "Failed" "Access Denied"
        "Not Found" "DMTF Reserved" "Vendor Specific")))))