
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DiagnosticSetting.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DIAGNOSTICSETTING (CIM_SETTING)
              ((SETTINGID STRING :CIM-NAME "SettingID" :QUALIFIERS
                (:KEY (:OVERRIDE "SettingID")
                 (:DESCRIPTION
                  "In order to ensure uniqueness within the NameSpace, the value of SettingID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the SettingID, or is a registered ID that is assigned to the business entity by a recognized global authority. (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in SettingID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant SettingID is not re-used across any SettingIDs produced by this or other providers for this instance's NameSpace. 
A preferred value for <LocalID> is a timestamp (CIM DateTime). For example, ACME:19980525133015.0000000-300")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (TESTWARNINGLEVEL UINT16 :CIM-NAME "TestWarningLevel"
                :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_DiagnosticSetting.LogOptions"
                   "CIM_DiagnosticSetting.VerbosityLevel"))
                 :WRITE
                 (:DESCRIPTION
                  "This property is being deprecated because the TestWarningLevel and LogOptions properties serve the same purpose. It is deprecated in lieu of using the LogOptions ('Warnings') property in conjunction with VerbosityLevel to specify this information. The 'Missing Resources' and 'Testing Impacts' values are not included directly in LogOptions, but they are expected to be recorded in the resulting DiagnosticServiceRecord object. 

Sets the level of warning messages to be logged. 
If for example no warning information is required, the level would be set to \"No Warnings\" (value=0). Using \"Missing Resources\" (value=1) will cause warnings to be generated when required resources or hardware are not found. Setting the value to 2, \"Testing Impacts\", results in both missing resources and 'test impact' warnings (for example, multiple retries required) to be reported.")
                 (:VALUE-MAP ("0" "1" "2" "3"))
                 (:VALUES
                  ("No Warnings" "Missing Resources" "Testing Impacts"
                   "All Warnings")))
                :INITFORM NIL)
               (REPORTSOFTERRORS BOOLEAN :CIM-NAME "ReportSoftErrors"
                :QUALIFIERS
                ((:DEPRECATED ("CIM_DiagnosticSetting.LogOptions")) :WRITE
                 (:DESCRIPTION
                  "When this flag is true, the diagnostic test will report 'soft errors'. In this context, a soft error is a message from the diagnostic reporting a known defect in the hardware or driver configuration, or execution environment. Examples are: 'Not enough memory', 'Driver IOCTL not implemented', 'Video RAM compare failed during polygon fill test (A known defect in the video chipset)', etc."))
                :INITFORM NIL)
               (REPORTSTATUSMESSAGES BOOLEAN :CIM-NAME "ReportStatusMessages"
                :QUALIFIERS
                ((:DEPRECATED ("CIM_DiagnosticSetting.LogOptions")) :WRITE
                 (:DESCRIPTION
                  "When this flag is true, the diagnostic test will report 'status messages'. In this context, a status message indicates that the diagnostic code is at a checkpoint. Examples are: \"Completion of phase 1\", \"Complex pattern\", etc."))
                :INITFORM NIL)
               (HALTONERROR BOOLEAN :CIM-NAME "HaltOnError" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "When this flag is true, the test will halt after finding the first error."))
                :INITFORM NIL)
               (QUICKMODE BOOLEAN :CIM-NAME "QuickMode" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "When this flag is true, the test software should attempt to run in an accelerated fashion either by reducing the coverage or number of tests performed."))
                :INITFORM NIL)
               (PERCENTOFTESTCOVERAGE UINT8 :CIM-NAME "PercentOfTestCoverage"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Requests the diagnostic software to reduce test coverage to the specified percentage. For example, a hard drive scan test could be asked to run at 50%. The most effective way to accomplish this is for the test software to scan every other track, as opposed to only scanning the first half of a drive. It is assumed that the effectiveness of the test is impacted proportional to the percentage of testing requested. Permissible values for this property range from 0 to 100.")
                 (NIL "Percent") (:MIN-VALUE "0") (:MAX-VALUE "100")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticServiceCapabilities.SupportedServiceModes")))
                :INITFORM NIL)
               (OTHERLOOPCONTROLDESCRIPTION STRING :CIM-NAME
                "OtherLoopControlDescription" :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_DiagnosticSetting.OtherLoopControlDescriptions"))
                 :WRITE
                 (:DESCRIPTION
                  "This property is deprecated and replaced with an array. 
It provides additional information for LoopControl when its value is set to 1 ('Other').")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticSetting.LoopControlParameter")))
                :INITFORM NIL)
               (RESULTPERSISTENCE UINT32 :CIM-NAME "ResultPersistence"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The ResultPersistence property is a directive from a diagnostic client to a diagnostic provider. It allows the client to specify to the diagnostic service provider how long to persist the messages that result from execution of a diagnostic service. This applies to instances of DiagnosticResult as well as the preferred use of DiagnosticServiceRecord. The timeout period starts upon completion of the diagnostic action described by the DiagnosticService. 

Here is a summary of the choices and behaviors for different ResultPersistence values: 
0 = \"No Persistence\": 
Setting the timer to zero tells the provider not to persist the diagnostic result. The diagnostic information is only available while the diagnostic is executing or at its conclusion. 
Value > 0 and < 0xFFFFFFFF = \"Persist With TimeOut\": 
Setting the ResultPersistenceOption to a integer will cause the DiagnosticResult to be persisted for that number of seconds. At the end of that time, the DiagnosticResult may be deleted by the diagnostic service provider. 
0xFFFFFFFF = \"Persist Forever\": 
By setting the timeout value to the very large value, 0xFFFFFFFF, the provider shall persist results forever. In this case, the client MUST bear the responsibility for deleting them.")
                 (NIL "Seconds"))
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
               (ELEMENTNAME STRING :CIM-NAME "ElementName" :QUALIFIERS
                ((:DESCRIPTION
                  "A user-friendly name for the object. This property allows each instance to define a user-friendly name in addition to its key properties, identity data, and description information. 
Note that the Name property of ManagedSystemElement is also defined as a user-friendly name. But, it is often subclassed to be a Key. It is not reasonable that the same property can convey both identity and a user-friendly name, without inconsistencies. Where Name exists and is not a Key (such as for instances of LogicalDevice), the same information can be present in both the Name and ElementName properties. Note that if there is an associated instance of CIM_EnabledLogicalElementCapabilities, restrictions on this properties may exist as defined in ElementNameMask and MaxElementNameLen properties defined in that class."))
                :INITFORM NIL)
               (LOOPCONTROLPARAMETER (ARRAY STRING) :CIM-NAME
                "LoopControlParameter" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Array entries contain parameters corresponding to entries in the LoopControl array, limiting the number of times a test should be repeated with a single invocation of a test method by a CIM client.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE ("CIM_DiagnosticSetting.LoopControl")))
                :INITFORM NIL)
               (LOOPCONTROL (ARRAY UINT16) :CIM-NAME "LoopControl" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "LoopControl, used in conjunction with LoopControlParameter, sets one or more loop control mechanisms that limits the number of times a test should be repeated with a single invocation of a test method by a CIM client. There is an array-positional correspondence between LoopControl entries & LoopControlParameter entries. The entries in these coupled arrays of loop controls can be used in a logical OR fashion to achieve the desired loop control. For example, if a client wants to loop a test 1000 times, but quit if a timer runs out, it could set both controls into the LoopControl array as two separate entries in each array. The looping test will terminate when the first of the two ORed conditions are met. 
The descriptions for each loop control are given below: 
Unknown (= 0) 
Other (= 1) : Additional detail may be found in OtherLoopControlDescriptions. 
Continuous (= 2) : The corresponding LoopControl Parameter is ignored and the test will execute continuously. Tests that use this control should also support DiscontinueTest. 
Count(=3) : The corresponding LoopControlParameter is interpreted as a loop count (uint32), indicating the number of times the test should be repeated with a single invocation of a test method by a CIM client. 
Timer (= 4) : The corresponding LoopControlParameter is interpreted as an initial value (uint32) for a test loop timer, given in seconds. The looping is terminated when this timer has lapsed. 
ErrorCount (= 5) : The corresponding LoopControl Parameter is interpreted as an error count (uint32). The loop will continue until the number of errors that have occurred exceeds the ErrorCount. Note: the ErrorCount only refers to hard test errors; it does not include soft errors or warnings.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "Other" "Continuous" "Count" "Timer"
                   "ErrorCount"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticSetting.LoopControlParameter"
                   "CIM_DiagnosticSetting.OtherLoopControlDescriptions"
                   "CIM_DiagnosticServiceCapabilities.SupportedLoopControl")))
                :INITFORM NIL)
               (OTHERLOOPCONTROLDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherLoopControlDescriptions" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "This property provides additional information for LoopControl when the corresponding value is set to 1 ('Other').")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticSetting.LoopControlParameter"
                   "CIM_DiagnosticSetting.LoopControl")))
                :INITFORM NIL)
               (LOGOPTIONS (ARRAY UINT16) :CIM-NAME "LogOptions" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The LogOptions property is used to specify the types of data that SHOULD be logged by the diagnostic service. Any number of values may be specified in the array. Note that the default behavior is for nothing to be logged. 
The AMOUNT of data to be logged can be controlled for each value selected by specifying a VerbosityLevel value. Verbosity may not apply to all LogOptions values, in which case the default VerbosityLevel of \"Standard\" SHOULD be used. 
The RecordForLog produced by running a service MUST be tagged with a RecordType that corresponds to one of these log option values. 
Following is a brief description of the available log options: 
* \"Other\" (value = 1): Details are given in the corresponding OtherLogOptionsDescriptions entry. 
* \"Results\" (value = 2): Log the results obtained by running the service. This is the most common value for reporting the service results. 
* \"Subtests\" (value = 3): Log a test summary report upon completion of each subtest and each loop iteration. The summary reports SHOULD state whether the individual subtest or iteration passed or failed and list relevant error codes and respective error counts. 
* \"Actions\" (value = 4): Log corrective action and instructional messages to guide service personnel; for example, a prioritized list of actions to perform in order to isolate a failure or correct a problem. When ordering steps or prioritizing actions, a number should proceed the text; for example, 1) Do this first, 2) Do this next, etc. 
* \"Warnings\" (value = 5): Log warning messages; for example, 'device will be taken off line', 'test is long-running' or 'available memory is low'. The VerbosityLevel value specified for the Warnings option is related to the severity of the warnings logged; for instance, one would specify a high level of verbosity to get all warnings logged, regardless of severity, and a low level of verbosity to have only the most severe warnings logged. 
* \"Status\" (value = 6): Log status messages; for example, state information for the driver, device, or system. 
* \"Device Errors\" (value = 7): Log errors related to the managed element being serviced. 
* \"Service Errors\" (value = 8): Log errors related to the service itself rather than the element being serviced, such as 'Resource Allocaton Failure'. 
* \"Setting Data\" (value=9): Log the property values of the DiagnosticSetting object used to configure the service. 
* \"Statistics\" (value = 10): Log statistical messages; for example, packets sent per second. 
* \"Hardware Configuration\" (value = 11): Log messages that contain information about the hardware configuration as viewed by the service; for example, vendor, version, FRU identification, and location information. The format and contents of this property is element dependent. Examples are: SCSI ID, LPTx, PCI Slot Number, and Dimm#. 
* \"Software Configuration\" (value = 12): Log messages that contain information about the software environment as viewed by the service; for example, the name and version of all the critical software elements controlling the device under test. Each configuration message SHOULD have the following common format: Element name; element type; manufacturer name; version; for example, 'Miniport driver; SCSI; Intel; Version 1.2'. 
* \"Reference\" (value = 13): Log the keys of an CIM object of of interest; for example, the element under test, or a data file. 
* \"Debug\" (value = 14): Log debug messages. These messages are vendor specific.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14" "15"))
                 (:VALUES
                  ("Unknown" "Other" "Results" "Subtests" "Actions" "Warnings"
                   "Status" "Device Errors" "Service Errors" "Setting Data"
                   "Statistics" "Hardware Configuration"
                   "Software Configuration" "References" "Debug"
                   "No Log Options"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticSetting.OtherLogOptionsDescriptions"
                   "CIM_DiagnosticServiceCapabilities.SupportedLogOptions"
                   "CIM_DiagnosticServiceRecord.RecordType"
                   "CIM_DiagnosticSetting.VerbosityLevel")))
                :INITFORM NIL)
               (OTHERLOGOPTIONSDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherLogOptionsDescriptions" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "Provides additional information regarding the types of test messages that are logged when the property LogOptions includes the value 1 (\"Other\").")
                 (:MODEL-CORRESPONDENCE ("CIM_DiagnosticSetting.LogOptions")))
                :INITFORM NIL)
               (LOGSTORAGE (ARRAY UINT16) :CIM-NAME "LogStorage" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "The LogStorage setting property indicates which types of supported storage should be used by the Diagnostic Service for logging of the data specified in LogOptions. 
The values are: 
\"DiagnosticRecordLog\" (Value = 2): Use the DiagnosticRecordLog and DiagnosticRecord classes. 
\"MessageLog\" (Value = 4): Use the MessageLog class and its methods. 
\"File\" (Value = 5): Write data to a file.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4"))
                 (:VALUES
                  ("Unknown" "Other" "DiagnosticRecordLog" "MessageLog"
                   "File"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticSetting.OtherLogStorageDescriptions"
                   "CIM_DiagnosticServiceCapabilities.SupportedLogStorage")))
                :INITFORM NIL)
               (OTHERLOGSTORAGEDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherLogStorageDescriptions" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "This property provides additional information for LogStorage when the corresponding value is set to 1 (\"Other\").")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE ("CIM_DiagnosticSetting.LogStorage")))
                :INITFORM NIL)
               (VERBOSITYLEVEL (ARRAY UINT16) :CIM-NAME "VerbosityLevel"
                :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "A client may want to specify the desired volume or detail logged by a diagnostic service. This property is applied to a corresponding logging option, acting as a qualifier on its description. Three levels of verbosity are defined as follows: 
* \"Minimum\" (value=2): Specified if the least amount of information is desired; for example, Pass or Fail. 
* \"Standard\" (value=3): This is the standard level of messaging provided by the service. It is the form most likely to be used if no verbosity value is specified (default). 
* \"Full\" (value=4): Specified when all information, regardless of size, is desired. 
Note that VerbosityLevel is a subjective property and relates to the degree of detail, not an absolute metric. A client simply specifies its desired level of detail and the provider publishes its data in accordance with this desired level of detail. 
Verbosity may not apply to all LogOptions values, in which case the default VerbosityLevel of \"Standard\" SHOULD be used.")
                 (:VALUE-MAP ("2" "3" "4"))
                 (:VALUES ("Minimum" "Standard" "Full")) (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE ("CIM_DiagnosticSetting.LogOptions")))
                :INITFORM NIL)
               (LOCALES (ARRAY STRING) :CIM-NAME "Locales" :QUALIFIERS
                (:WRITE
                 (:DESCRIPTION
                  "This property, along with the locale information in LocalizationCapabilities and DiagnosticServiceRecord, meets the requirement to specify locale for results produced by a diagnostic service. A locale indicates a particular geographical, political, or cultural region. The Locales property of the DiagnosticSetting class is an array of strings whose entries specify a language to be used in the formulation of information requested by or delivered to a client as a result of running a diagnostic service. It is specified by the client as an input parameter to the RunDiagnostic method, by virtue of its inclusion in this Setting class which is a parameter of the method. A single Setting object may specify more than one Locale. In this case, information MUST be returned in each language specified. 

Each array entry consists of three sub-strings, separated by underscores: 
- The first sub-string is the language code, as specified in ISO639. 
- The second sub-string is the country code, as specified in ISO3166. 
- The third sub-string is a variant, which is vendor specific. 
For example, US English appears as: \"en_US_WIN\", where the \"WIN\" variant would specify a Windows browser-specific collation (if one exists). Since the variant is not standardized, it is not commonly used and generally is limited to easily recognizable values (\"WIN\", \"UNIX\", \"EURO\", etc.) used in standard environments. The language and country codes are required; the variant may be empty.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_LocalizationCapabilities.SupportedOutputLocales")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_DiagnosticSetting")
              (:QUALIFIERS (:VERSION "2.9.0")
               (:UML-PACKAGE-PATH "CIM::System::Diagnostics")
               (:DESCRIPTION
                "Specific diagnostic test parameters and execution instructions are defined by this class. To provide more detailed Settings for a type of test (i.e., additional properties), subclassing is appropriate.")))
(DEFCIM-METHOD VERIFYOKTOAPPLYTOMSE
    ((INSTANCE CIM_DIAGNOSTICSETTING)
     (TIMETOAPPLY DATETIME "TimeToApply" :IN
      (:DESCRIPTION
       "TimeToApply can be either a specific time or a time interval."))
     (MUSTBECOMPLETEDBY DATETIME "MustBeCompletedBy" :IN
      (:DESCRIPTION "The required completion time for the method."))
     (MSE "CIM_ManagedSystemElement" "MSE" :IN
      (:DESCRIPTION "The ManagedSystemElement that is being verified.")))
    ((:CIM-NAME "VerifyOKToApplyToMSE")
     (:QUALIFIERS
      (:DESCRIPTION
       "The VerifyOKToApplyToMSE method is used to verify that this Setting can be applied to the referenced ManagedSystemElement at the given time or time interval. This method takes three input parameters: MSE (the Managed SystemElement that is being verified), TimeToApply (which, being a datetime, can be either a specific time or a time interval), and MustBeCompletedBy (which indicates the required completion time for the method). The return value should be 0 if it is okay to apply the Setting, 1 if the method is not supported, 2 if the Setting cannot be applied within the specified times, and any other number if an error occurred. In a subclass, the set of possible return codes could be specified using a ValueMap qualifier on the method. The strings to which the ValueMap contents are \"translated\" can also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD APPLYTOMSE
    ((INSTANCE CIM_DIAGNOSTICSETTING)
     (TIMETOAPPLY DATETIME "TimeToApply" :IN
      (:DESCRIPTION
       "TimeToApply can be either a specific time or a time interval."))
     (MUSTBECOMPLETEDBY DATETIME "MustBeCompletedBy" :IN
      (:DESCRIPTION "The required completion time for the method."))
     (MSE "CIM_ManagedSystemElement" "MSE" :IN
      (:DESCRIPTION
       "The ManagedSystemElement to which the Setting is being applied.")))
    ((:CIM-NAME "ApplyToMSE")
     (:QUALIFIERS
      (:DESCRIPTION
       "The ApplyToMSE method performs the actual application of the Setting to the referenced ManagedSystemElement. It takes three input parameters: MSE (the ManagedSystemElement to which the Setting is being applied), TimeToApply (which, being a datetime, can be either a specific time or a time interval), and MustBeCompletedBy (which indicates the required completion time for the method). Note that the semantics of this method are that individual Settings are either wholly applied or not applied at all to their target ManagedSystemElement. The return value should be 0 if the Setting is successfully applied to the referenced ManagedSystemElement, 1 if the method is not supported, 2 if the Setting was not applied within the specified times, and any other number if an error occurred. In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are \"translated\" can also be specified in the subclass as a Values array qualifier. 
Note: If an error occurs when applying the Setting to a ManagedSystemElement, the Element must be configured as it was when the \"Apply\" attempt began. That is, the Element should not be left in an indeterminate state."))))
(DEFCIM-METHOD VERIFYOKTOAPPLYTOCOLLECTION
    ((INSTANCE CIM_DIAGNOSTICSETTING)
     (TIMETOAPPLY DATETIME "TimeToApply" :IN
      (:DESCRIPTION
       "TimeToApply can be either a specific time or a time interval."))
     (MUSTBECOMPLETEDBY DATETIME "MustBeCompletedBy" :IN
      (:DESCRIPTION "The required completion time for the method."))
     (COLLECTION "CIM_CollectionOfMSEs" "Collection" :IN
      (:DESCRIPTION
       "The Collection of ManagedSystemElements that is being verified."))
     (CANNOTAPPLY (ARRAY STRING) "CanNotApply" :IN :OUT
      (:DESCRIPTION
       "A string array that lists the keys of the ManagedSystemElements to which the Setting cannot be applied.")))
    ((:CIM-NAME "VerifyOKToApplyToCollection")
     (:QUALIFIERS
      (:DESCRIPTION
       "The VerifyOKToApplyToCollection method is used to verify that this Setting can be applied to the referenced Collection of ManagedSystemElements, at the given time or time interval, without causing adverse effects to either the Collection itself or its surrounding environment. The net effect is to execute the VerifyOKToApply method against each of the Elements that are aggregated by the Collection. This method takes three input parameters: Collection (the Collection of ManagedSystemElements that is being verified), TimeToApply (which, being a datetime, can be either a specific time or a time interval), and MustBeCompletedBy (which indicates the required completion time for the method). The return value should be 0 if it is okay to apply the Setting, 1 if the method is not supported, 2 if the Setting cannot be applied within the specified times, and any other number if an error occurred. One output parameter, CanNotApply, is defined, which is a string array that lists the keys of the ManagedSystemElements to which the Setting cannot be applied. This parameter enables those Elements to be revisited and either fixed or have other corrective action taken on them. 
In a subclass, the set of possible return codes could be specified, using a ValueMap qualifier on the method. The strings to which the ValueMap contents are \"translated\" can also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD APPLYTOCOLLECTION
    ((INSTANCE CIM_DIAGNOSTICSETTING)
     (TIMETOAPPLY DATETIME "TimeToApply" :IN
      (:DESCRIPTION
       "TimeToApply can be either a specific time or a time interval."))
     (CONTINUEONERROR BOOLEAN "ContinueOnError" :IN
      (:DESCRIPTION
       "True means to continue processing when an error is encountered."))
     (MUSTBECOMPLETEDBY DATETIME "MustBeCompletedBy" :IN
      (:DESCRIPTION "The required completion time for the method."))
     (COLLECTION "CIM_CollectionOfMSEs" "Collection" :IN
      (:DESCRIPTION "The Collection of ManagedSystemElements to be applied."))
     (CANNOTAPPLY (ARRAY STRING) "CanNotApply" :IN :OUT
      (:DESCRIPTION
       "A string array that lists the keys of the ManagedSystemElements to which the Setting could not be applied.")))
    ((:CIM-NAME "ApplyToCollection")
     (:QUALIFIERS
      (:DESCRIPTION
       "The ApplyToCollection method performs the application of the Setting to the referenced Collection of ManagedSystemElements. The net effect is to execute the ApplyToMSE method against each of the Elements that are aggregated by the Collection. If the input value ContinueOnError is false, this method applies the Setting to all Elements in the Collection until it encounters an error. In the case of an error, the method stops execution, logs the key of the Element that caused the error in the CanNotApply array, and issues a return code of 2. If the input value ContinueOnError is true, then this method applies the Setting to all of the ManagedSystemElements in the Collection, and reports the failed Elements in the array, CanNotApply. For the latter, processing will continue until the method is applied to all Elements in the Collection, regardless of any errors encountered. The key of each ManagedSystemElement to which the Setting could not be applied is logged into the CanNotApply array. This method takes four input parameters: Collection (the Collection of Elements to which the Setting is being applied), TimeToApply (which, being a datetime, can be either a specific time or a time interval), ContinueOnError (true indicates to continue processing when an error is encountered), and MustBeCompletedBy (which indicates the required completion time for the method). The return value should be 0 if the Setting is successfully applied to the referenced Collection, 1 if the method is not supported, 2 if the Setting was not applied within the specified times, 3 if the Setting cannot be applied using the input value for ContinueOnError, and any other number if an error occurred. One output parameter, CanNotApplystring, is defined, which is an array that lists the keys of the ManagedSystemElements to which the Setting could not be applied. This output parameter has meaning only when the ContinueOnError parameter is true. 
In a subclass, the set of possible return codes could be specified using a ValueMap qualifier on the method. The strings to which the ValueMap contents are \"translated\" can also be specified in the subclass as a Values array qualifier. 
Note: If an error occurs when applying the Setting to a ManagedSystemElement in the Collection, the Element must be configured as it was when the \"Apply\" attempt began. That is, the Element should not be left in an indeterminate state."))))
(DEFCIM-METHOD VERIFYOKTOAPPLYINCREMENTALCHANGETOMSE
    ((INSTANCE CIM_DIAGNOSTICSETTING)
     (TIMETOAPPLY DATETIME "TimeToApply" :IN
      (:DESCRIPTION
       "TimeToApply can be either a specific time or a time interval."))
     (MUSTBECOMPLETEDBY DATETIME "MustBeCompletedBy" :IN
      (:DESCRIPTION "The required completion time for the method."))
     (MSE "CIM_ManagedSystemElement" "MSE" :IN
      (:DESCRIPTION
       "The ManagedSystemElement for which the Setting is being verified."))
     (PROPERTIESTOAPPLY (ARRAY STRING) "PropertiesToApply" :IN
      (:DESCRIPTION
       "A list of the property names whose values will be verified.")))
    ((:CIM-NAME "VerifyOKToApplyIncrementalChangeToMSE")
     (:QUALIFIERS
      (:DESCRIPTION
       "The VerifyOKToApplyIncrementalChangeToMSE method is used to verify that a subset of the properties in this Setting can be applied to the referenced ManagedSystemElement at the given time or time interval. This method takes four input parameters: MSE (the ManagedSystemElement that is being verified), TimeToApply (which, being a datetime, can be either a specific time or a time interval), MustBeCompletedBy (which indicates the required completion time for the method), and a PropertiesToApply array (which contains a list of the property names whose values will be verified). If the array is null or empty or contains the string \"ALL\" as a property name, then all Settings properties will be verified. If it is set to \"NONE\", then no Settings properties will be verified. The return value should be 0 if it is okay to apply the Setting, 1 if the method is not supported, 2 if the Setting cannot be applied within the specified times, and any other number if an error occurred. In a subclass, the set of possible return codes could be specified using a ValueMap qualifier on the method. The strings to which the ValueMap contents are \"translated\" can also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD APPLYINCREMENTALCHANGETOMSE
    ((INSTANCE CIM_DIAGNOSTICSETTING)
     (TIMETOAPPLY DATETIME "TimeToApply" :IN
      (:DESCRIPTION
       "TimeToApply can be either a specific time or a time interval."))
     (MUSTBECOMPLETEDBY DATETIME "MustBeCompletedBy" :IN
      (:DESCRIPTION "The required completion time for the method."))
     (MSE "CIM_ManagedSystemElement" "MSE" :IN
      (:DESCRIPTION
       "The ManagedSystemElement to which the Setting is being applied."))
     (PROPERTIESTOAPPLY (ARRAY STRING) "PropertiesToApply" :IN
      (:DESCRIPTION
       "A list of the property names whose values will be applied.")))
    ((:CIM-NAME "ApplyIncrementalChangeToMSE")
     (:QUALIFIERS
      (:DESCRIPTION
       "The ApplyIncrementalChangeToMSE method performs the actual application of a subset of the properties in the Setting to the referenced ManagedSystemElement. It takes four input parameters: MSE (the ManagedSystem Element to which the Setting is being applied), TimeToApply (which, being a datetime, can be either a specific time or a time interval), MustBeCompletedBy (which indicates the required completion time for the method), and a PropertiesToApply array (which contains a list of the property names whose values will be applied). If a property is not in this list, it will be ignored by the Apply. If the array is null, empty, or contains the string \"ALL\" as a property name, then all Settings properties will be applied. If it is set to \"NONE\", then no Settings properties will be applied. 
Note that the semantics of this method are that individual Settings are either wholly applied or not applied at all to their target ManagedSystemElement. The return value should be 0 if the Setting is successfully applied to the referenced ManagedSystemElement, 1 if the method is not supported, 2 if the Setting was not applied within the specified times, and any other number if an error occurred. In a subclass, the set of possible return codes could be specified using a ValueMap qualifier on the method. The strings to which the ValueMap contents are \"translated\" can also be specified in the subclass as a Values array qualifier. 
Note: If an error occurs when applying the Setting to a ManagedSystemElement, the Element must be configured as it was when the \"Apply\" attempt began. That is, the Element should not be left in an indeterminate state."))))
(DEFCIM-METHOD VERIFYOKTOAPPLYINCREMENTALCHANGETOCOLLECTION
    ((INSTANCE CIM_DIAGNOSTICSETTING)
     (TIMETOAPPLY DATETIME "TimeToApply" :IN
      (:DESCRIPTION
       "TimeToApply can be either a specific time or a time interval."))
     (MUSTBECOMPLETEDBY DATETIME "MustBeCompletedBy" :IN
      (:DESCRIPTION "The required completion time for the method."))
     (COLLECTION "CIM_CollectionOfMSEs" "Collection" :IN
      (:DESCRIPTION
       "The Collection of ManagedSystemElements for which the setting is being verified."))
     (PROPERTIESTOAPPLY (ARRAY STRING) "PropertiesToApply" :IN
      (:DESCRIPTION
       "A list of the property names whose values will be verified."))
     (CANNOTAPPLY (ARRAY STRING) "CanNotApply" :IN :OUT
      (:DESCRIPTION
       "A string array that lists the keys of the ManagedSystemElements to which the Setting cannot be applied.")))
    ((:CIM-NAME "VerifyOKToApplyIncrementalChangeToCollection")
     (:QUALIFIERS
      (:DESCRIPTION
       "The VerifyOKToApplyIncrementalChangeToCollection method is used to verify that a subset of the properties in this Setting can be applied to the referenced Collection of ManagedSystemElements at the given time or time interval, without causing adverse effects to either the Collection itself or its surrounding environment. The net effect is to execute the VerifyOKToApplyIncrementalChangeToMSE method against each of the Elements that are aggregated by the Collection. This method takes four input parameters: Collection (the Collection of ManagedSystemElements that is being verified), TimeToApply (which, being a datetime, can be either a specific time or a time interval), MustBeCompletedBy (which indicates the required completion time for the method), and a PropertiesToApply array (which contains a list of the property names whose values will be verified). If the array is null or empty or contains the string \"all\" as a property name, all Settings properties will be verified. If it is set to \"none\" then no Settings properties will be verified. The return value should be 0 if it is okay to apply the Setting, 1 if the method is not supported, 2 if the Setting cannot be applied within the specified times, and any other number if an error occurred. One output parameter, CanNotApply, is defined, which is a string array that lists the keys of the ManagedSystemElements to which the Setting cannot be applied. This parameter enables those Elements to be revisited and either fixed or have other corrective action taken on them. 
In a subclass, the set of possible return codes could be specified using a ValueMap qualifier on the method. The strings to which the ValueMap contents are \"translated\" can also be specified in the subclass as a Values array qualifier."))))
(DEFCIM-METHOD APPLYINCREMENTALCHANGETOCOLLECTION
    ((INSTANCE CIM_DIAGNOSTICSETTING)
     (TIMETOAPPLY DATETIME "TimeToApply" :IN
      (:DESCRIPTION "A specific time or a time interval."))
     (CONTINUEONERROR BOOLEAN "ContinueOnError" :IN
      (:DESCRIPTION
       "True indicates to continue processing when an error is encountered."))
     (MUSTBECOMPLETEDBY DATETIME "MustBeCompletedBy" :IN
      (:DESCRIPTION
       "This parameter indicates the required completion time for the method."))
     (COLLECTION "CIM_CollectionOfMSEs" "Collection" :IN
      (:DESCRIPTION
       "The Collection of Elements to which the Setting is being applied."))
     (PROPERTIESTOAPPLY (ARRAY STRING) "PropertiesToApply" :IN
      (:DESCRIPTION
       "A list of the property names whose values will be verified."))
     (CANNOTAPPLY (ARRAY STRING) "CanNotApply" :IN :OUT
      (:DESCRIPTION
       "A string array that lists the keys of the ManagedSystemElements to which the Setting cannot be applied.")))
    ((:CIM-NAME "ApplyIncrementalChangeToCollection")
     (:QUALIFIERS
      (:DESCRIPTION
       "The ApplyIncrementalChangeToCollection method performs the application of a subset of the properties in this Setting to the referenced Collection of ManagedSystemElements. The net effect is to execute the ApplyIncrementalChangeToMSE method against each of the Elements that are aggregated by the Collection. If the input value ContinueOnError is false, this method applies the Setting to all Elements in the Collection until it encounters an error, in which case it stops execution, logs the key of the Element that caused the error in the CanNotApply array, and issues a return code of 2. If the input value ContinueOnError is true, then this method applies the Setting to all of the ManagedSystemElements in the Collection, and reports the failed Elements in the array, CanNotApply. For the latter, processing will continue until the method is applied to all Elements in the Collection, regardless of any errors encountered. The key of each ManagedSystemElement to which the Setting could not be applied is logged into the CanNotApply array. This method takes four input parameters: Collection (the Collection of Elements to which the Setting is being applied), TimeToApply (which, being a datetime, can be either a specific time or a time interval), ContinueOnError (true indicates to continue processing when an error is encountered), MustBeCompletedBy (which indicates the required completion time for the method), and a PropertiesToApply array (which contains a list of the property names whose values will be applied). If a property is not in this list, it will be ignored by the Apply. If the array is null or empty or contains the string \"ALL\" as a property name, then all Settings properties will be applied. If it is set to \"NONE\", then no Settings properties will be applied. 
The return value should be 0 if the Setting is successfully applied to the referenced Collection, 1 if the method is not supported, 2 if the Setting was not applied within the specified time, 3 if the Setting cannot be applied using the input value for ContinueOnError, and any other number if an error occurred. One output parameter, CanNotApplystring, is defined, which is an array that lists the keys of the ManagedSystemElements to which the Setting could not be applied. This output parameter has meaning only when the ContinueOnError parameter is true. 
In a subclass, the set of possible return codes could be specified using a ValueMap qualifier on the method. The strings to which the ValueMap contents are \"translated\" can also be specified in the subclass as a Values array qualifier. 
Note: If an error occurs when applying the Setting to a ManagedSystemElement in the Collection, the Element must be configured as it was when the \"Apply\" attempt began. That is, the Element should not be left in an indeterminate state."))))