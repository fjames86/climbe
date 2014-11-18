
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DiagnosticSettingData.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DIAGNOSTICSETTINGDATA (CIM_SETTINGDATA)
              ((HALTONERROR BOOLEAN :CIM-NAME "HaltOnError" :QUALIFIERS
                ((:DESCRIPTION
                  "When this flag is true, the test will halt after finding the first error."))
                :INITFORM NIL)
               (QUICKMODE BOOLEAN :CIM-NAME "QuickMode" :QUALIFIERS
                ((:DESCRIPTION
                  "When this flag is true, the test software should attempt to run in an accelerated fashion either by reducing the coverage or number of tests performed."))
                :INITFORM NIL)
               (PERCENTOFTESTCOVERAGE UINT8 :CIM-NAME "PercentOfTestCoverage"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Requests the diagnostic software to reduce test coverage to the specified percentage. For example, a hard drive scan test could be asked to run at 50%. The most effective way to accomplish this is for the test software to scan every other track, as opposed to only scanning the first half of a drive. It is assumed that the effectiveness of the test is impacted proportional to the percentage of testing requested. Permissible values for this property range from 0 to 100.")
                 (NIL "Percent") (:MIN-VALUE "0") (:MAX-VALUE "100")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticServiceCapabilities.SupportedServiceModes"))
                 (:P-UNIT "percent"))
                :INITFORM NIL)
               (RESULTPERSISTENCE UINT32 :CIM-NAME "ResultPersistence"
                :QUALIFIERS
                ((:DESCRIPTION
                  "The ResultPersistence property is a directive from a diagnostic client to a diagnostic provider. It allows the client to specify to the diagnostic service provider how long to persist the messages that result from execution of a diagnostic service. This applies to instances of DiagnosticResult as well as the preferred use of DiagnosticServiceRecord. The timeout period starts upon completion of the diagnostic action described by the DiagnosticService. 

Here is a summary of the choices and behaviors for different ResultPersistence values: 
0 = \"No Persistence\": 
Setting the timer to zero tells the provider not to persist the diagnostic result. The diagnostic information is only available while the diagnostic is executing or at its conclusion. 
Value > 0 and < 0xFFFFFFFF = \"Persist With TimeOut\": 
Setting the ResultPersistenceOption to a integer will cause the DiagnosticResult to be persisted for that number of seconds. At the end of that time, the DiagnosticResult may be deleted by the diagnostic service provider. 
0xFFFFFFFF = \"Persist Forever\": 
By setting the timeout value to the very large value, 0xFFFFFFFF, the provider shall persist results forever. In this case, the client MUST bear the responsibility for deleting them.")
                 (NIL "Seconds") (:P-UNIT "second"))
                :INITFORM NIL)
               (QUERYTIMEOUT UINT32 :CIM-NAME "QueryTimeout" :QUALIFIERS
                ((:DESCRIPTION
                  "The time the Job should wait for a query response. before using a default response and continuing execution. A default response could result in a cancellation of the Job. The timeout value starts at the time the Job goes into the QueryPending state. 
0 = \"Do not query\": 
Setting the timer to zero tells the provider not to query but use the default response. 
Value > 0 and < 0xFFFFFFFF = \"Query With TimeOut\": 
Setting the QueryTimeout to a integer will cause the Job to wait for that number of seconds. At the end of that time, the Job will use the default response and continue execution. 
0xFFFFFFFF = \"Wait Forever\": 
By setting the timeout value to the very large value, 0xFFFFFFFF, the job shall wait forever for a response. In this case, the client MUST bear the responsibility for responding to the query.")
                 (NIL "Seconds") (:P-UNIT "second"))
                :INITFORM "0")
               (NONDESTRUCTIVE BOOLEAN :CIM-NAME "NonDestructive" :QUALIFIERS
                ((:DESCRIPTION
                  "The test should only run non-destructive tests."))
                :INITFORM "false")
               (INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. To ensure uniqueness within the NameSpace, the value of InstanceID should be constructed using the following \"preferred\" algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon (:), and where <OrgID> must include a copyrighted, trademarked, or otherwise unique name that is owned by the business entity that is creating or defining the InstanceID or that is a registered ID assigned to the business entity by a recognized global authority. (This requirement is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness, <OrgID> must not contain a colon (:). When using this algorithm, the first colon to appear in InstanceID must appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and should not be reused to identify different underlying (real-world) elements. If the above \"preferred\" algorithm is not used, the defining entity must assure that the resulting InstanceID is not reused across any InstanceIDs produced by this or other providers for the NameSpace of this instance. 
For DMTF-defined instances, the \"preferred\" algorithm must be used with the <OrgID> set to CIM."))
                :INITFORM NIL)
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                (:REQUIRED (:OVERRIDE "ElementName")
                 (:DESCRIPTION
                  "The user-friendly name for this instance of SettingData. In addition, the user-friendly name can be used as an index property for a search or query. (Note: The name does not have to be unique within a namespace.)"))
                :INITFORM NIL)
               (CHANGEABLETYPE UINT16 :CIM-NAME "ChangeableType" :QUALIFIERS
                ((:DESCRIPTION
                  "Enumeration indicating the type of setting. 0 \"Not Changeable - Persistent\" indicates the instance of SettingData represents primordial settings and shall not be modifiable. 1 \"Changeable - Transient\" indicates the SettingData represents modifiable settings that are not persisted. Establishing persistent settings from transient settings may be supported. 2 \"Changeable - Persistent\" indicates the SettingData represents a persistent configuration that may be modified. 3 \"Not Changeable - Transient\" indicates the SettingData represents a snapshot of the settings of the associated ManagedElement and is not persistent.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES
                  ("Not Changeable - Persistent" "Changeable - Transient"
                   "Changeable - Persistent" "Not Changeable - Transient")))
                :INITFORM NIL)
               (CONFIGURATIONNAME STRING :CIM-NAME "ConfigurationName"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An instance of CIM_SettingData may correspond to a well-known configuration that exists for an associated CIM_ManagedElement. If the ConfigurationName property is non-NULL, the instance of CIM_SettingData shall correspond to a well-known configuration for a Managed Element, the value of the ConfigurationName property shall be the name of the configuration, and the ChangeableType property shall have the value 0 or 2. A value of NULL for the ConfigurationName property shall mean that the instance of CIM_SettingData does not correspond to a well-known configuration for a Managed Element or that this information is unknown."))
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
               (LOOPCONTROLPARAMETER (ARRAY STRING) :CIM-NAME
                "LoopControlParameter" :QUALIFIERS
                ((:DESCRIPTION
                  "Array entries contain parameters corresponding to entries in the LoopControl array, limiting the number of times a test should be repeated with a single invocation of a test method by a CIM client.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticSettingData.LoopControl")))
                :INITFORM NIL)
               (LOOPCONTROL (ARRAY UINT16) :CIM-NAME "LoopControl" :QUALIFIERS
                ((:DESCRIPTION
                  "LoopControl, used in conjunction with LoopControlParameter, sets one or more loop control mechanisms that limits the number of times a test should be repeated with a single invocation of a test method by a CIM client. There is an array-positional correspondence between LoopControl entries & LoopControlParameter entries. The entries in these coupled arrays of loop controls can be used in a logical OR fashion to achieve the desired loop control. For example, if a client wants to loop a test 1000 times, but quit if a timer runs out, it could set both controls into the LoopControl array as two separate entries in each array. The looping test will terminate when the first of the two Ored conditions are met. 
The descriptions for each loop control are given below: 
Unknown (0) 
Other (1) : Additional detail may be found in OtherLoopControlDescriptions. 
Continuous (2) : The corresponding LoopControl Parameter is ignored and the test will execute continuously. Tests that use this control should also support DiscontinueTest. 
Count(3) : The corresponding LoopControlParameter is interpreted as a loop count (uint32), indicating the number of times the test should be repeated with a single invocation of a test method by a CIM client. 
Timer (= 4) : The corresponding LoopControlParameter is interpreted as an initial value (uint32) for a test loop timer, given in seconds. The looping is terminated when this timer has lapsed. 
ErrorCount (= 5) : The corresponding LoopControl Parameter is interpreted as an error count (uint32). The loop will continue until the number of errors that have occurred exceeds the ErrorCount. Note: the ErrorCount only refers to hard test errors; it does not include soft errors or warnings.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "Other" "Continuous" "Count" "Timer"
                   "ErrorCount"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticSettingData.LoopControlParameter"
                   "CIM_DiagnosticSettingData.OtherLoopControlDescriptions"
                   "CIM_DiagnosticServiceCapabilities.SupportedLoopControl")))
                :INITFORM NIL)
               (OTHERLOOPCONTROLDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherLoopControlDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "This property provides additional information for LoopControl when the corresponding value is set to 1 ('Other').")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticSettingData.LoopControlParameter"
                   "CIM_DiagnosticSettingData.LoopControl")))
                :INITFORM NIL)
               (LOGOPTIONS (ARRAY UINT16) :CIM-NAME "LogOptions" :QUALIFIERS
                ((:DESCRIPTION
                  "The LogOptions property is used to specify the types of data that SHOULD be logged by the diagnostic service. Any number of values may be specified in the array. Note that the default behavior is for nothing to be logged. 
The AMOUNT of data to be logged can be controlled for each value selected by specifying a VerbosityLevel value. Verbosity may not apply to all LogOptions values, in which case the default VerbosityLevel of \"Standard\" SHOULD be used. 
The RecordForLog produced by running a service MUST be tagged with a RecordType that corresponds to one of these log option values. 
Following is a brief description of the available log options: 
* \"Other\" (value = 1): Details are given in the corresponding OtherLogOptionsDescriptions entry. 
* \"Results\" (value = 2): Log the results obtained by running the service. This is the most common value for reporting the service results. 
* \"Subtests\" (value= 3): Log a test summary report upon completion of each subtest and each loop iteration. The summary reports SHOULD state whether the individual subtest or iteration passed or failed and list relevant error codes and respective error counts. 
* \"Actions\" (value = 4): Log corrective action and instructional messages to guide service personnel; for example, a prioritized list of actions to perform in order to isolate a failure or correct a problem. When ordering steps or prioritizing actions, a number should proceed the text; for example, 1) Do this first, 2) Do this next, etc. 
* \"Warnings\" (value = 5): Log warning messages; for example, 'device will be taken off line', 'test is long-running' or 'available memory is low'. The VerbosityLevel value specified for the Warnings option is related to the severity of the warnings logged; for instance, one would specify a high level of verbosity to get all warnings logged, regardless of severity, and a low level of verbosity to have only the most severe warnings logged. 
* \"Status\" (value = 6): Log status messages; for example, state information for the driver, device, or system. 
* \"Device Errors\" (value = 7): Log errors related to the managed element being serviced. 
* \"Service Errors\" (value = 8): Log errors related to the service itself rather than the element being serviced, such as 'Resource Allocaton Failure'. 
* \"Setting Data\" (value=9): Log the property values of the DiagnosticSettingData object used to configure the service. 
*\"Statistics\" (value = 10): Log statistical messages; for example, packets sent per second. 
* \"Hardware Configuration\" (value = 11): Log messages that contain information about the hardware configuration as viewed by the service; for example, vendor, version, FRU identification, and location information. The format and contents of this property is element dependent. Examples are: SCSI ID, LPTx, PCI Slot Number, and Dimm#. 
* \"Software Configuration\" (value = 12): Log messages that contain information about the software environment as viewed by the service; for example, the name and version of all the critical software elements controlling the device under test. Each configuration message SHOULD have the following common format: Element name; element type; manufacturer name; version; for example, 'Miniport driver; SCSI; Intel; Version 1.2'. 
* \"Reference\" (value = 13): Log the keys of an CIM object of of interest; for example, the element under test, or a data file. 
* \"Debug\" (value = 14): Log debug messages. These messages are vendor specific.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "0x8000"))
                 (:VALUES
                  ("Unknown" "Other" "Results" "Subtests" "Actions" "Warnings"
                   "Status" "Device Errors" "Service Errors" "Setting Data"
                   "Statistics" "Hardware Configuration"
                   "Software Configuration" "References" "Debug"
                   "No Log Options"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticSettingData.OtherLogOptionsDescriptions"
                   "CIM_DiagnosticServiceCapabilities.SupportedLogOptions"
                   "CIM_DiagnosticServiceRecord.RecordType"
                   "CIM_DiagnosticSettingData.VerbosityLevel")))
                :INITFORM NIL)
               (OTHERLOGOPTIONSDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherLogOptionsDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "Provides additional information regarding the types of test messages that are logged when the property LogOptions includes the value 1 (Other).")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticSettingData.LogOptions")))
                :INITFORM NIL)
               (LOGSTORAGE (ARRAY UINT16) :CIM-NAME "LogStorage" :QUALIFIERS
                ((:DESCRIPTION
                  "The LogStorage setting property indicates which types of supported storage should be used by the Diagnostic Service for logging of the data specified in LogOptions. 
The values are: 
\"DiagnosticLog\" (Value = 2): Use the DiagnosticLog and DiagnosticRecord classes. 
\"MessageLog\" (Value = 3): Use the MessageLog class and its methods. 
\"File\" (Value = 4): Write data to a file.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES
                  ("Unknown" "Other" "DiagnosticLog" "MessageLog" "File"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticSettingData.OtherLogStorageDescriptions"
                   "CIM_DiagnosticServiceCapabilities.SupportedLogStorage")))
                :INITFORM NIL)
               (OTHERLOGSTORAGEDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherLogStorageDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "This property provides additional information for LogStorage when the corresponding value is set to 1 (\"Other\").")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticSettingData.LogStorage")))
                :INITFORM NIL)
               (VERBOSITYLEVEL (ARRAY UINT16) :CIM-NAME "VerbosityLevel"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A client may want to specify the desired volume or detail logged by a diagnostic service. This property is applied to a corresponding logging option, acting as a qualifier on its description. Three levels of verbosity are defined as follows: 
* \"Minimum\" (value=2): Specified if the least amount of information is desired; for example, Pass or Fail. 
* \"Standard\" (value=3): This is the standard level of messaging provided by the service. It is the form most likely to be used if no verbosity value is specified (default). 
* \"Full\" (value=4): Specified when all information, regardless of size, is desired. 
Note that VerbosityLevel is a subjective property and relates to the degree of detail, not an absolute metric. A client simply specifies its desired level of detail and the provider publishes its data in accordance with this desired level of detail. 
Verbosity may not apply to all LogOptions values, in which case the default VerbosityLevel of \"Standard\" SHOULD be used.")
                 (:VALUE-MAP ("2" "3" "4"))
                 (:VALUES ("Minimum" "Standard" "Full")) (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticSettingData.LogOptions")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_DiagnosticSettingData")
              (:QUALIFIERS (:VERSION "2.22.0")
               (:UML-PACKAGE-PATH "CIM::System::Diagnostics")
               (:DESCRIPTION
                "Specific diagnostic test parameters and execution instructions are defined by this class. To provide more detailed Settings for a type of test (i.e., additional properties), subclassing is appropriate.")))