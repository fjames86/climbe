
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_PrintJob.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_PRINTJOB (CIM_JOB)
              ((SYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "SystemCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "The CreationClassName of the scoping System.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_PrintQueue.SystemCreationClassName"))
                :INITFORM NIL)
               (SYSTEMNAME STRING :CIM-NAME "SystemName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The Name of the scoping System.")
                 (:MAX-LEN "256")
                 (:MAPPING-STRINGS ("MIB.IETF|SNMPv2-MIB.sysName"))
                 (:PROPOGATED "CIM_PrintQueue.SystemName"))
                :INITFORM NIL)
               (QUEUECREATIONCLASSNAME STRING :CIM-NAME
                "QueueCreationClassName" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION "The CreationClassName of the scoping Queue.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_PrintQueue.CreationClassName"))
                :INITFORM NIL)
               (QUEUENAME STRING :CIM-NAME "QueueName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The Name of the scoping Queue.")
                 (:MAX-LEN "256")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Job-Monitoring-MIB.jmGeneralJobSetName"
                   "MIB.IETF|Job-Monitoring-MIB.queueNameRequested"
                   "RFC2911.IETF|Job.output-device-assigned"))
                 (:PROPOGATED "CIM_PrintQueue.Name"))
                :INITFORM NIL)
               (JOBSTATUS STRING :CIM-NAME "JobStatus" :QUALIFIERS
                ((:OVERRIDE "JobStatus")
                 (:DESCRIPTION
                  "The inherited JobStatus is used to provide additional information about the status of a PrintJob beyond that enumerated by PrintJobStatus.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Job-Monitoring-MIB.jmJobState"
                   "MIB.IETF|Job-Monitoring-MIB.jmJobStateReasons1"
                   "RFC2911.IETF|Job.job-state"
                   "RFC2911.IETF|Job.job-state-reasons"
                   "RFC2911.IETF|Job.job-state-message"))
                 (:MODEL-CORRESPONDENCE ("CIM_PrintJob.PrintJobStatus")))
                :INITFORM NIL)
               (JOBID STRING :CIM-NAME "JobID" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "Uniquely identifies this Job within its scoping Queue, but NOT across different Queues or PrintServices.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Job-Monitoring-MIB.jmJobIndex"
                   "MIB.IETF|Job-Monitoring-MIB.jmJobSubmissionID"
                   "RFC2911.IETF|Job.job-id")))
                :INITFORM NIL)
               (SCHEDULINGINFORMATION STRING :CIM-NAME "SchedulingInformation"
                :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Note: The use of this free-form string property is deprecated in lieu of the more semantically rich CIM_JobSettingData class inherited from CIM_Job."))
                :INITFORM NIL)
               (JOBSIZE UINT32 :CIM-NAME "JobSize" :QUALIFIERS
                ((:DESCRIPTION
                  "Specifies the size of the PrintJob (as a byte stream) in units of Kbytes.")
                 (NIL "KiloBytes")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Job-Monitoring-MIB.jmJobKOctetsProcessed"
                   "RFC2911.IETF|Job.job-k-octets"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Printer.MaxSizeSupported" "CIM_PrintQueue.MaxJobSize"))
                 (:P-UNIT "byte * 10^3"))
                :INITFORM NIL)
               (LANGUAGE UINT16 :CIM-NAME "Language" :QUALIFIERS
                ((:DEPRECATED ("CIM_PrintJob.MimeTypes"))
                 (:DESCRIPTION
                  "Note: The use of this property has been deprecated, due to ambiguity. Instead use MimeTypes. 
Enumerated print languages are only available in the IETF Printer MIB v1/v2 (RFC 1759/3805) and are not available in open standard print protocols (i.e., no known mapping). 
Deprecated description: 
Specifies the print language that is used by this Job. 
Note: For legacy compatiblity reasons, this property is NOT exactly aligned (in order of values) with the authoritative PrtInterpreterLangFamilyTC in the IANA Printer MIB, unlike the newer property PrintInterpreter.LangType (which is exactly aligned with the IANA Printer MIB).")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14"
                   "15" "16" "17" "18" "19" "20" "21" "22" "23" "24" "25" "26"
                   "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38"
                   "39" "40" "41" "42" "43" "44" "45" "46" "47" "48" "50" "51"
                   "52" "53" "54" "55" "56" "57" "58" "59" "60" "61" "62" "63"
                   "64" "65" "66" "67" "68" "69" ".."))
                 (:VALUES
                  ("Other" "Unknown" "PCL" "HPGL" "PJL" "PS" "PSPrinter" "IPDS"
                   "PPDS" "EscapeP" "Epson" "DDIF" "Interpress" "ISO6429"
                   "Line Data" "MODCA" "REGIS" "SCS" "SPDL" "TEK4014" "PDS"
                   "IGP" "CodeV" "DSCDSE" "WPS" "LN03" "CCITT" "QUIC" "CPAP"
                   "DecPPL" "Simple Text" "NPAP" "DOC" "imPress" "Pinwriter"
                   "NPDL" "NEC201PL" "Automatic" "Pages" "LIPS" "TIFF"
                   "Diagnostic" "CaPSL" "EXCL" "LCDS" "XES" "MIME" "TIPSI"
                   "Prescribe" "LinePrinter" "IDP" "XJCL" "PDF" "RPDL"
                   "IntermecIPL" "UBIFingerprint" "UBIDirectProtocol" "Fujitsu"
                   "PCLXL" "ART" "CGM" "JPEG" "CALS1" "CALS2" "NIRS" "C4" "XPS"
                   "OpenXPS" "DMTF Reserved"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Printer-MIB.prtInterpreterLangFamily"
                   "MIB.IETF|IANA-PRINTER-MIB.PrtInterpreterLangFamilyTC"
                   "MIB.IETF|Job-Monitoring-MIB.documentFormat"
                   "PWG5100-7.PWG|Job.document-format-supplied"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Printer.LanguagesSupported"
                   "CIM_PrintService.LanguagesSupported"
                   "CIM_PrintJob.MimeTypes")))
                :INITFORM NIL)
               (REQUIREDPAPERTYPE STRING :CIM-NAME "RequiredPaperType"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A string that specifies the type of paper that is required by this PrintJob. The values of the property SHOULD conform to the requirements of the PWG Media Standardized Names specification [PWG5101.1], which defines the normative values for this property. See older Appendix B 'Media Size Names' and Appendix C 'Media Names' of IETF Printer MIB v2 [RFC3805] which list the values of standardized media names defined in ISO DPA [ISO10175].")
                 (:MAPPING-STRINGS
                  ("PWG5101-1.PWG|Media Standardized Names"
                   "MIB.IETF|Job-Monitoring-MIB.mediumRequested"
                   "RFC2911.IETF|Job.media"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Printer.PaperTypesAvailable"
                   "CIM_PrintService.PaperTypesAvailable")))
                :INITFORM NIL)
               (COPIES UINT32 :CIM-NAME "Copies" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of physical copies of the output that will be produced from this Job.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Job-Monitoring-MIB.jobCopiesRequested"
                   "RFC2911.IETF|Job.copies"))
                 (:MODEL-CORRESPONDENCE ("CIM_Printer.MaxCopies")))
                :INITFORM NIL)
               (HORIZONTALRESOLUTION UINT32 :CIM-NAME "HorizontalResolution"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The resolution of the in Pixels per Inch for the Job in the cross-feed direction, i.e., short-edge in portrait feed mode.")
                 (NIL "Pixels per Inch")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Job-Monitoring-MIB.printerResolutionRequested"
                   "RFC2911.IETF|Job.printer-resolution"))
                 (:MODEL-CORRESPONDENCE ("CIM_Printer.HorizontalResolution"))
                 (:P-UNIT "pixel / inch"))
                :INITFORM NIL)
               (VERTICALRESOLUTION UINT32 :CIM-NAME "VerticalResolution"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The resolution in Pixels per Inch for the Job in the feed direction, i.e., long-edge in portrait feed mode.")
                 (NIL "Pixels per Inch")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Job-Monitoring-MIB.printerResolutionRequested"
                   "RFC2911.IETF|Job.printer-resolution"))
                 (:MODEL-CORRESPONDENCE ("CIM_Printer.VerticalResolution"))
                 (:P-UNIT "pixel / inch"))
                :INITFORM NIL)
               (CHARSET STRING :CIM-NAME "CharSet" :QUALIFIERS
                ((:DESCRIPTION
                  "Specifies the character set and encoding method that should be used by the Printer for the management of this Job. The strings should conform to the semantics and syntax that are specified by section 4.1.2 'Charset parameter' in RFC 2046 (MIME Part 2) and contained in the IANA character-set registry. Examples include 'utf-8', 'us-ascii', and 'iso-8859-1'.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Job-Monitoring-MIB.jobCodedCharSet"
                   "MIB.IETF|IANA-CHARSET-MIB.IANACharset"
                   "RFC2911.IETF|Job.attributes-charset"))
                 (:MODEL-CORRESPONDENCE ("CIM_Printer.CharSetsSupported")))
                :INITFORM NIL)
               (NATURALLANGUAGE STRING :CIM-NAME "NaturalLanguage" :QUALIFIERS
                ((:DESCRIPTION
                  "Identifies the language that should be used by the Printer for the management of this Job. The specified value should conform to RFC 5646. For example, 'en' is used for English.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Job-Monitoring-MIB.jobNaturalLanguageTag"
                   "RFC2911.IETF|Job.attributes-natural-language"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Printer.NaturalLanguagesSupported")))
                :INITFORM NIL)
               (NUMBERUP UINT32 :CIM-NAME "NumberUp" :QUALIFIERS
                ((:DESCRIPTION
                  "The number of print-stream pages that should be rendered onto a single media sheet when the Printer outputs this PrintJob.")
                 (:MAPPING-STRINGS ("RFC2911.IETF|Job.number-up"))
                 (:MODEL-CORRESPONDENCE ("CIM_Printer.MaxNumberUp")))
                :INITFORM NIL)
               (PRINTJOBSTATUS UINT16 :CIM-NAME "PrintJobStatus" :QUALIFIERS
                ((:DESCRIPTION
                  "Describes the current state of this Job with respect to the PrintQueue and the Printer. Additional information can be specified in JobStatus. 
1 (Other) means this Job is in some non-standard state. 
2 (Unknown) means this Job is in an unknown state. 
3 (Pending) maps to IPP job-state 'pending'. 
4 (Blocked) maps to IPP job-state 'pending-held'. 
5 (Completed) maps to IPP job-state 'completed'. 
6 (Completed With Error) maps to IPP job-state 'completed' in combination with IPP job-state-reasons 'completed-with-errors'. 
7 (Printing) maps to IPP job-state 'processing'. 
8 (Processing Stopped) maps to IPP job-state 'processing-stopped'. 
9 (Canceled) maps to IPP job-state 'canceled'. 
10 (Aborted) maps to IPP job-state 'aborted'.")
                 (:VALUE-MAP ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10"))
                 (:VALUES
                  ("Other" "Unknown" "Pending" "Blocked" "Complete"
                   "Completed With Error" "Printing" "Processing Stopped"
                   "Canceled" "Aborted"))
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Job-Monitoring-MIB.jmJobState"
                   "RFC2911.IETF|Job.job-state"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PrintJob.TimeCompleted" "CIM_PrintJob.JobStatus")))
                :INITFORM NIL)
               (TIMECOMPLETED DATETIME :CIM-NAME "TimeCompleted" :QUALIFIERS
                ((:DESCRIPTION
                  "The time when this Job was completed. This value is valid only if the PrintJobStatus has been assigned to 'Complete' or 'Completed With Error'.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Job-Monitoring-MIB.jobCompletionTime"
                   "RFC2911.IETF|Job.date-time-at-completed"))
                 (:MODEL-CORRESPONDENCE ("CIM_PrintJob.PrintJobStatus")))
                :INITFORM NIL)
               (JOBORIGINATION STRING :CIM-NAME "JobOrigination" :QUALIFIERS
                ((:DESCRIPTION
                  "Provides additional information, beyond Job Owner that is inherited from CIM_Job, to identify the origins of the PrintJob. This property could include information such as the System, Application, or Process that created the Job.")
                 (:MAPPING-STRINGS
                  ("MIB.IETF|Job-Monitoring-MIB.jobOriginatingHost"
                   "MIB.IETF|Job-Monitoring-MIB.submittingServerName"
                   "MIB.IETF|Job-Monitoring-MIB.submittingApplicationName"
                   "RFC2911.IETF|Job.job-originating-user-name")))
                :INITFORM NIL)
               (ELAPSEDTIME DATETIME :CIM-NAME "ElapsedTime" :QUALIFIERS
                ((:OVERRIDE "ElapsedTime")
                 (:DESCRIPTION
                  "The processing elapsed time of this instance of PrintJob, after the Job has completed. 
Note: This property is NOT meaningful before PrintJob completion.")
                 (:MAPPING-STRINGS
                  ("RFC2911.IETF|Section 4.3.14.3 time-at-completed"
                   "RFC2911.IETF|Section 4.3.14.7 date-time-at-completed"))
                 (:MODEL-CORRESPONDENCE ("CIM_PrintJob.TimeCompleted")))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "The user-friendly name for this instance of PrintJob. In addition, the user-friendly name can be used as an index property for a search or query. (Note: The name does not have to be unique within a namespace.) This name shall be supplied by the client or generated by the PrintService (if missing in job creation operation).")
                 (:MAPPING-STRINGS ("RFC2911.IETF|Section 4.3.5 job-name")))
                :INITFORM NIL)
               (STARTTIME DATETIME :CIM-NAME "StartTime" :QUALIFIERS
                ((:OVERRIDE "StartTime")
                 (:DESCRIPTION
                  "The processing start time of this instance of PrintJob.")
                 (:MAPPING-STRINGS
                  ("RFC2911.IETF|Section 4.3.14.2 time-at-processing"
                   "RFC2911.IETF|Section 4.3.14.6 date-time-at-processing")))
                :INITFORM NIL)
               (TIMESUBMITTED DATETIME :CIM-NAME "TimeSubmitted" :QUALIFIERS
                ((:OVERRIDE "TimeSubmitted")
                 (:DESCRIPTION
                  "The creation time of this instance of PrintJob.")
                 (:MAPPING-STRINGS
                  ("RFC2911.IETF|Section 4.3.14.1 time-at-creation"
                   "RFC2911.IETF|Section 4.3.14.5 date-time-at-creation")))
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
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                ((:DESCRIPTION
                  "The Name property defines the label by which the object is known. When subclassed, the Name property can be overridden to be a Key property.")
                 (:MAX-LEN "1024"))
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
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                ((:DESCRIPTION
                  "InstanceID is an optional property that may be used to opaquely and uniquely identify an instance of this class within the scope of the instantiating Namespace. Various subclasses of this class may override this property to make it required, or a key. Such subclasses may also modify the preferred algorithms for ensuring uniqueness that are defined below.
To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> must include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> must not contain a colon (:). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements. If not null and the above \"preferred\" algorithm is not used, the defining entity must assure that the resulting InstanceID is not reused across any InstanceIDs produced by this or other providers for the NameSpace of this instance. 
If not set to null for DMTF-defined instances, the \"preferred\" algorithm must be used with the <OrgID> set to CIM."))
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
               (MIMETYPES (ARRAY STRING) :CIM-NAME "MimeTypes" :QUALIFIERS
                ((:DESCRIPTION
                  "Specifies the MIME types that are used by the PrintJob.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_PrintJob.Language" "CIM_Printer.MimeTypesSupported"
                   "CIM_PrintService.MimeTypesSupported")))
                :INITFORM NIL)
               (FINISHING (ARRAY UINT16) :CIM-NAME "Finishing" :QUALIFIERS
                ((:DESCRIPTION
                  "Note: The use of this property will been deprecated due to ambiguity in a future version. Instead use the experimental property Finishings. 
Enumerated finishings are not available in open standard print protocols (i.e., no known mapping). 
Deprecated description: 
An array of integers that indicates the type of finishing that is required by this Job. It is equivalent to the Capabilities property that is provided by the Printer.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15" "16" "17" "18" "19" "20" "21"))
                 (:VALUES
                  ("Unknown" "Other" "Color Printing" "Duplex Printing"
                   "Copies" "Collation" "Stapling" "Transparency Printing"
                   "Punch" "Cover" "Bind" "Black and White Printing"
                   "One Sided" "Two Sided Long Edge" "Two Sided Short Edge"
                   "Portrait" "Landscape" "Reverse Portrait"
                   "Reverse Landscape" "Quality High" "Quality Normal"
                   "Quality Low"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_Printer.Capabilities"
                   "CIM_PrintService.Capabilities")))
                :INITFORM NIL)
               (REQUIREDJOBSHEETS (ARRAY STRING) :CIM-NAME "RequiredJobSheets"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Describes the job sheets that should be used when this Job is output on the Printer. 
Complete standard values are in the IANA IPP Registry. 
Additional vendor or site values may also be used. 
Standard values defined in IPP/1.1 (RFC 2911) include: 
Value 'none' indicates no job start/end sheets. 
Value 'standard' indicates one or more site-specific standard job sheets.")
                 (:MAPPING-STRINGS ("RFC2911.IETF|Job.job-sheets"))
                 (:MODEL-CORRESPONDENCE ("CIM_Printer.AvailableJobSheets")))
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
              (:CIM-NAME "CIM_PrintJob")
              (:QUALIFIERS (:VERSION "2.29.0")
               (:UML-PACKAGE-PATH "CIM::Device::Printing")
               (:DESCRIPTION
                "Description of a print request that is either waiting on a Queue for a Printer to become available or in the process of being output on a Printer, or that has previously been printed on a Printer. PrintJobs are weak to their current Queue, or to the last Queue that held them. The ABNF for CIM references to PWG Standards and MIBs is in the directory 'ftp://ftp.pwg.org/pub/pwg/general/process' in the file 'pwg-cim-references-format-20060309.txt'. An example for a MappingStrings reference to a PWG Standard is 'PWG5101-1.PWG|Section 4 Media Color Names'. An example for a MappingStrings reference to a PWG MIB is 'MIB.PWG|PWG-IMAGING-COUNTER-MIB.icMonitorCompletedJobs'.")))
(DEFCIM-METHOD KILLJOB
    ((INSTANCE CIM_PRINTJOB)
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