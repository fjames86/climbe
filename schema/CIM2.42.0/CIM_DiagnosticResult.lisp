
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DiagnosticResult.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DIAGNOSTICRESULT NIL
              ((DIAGNOSTICCREATIONCLASSNAME STRING :CIM-NAME
                "DiagnosticCreationClassName" :QUALIFIERS
                ((:DEPRECATED ("No value")) :KEY
                 (:DESCRIPTION "The scoping Test's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_DiagnosticTest.CreationClassName"))
                :INITFORM NIL)
               (DIAGNOSTICNAME STRING :CIM-NAME "DiagnosticName" :QUALIFIERS
                ((:DEPRECATED ("No value")) :KEY
                 (:DESCRIPTION "The scoping Test's Name.") (:MAX-LEN "256")
                 (:PROPOGATED "CIM_DiagnosticTest.Name"))
                :INITFORM NIL)
               (DIAGSYSTEMCREATIONCLASSNAME STRING :CIM-NAME
                "DiagSystemCreationClassName" :QUALIFIERS
                ((:DEPRECATED ("No value")) :KEY
                 (:DESCRIPTION "The scoping Test's SystemCreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_DiagnosticTest.SystemCreationClassName"))
                :INITFORM NIL)
               (DIAGSYSTEMNAME STRING :CIM-NAME "DiagSystemName" :QUALIFIERS
                ((:DEPRECATED ("No value")) :KEY
                 (:DESCRIPTION "The scoping Test's SystemName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_DiagnosticTest.SystemName"))
                :INITFORM NIL)
               (EXECUTIONID STRING :CIM-NAME "ExecutionID" :QUALIFIERS
                ((:DEPRECATED ("CIM_DiagnosticRecord.InstanceID")) :KEY
                 (:DESCRIPTION
                  "The Unique identifier for an instance of Diagnostic Results.")
                 (:MAX-LEN "1024"))
                :INITFORM NIL)
               (TIMESTAMP DATETIME :CIM-NAME "TimeStamp" :QUALIFIERS
                ((:DEPRECATED ("CIM_LogRecord.MessageTimestamp"))
                 (:DESCRIPTION
                  "The date and time the result was last updated."))
                :INITFORM NIL)
               (ISPACKAGE BOOLEAN :CIM-NAME "IsPackage" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "This property is being deprecated. Tests should be grouped at the test level, not by the model. /n If this property is TRUE, then this DiagnosticResult summarizes the results from the execution of a packaged set of DiagnosticTests. The Tests in the package can be identified by following the DiagnosticResultForTest association to the test and then using the DiagnosticTest InPackage aggregation. The individual Results can be broken out by instantiating DiagnosticResults for the individual lower level tests and aggregating into the 'summary' Result using the DiagnosticResultInPackage association."))
                :INITFORM NIL)
               (TESTSTARTTIME DATETIME :CIM-NAME "TestStartTime" :QUALIFIERS
                ((:DEPRECATED ("CIM_Job.StartTime"))
                 (:DESCRIPTION "The date and time when this test started."))
                :INITFORM NIL)
               (TESTCOMPLETIONTIME DATETIME :CIM-NAME "TestCompletionTime"
                :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION "The date and time when this test completed."))
                :INITFORM NIL)
               (TESTSTATE UINT16 :CIM-NAME "TestState" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Describes how the test is progressing. For example, if the test was discontinued, the TestState will be \"Stopped\" (value=5), or if testing is currently executing, TestState will be \"In Progress\" (4).")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5"))
                 (:VALUES
                  ("Unknown" "Other" "Passed" "Failed" "In Progress"
                   "Stopped"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticResult.OtherStateDescription")))
                :INITFORM NIL)
               (OTHERSTATEDESCRIPTION STRING :CIM-NAME "OtherStateDescription"
                :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "When \"Other\" (value=1) is entered in the TestState property, OtherStateDescription can be used to describe the test's state.")
                 (:MODEL-CORRESPONDENCE ("CIM_DiagnosticResult.TestState")))
                :INITFORM NIL)
               (ESTIMATEDTIMEOFPERFORMING UINT32 :CIM-NAME
                "EstimatedTimeOfPerforming" :QUALIFIERS
                ((:DEPRECATED ("No value"))
                 (:DESCRIPTION
                  "Estimated number of seconds to perform the Diagnostic Test indicated by the DiagnosticCreationClassName and DiagnosticName properties. After the test has completed, the actual elapsed time can be determined by subtracting the TestStartTime from the TestCompletionTime. A similar property is defined in the association, DiagnosticTest ForMSE. The difference between the two properties is that the value stored in the association is a generic test execution time for the Element and the Test. But, the value here (in DiagnosticResult) is the estimated time that this instance with the given settings would take to run the test. A CIM Consumer can compare this value with the value in the association DiagnosticTestForMSE to get an idea what impact their settings have on test execution.")
                 (NIL "Seconds")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticTestForMSE.EstimatedTimeOfPerforming")))
                :INITFORM NIL)
               (PERCENTCOMPLETE UINT8 :CIM-NAME "PercentComplete" :QUALIFIERS
                ((:DEPRECATED ("CIM_Job.PercentComplete"))
                 (:DESCRIPTION
                  "The percentage of the test that has executed thus far, if the TestState property is set to \"In Progress\" or the percentage of the complete test that was executed if the TestState property is set to any of the completed states (\"Passed\", \"Failed\" or \"Stopped\"). Final results may be based on less than 100% coverage due to the parameters defined in DiagnosticSetting (such as QuickMode, PercentOfTestCoverage or HaltOnError).")
                 (NIL "Percent") (:MIN-VALUE "0") (:MAX-VALUE "100"))
                :INITFORM NIL)
               (LOOPSFAILED UINT32 :CIM-NAME "LoopsFailed" :QUALIFIERS
                ((:DEPRECATED ("CIM_DiagnosticServiceRecord.LoopsFailed"))
                 (:DESCRIPTION
                  "Since some tests may be looped, it is useful to report how many iterations passed and failed. This is relevant in analyzing transitory failures. For example, if all the errors occurred in just one of 100 iterations, the device may be viewed as OK or marginal, to be monitored further rather then failed. Note: LoopsPassed & LoopsFailed should add up to the loops completed."))
                :INITFORM NIL)
               (LOOPSPASSED UINT32 :CIM-NAME "LoopsPassed" :QUALIFIERS
                ((:DEPRECATED ("CIM_DiagnosticServiceRecord.LoopsPassed"))
                 (:DESCRIPTION
                  "Since some tests may be looped, it is useful to report how many iterations passed and failed. This is relevant in analyzing transitory failures. For example if all the errors occurred in just one of 100 iterations, the device may be viewed as OK or marginal, to be monitored further rather then failed. Note: LoopsPassed & LoopsFailed should add up to the loops completed."))
                :INITFORM NIL)
               (TESTWARNINGLEVEL UINT16 :CIM-NAME "TestWarningLevel"
                :QUALIFIERS
                ((:DEPRECATED ("CIM_DiagnosticSetting.LogOptions")) :WRITE
                 (:DESCRIPTION
                  "Sets the level of warning messages to be logged. If for example no warning information is required, the level would be set to \"No Warnings\" (value=0). Using \"Missing Resources\" (value=1) will cause warnings to be generated when required resources or hardware are not found. Setting the value to 2, \"Testing Impacts\", results in both missing resources and 'test impact' warnings (for example, multiple retries required) to be reported.")
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
                ((:DEPRECATED ("CIM_DiagnosticSettingRecord.HaltOnError"))
                 :WRITE
                 (:DESCRIPTION
                  "When this flag is true, the test will halt after finding the first error."))
                :INITFORM NIL)
               (QUICKMODE BOOLEAN :CIM-NAME "QuickMode" :QUALIFIERS
                ((:DEPRECATED ("CIM_DiagnosticSettingRecord.QuickMode")) :WRITE
                 (:DESCRIPTION
                  "When this flag is true, the test software should attempt to run in an accelerated fashion either by reducing the coverage or number of tests performed."))
                :INITFORM NIL)
               (PERCENTOFTESTCOVERAGE UINT8 :CIM-NAME "PercentOfTestCoverage"
                :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_DiagnosticSettingRecord.PercentOfTestCoverage"))
                 :WRITE
                 (:DESCRIPTION
                  "Requests the diagnostic software to reduce test coverage to the specified percentage. For example, a hard drive scan test could be asked to run at 50%. The most effective way to accomplish this is for the test software to scan every other track, as opposed to only scanning the first half of a drive. It is assumed that the effectiveness of the test is impacted proportional to the percentage of testing requested. Permissible values for this property range from 0 to 100. 
This property may not be applicable to all tests. If it can be set for a test, the value 7 (\"Supports PercentOf TestCoverage\") should be entered into the DiagnosticTest's Characteristics array.")
                 (NIL "Percent") (:MIN-VALUE "0") (:MAX-VALUE "100")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticTest.Characteristics")))
                :INITFORM NIL)
               (TESTRESULTS (ARRAY STRING) :CIM-NAME "TestResults" :QUALIFIERS
                ((:DEPRECATED ("CIM_LogRecord.RecordData"))
                 (:DESCRIPTION
                  "TestResults stores one or more textual results from the execution of the DiagnosticTest(s) referenced by the DiagnosticCreationClassName and DiagnosticName properties. One entry is considered a cell location in the array. Each entry is time stamped and contains the following information, in the following format: 
LogOption|yyymmddhhttssoutc|TestName|message_text 
Where: 
LogOption = string identical to the LogOption value in DiagnosticSetting that was used to enable logging this message. 
yyyy = year, e.g. 2000 
mm = month (01 - 12) 
dd = day (01 - 31) 
hh = hour (00 - 24) 
tt = minute (00-59) 
ss = second (00-59) 
o = \"+\" or \"-\" indicating the sign of the UTC correction field 
utc = offset from UTC (Universal Coordinated Time) in minutes 
TestName = Internal test name or current internal subtest name that sent the message. 
Textual message = free form string that is the 'test result'.")
                 (:ARRAYTYPE "Ordered"))
                :INITFORM NIL)
               (ERRORCODE (ARRAY STRING) :CIM-NAME "ErrorCode" :QUALIFIERS
                ((:DEPRECATED ("CIM_DiagnosticServiceRecord.ErrorCode"))
                 (:DESCRIPTION
                  "If applicable, this string should contain one or more vendor specific error codes that the diagnostic service detected. These error codes may be used by the vendor for variety of purposes such as: fault data base indexing, field service trouble ticketing, product quality tracking, part failure history, etc. Since these codes are for vendor purposes they may assume any form. Details on suggested use cases will be left to white papers. The array of error codes has model correspondence with an ErrorCount array so the number of errors reported can be analyzed by individual error code.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE ("CIM_DiagnosticResult.ErrorCount")))
                :INITFORM NIL)
               (ERRORCOUNT (ARRAY UINT32) :CIM-NAME "ErrorCount" :QUALIFIERS
                ((:DEPRECATED ("CIM_DiagnosticServiceRecord.ErrorCount"))
                 (:DESCRIPTION
                  "Since some tests may detect transient and correctable errors such as a network diagnostic or memory test, an error count is useful to indicate the severity of the failure. This field contains an integer value of the number of errors detected by the test. The ErrorCount is an array with model correspondence to ErrorCode so that the test can report an ErrorCount on each type of error encountered. It is recommended that hard errors and correctable or recoverable errors be given different codes so that clients with knowledge of the error codes can evaluate correctable, recoverable, and hard errors independently.")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE ("CIM_DiagnosticResult.ErrorCode")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_DiagnosticResult")
              (:QUALIFIERS (:DEPRECATED ("CIM_DiagnosticServiceRecord"))
               (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::System::Diagnostics")
               (:DESCRIPTION
                "When a DiagnosticTest Service is running, test results are reported using a DiagnosticResult object, or one of its subclasses. A DiagnosticTest may be running because its Service is Started or due to an invocation of the RunTest method. Diagnostic Results are related to their Test via an instance of the DiagnosticResultsForMSE association. 
For every running of DiagnosticTest, a new instance of DiagnosticResult, or one of it's subclasses should be created.")))