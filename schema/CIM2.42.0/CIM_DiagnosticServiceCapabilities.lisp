
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DiagnosticServiceCapabilities.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DIAGNOSTICSERVICECAPABILITIES (CIM_CAPABILITIES)
              ((SUPPORTEDTESTWARNINGS UINT16 :CIM-NAME "SupportedTestWarnings"
                :QUALIFIERS
                ((:DEPRECATED
                  ("CIM_DiagnosticServiceCapabilities.SupportedLogOptions"))
                 (:DESCRIPTION
                  "This property is being deprecated because the TestWarningLevel and LogOptions properties serve the same purpose. 
Lists the level of warning messages that MAY be logged. If for example no warning information is required, the level would be set to \"No Warnings\" (value=0). Using \"Missing Resources\" (value=1) will cause warnings to be generated when required resources or hardware are not found. Setting the value to 2, \"Testing Impacts\", results in both missing resources and 'test impact' warnings (for example, multiple retries required) to be reported.")
                 (:VALUE-MAP ("2" "3" "4" "5"))
                 (:VALUES
                  ("No Warnings" "Missing Resources" "Testing Impacts"
                   "All Warnings")))
                :INITFORM "3")
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
                  "The user friendly name for this instance of Capabilities. In addition, the user friendly name can be used as a index property for a search of query. (Note: Name does not have to be unique within a namespace.)"))
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
               (SUPPORTEDSERVICEMODES (ARRAY UINT16) :CIM-NAME
                "SupportedServiceModes" :QUALIFIERS
                ((:DESCRIPTION
                  "The SupportedServiceModes property lists the operational modes that are supported by the Diagnostic Service. These modes may correspond to, but are not limited to, settings that may be applied to a Diagnostic Service.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7" "0x8000"))
                 (:VALUES
                  ("Unknown" "Other" "PercentOfTestCoverage" "QuickMode"
                   "HaltOnError" "ResultPersistence" "QueryTimeout"
                   "NonDestructive" "No Service Modes"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticServiceCapabilities.OtherSupportedServiceModesDescriptions")))
                :INITFORM NIL)
               (OTHERSUPPORTEDSERVICEMODESDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherSupportedServiceModesDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "Provides additional information for SupportedServiceModes when the corresponding value is set to 1 (\"Other\").")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticServiceCapabilities.SupportedServiceModes")))
                :INITFORM NIL)
               (SUPPORTEDLOOPCONTROL (ARRAY UINT16) :CIM-NAME
                "SupportedLoopControl" :QUALIFIERS
                ((:DESCRIPTION
                  "The SupportedLoopControl property lists the loop controls that are supported by the Diagnostic Service.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "0x8000"))
                 (:VALUES
                  ("Unknown" "Other" "Continuous" "Count" "Timer" "ErrorCount"
                   "No Loop Control"))
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticSettingData.LoopControl"
                   "CIM_DiagnosticServiceCapabilities.OtherSupportedLoopControlDescriptions")))
                :INITFORM NIL)
               (OTHERSUPPORTEDLOOPCONTROLDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherSupportedLoopControlDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "Provides additional information for SupportedLoopControl when the corresponding value is set to 1 (\"Other\").")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticServiceCapabilities.SupportedLoopControl")))
                :INITFORM NIL)
               (SUPPORTEDLOGOPTIONS (ARRAY UINT16) :CIM-NAME
                "SupportedLogOptions" :QUALIFIERS
                ((:DESCRIPTION
                  "The SupportedLogOptions property lists the log options that are supported by the Diagnostic Service.")
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
                  ("CIM_DiagnosticSettingData.LogOptions"
                   "CIM_DiagnosticServiceCapabilities.OtherSupportedLogOptionsDescriptions")))
                :INITFORM NIL)
               (OTHERSUPPORTEDLOGOPTIONSDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherSupportedLogOptionsDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "Provides additional information for SupportedLogOptions when the corresponding value is set to 1 (\"Other\").")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticServiceCapabilities.SupportedLogOptions")))
                :INITFORM NIL)
               (SUPPORTEDLOGSTORAGE (ARRAY UINT16) :CIM-NAME
                "SupportedLogStorage" :QUALIFIERS
                ((:DESCRIPTION
                  "The SupportedLogStorage property lists the storage options for logging that are supported by the Diagnostic Service. 
The values are: 
\"DiagnosticLog\" (Value = 2): Supports use of the DiagnosticLog class for aggregating DiagnosticRecords. 
\"MessageLog\" (Value = 3): Supports writing log information using the methods in the MessageLog class. 
\"File\" (Value = 4): Supports writing log information to a file.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "0x8000"))
                 (:VALUES
                  ("Unknown" "Other" "DiagnosticLog" "MessageLog" "File"
                   "No Log Storage"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticServiceCapabilities.OtherSupportedLogStorageDescriptions"
                   "CIM_DiagnosticSettingData.LogStorage")))
                :INITFORM NIL)
               (OTHERSUPPORTEDLOGSTORAGEDESCRIPTIONS (ARRAY STRING) :CIM-NAME
                "OtherSupportedLogStorageDescriptions" :QUALIFIERS
                ((:DESCRIPTION
                  "Provides additional information for SupportedLogStorage when the corresponding value is set to 1 (\"Other\").")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticServiceCapabilities.SupportedLogStorage")))
                :INITFORM NIL)
               (SUPPORTEDEXECUTIONCONTROLS (ARRAY UINT16) :CIM-NAME
                "SupportedExecutionControls" :QUALIFIERS
                ((:DESCRIPTION
                  "The SupportedExecutionControls property lists the job controls that are supported by the Diagnostic Service. The values are: 
(Value = 2) is deprecated. Previous versions defined this as \"Job Creation\" and was intended to indicate that a ConcreteJob instance will be created to control the diagnostic job launched by the diagnostic service. Since Job creation is REQUIRED, this attribute value is unnecessary and confusing. 
\"Kill Job\" (Value = 3): publishes that the diagnostic service implements the ConcreteJob.RequestStateChange(Kill) method. 
\"Suspend Job\" (Value = 4): publishes that the diagnostic service implements the ConcreteJob.RequestStateChange(Suspend) method. 
\"Terminate Job\" (Value = 5): publishes that the diagnostic service implements the ConcreteJob.RequestStateChange(Terminate) method.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "0x8000"))
                 (:VALUES
                  ("Unknown" "Other" "Reserved" "Kill Job" "Suspend Job"
                   "Terminate Job" "No Execution Controls"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticServiceCapabilities.OtherSupportedExecutionControlsDescriptions")))
                :INITFORM NIL)
               (OTHERSUPPORTEDEXECUTIONCONTROLSDESCRIPTIONS (ARRAY STRING)
                :CIM-NAME "OtherSupportedExecutionControlsDescriptions"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Provides additional information for SupportedExecutionControls when the corresponding value is set (\"Other\").")
                 (:ARRAYTYPE "Indexed")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticServiceCapabilities.SupportedExecutionControls")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_DiagnosticServiceCapabilities")
              (:QUALIFIERS (:VERSION "2.13.0")
               (:UML-PACKAGE-PATH "CIM::System::Diagnostics")
               (:DESCRIPTION
                "DiagnosticServiceCapabilities is a class that describes the capabilities of the diagnostic service. This provides the means for the diagnostic service to describe its abilities, limitations, and/or potential for use of various diagnostic service parameters. For example, what types of settings the diagnostic service supports.")))