
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_DiagnosticRecord.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_DIAGNOSTICRECORD (CIM_RECORDFORLOG)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (SERVICENAME STRING :CIM-NAME "ServiceName" :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "This property should reflect the value of the underlying DiagnosticService.Name property.")
                 (:MODEL-CORRESPONDENCE ("CIM_DiagnosticService.Name")))
                :INITFORM NIL)
               (MANAGEDELEMENTNAME STRING :CIM-NAME "ManagedElementName"
                :QUALIFIERS
                (:REQUIRED
                 (:DESCRIPTION
                  "This property SHOULD reflect the value of the underlying ManagedElement.ElementName property.")
                 (:MODEL-CORRESPONDENCE ("CIM_ManagedElement.ElementName")))
                :INITFORM NIL)
               (EXPIRATIONDATE DATETIME :CIM-NAME "ExpirationDate" :QUALIFIERS
                ((:DESCRIPTION
                  "The date and time that the record instance should be deleted. The expiration datetime SHOULD be set when the record is fully populated with record data. The value SHOULD be calculated using the ResultPersistence property of the DiagnosticSetting class. Once the Expiration Date has been reached, record instances SHOULD be deleted as soon as possible.
If a ResultPersistence value is not provided, records MAY be deleted at any time.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticSetting.ResultPersistence")))
                :INITFORM NIL)
               (RECORDTYPE UINT16 :CIM-NAME "RecordType" :QUALIFIERS
                ((:DESCRIPTION
                  "The RecordType property specifies the nature of the data being entered into the ServiceRecord. The value in this property should match one of the values indicated by the DiagnosticSetting.LogOptions property. A brief summary of the various log options can be found in CIM_DiagnosticSetting.LogOptions.")
                 (:VALUE-MAP
                  ("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14"))
                 (:VALUES
                  ("Unknown" "Other" "Results" "Subtests" "Actions" "Warnings"
                   "Status" "Device Errors" "Service Errors" "Setting Data"
                   "Statistics" "Hardware Configuration"
                   "Software Configuration" "References" "Debug"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticSetting.LogOptions"
                   "CIM_DiagnosticRecord.OtherRecordTypeDescription")))
                :INITFORM NIL)
               (OTHERRECORDTYPEDESCRIPTION STRING :CIM-NAME
                "OtherRecordTypeDescription" :QUALIFIERS
                ((:DESCRIPTION
                  "When \"Other\" (value=1) is entered in the RecordType property, OtherRecordTypeDescription can be used to describe the message type.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_DiagnosticSetting.OtherLogOptionsDescriptions"
                   "CIM_DiagnosticRecord.RecordType")))
                :INITFORM NIL)
               (CREATIONTIMESTAMP DATETIME :CIM-NAME "CreationTimeStamp"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A timestamp indicating when the record was created."))
                :INITFORM NIL)
               (RECORDFORMAT STRING :CIM-NAME "RecordFormat" :QUALIFIERS
                ((:DESCRIPTION
                  "A string describing the data structure of the information in the property, RecordData. If the RecordFormat string is <empty>, RecordData should be interpreted as a free-form string. 

To describe the data structure of RecordData, the RecordFormat string should be constructed as follows: 
- The first character is a delimiter character and is used to parse the remainder of the string into sub-strings. 
- Each sub-string is separated by the delimiter character and should be in the form of a CIM property declaration (i.e., datatype and property name). This set of declarations may be used to interpret the similarly delimited RecordData property. 
For example, using a '*' delimiter, RecordFormat = \"*string ThisDay*uint32 ThisYear*datetime SomeTime\" 
may be used to interpret: RecordData = \"*This is Friday*2002*20020807141000.000000-300\".")
                 (:MODEL-CORRESPONDENCE ("CIM_RecordForLog.RecordData")))
                :INITFORM NIL)
               (RECORDDATA STRING :CIM-NAME "RecordData" :QUALIFIERS
                ((:DESCRIPTION "A string containing LogRecord data. 
If the corresponding RecordFormat property is <empty>, or cannot be parsed according to the recommended format, RecordData should be interpreted as a free-form string. If the RecordFormat property contains parseable format information (as recommended in the RecordFormat Description qualifier), the RecordData string SHOULD be parsed in accordance with this format. In this case, RecordData SHOULD begin with the delimiter character and this character SHOULD be used to separate substrings in the manner described. The RecordData string can then be parsed by the data consumer and appropriately typed.")
                 (:MODEL-CORRESPONDENCE ("CIM_RecordForLog.RecordFormat")))
                :INITFORM NIL)
               (LOCALE STRING :CIM-NAME "Locale" :QUALIFIERS
                ((:DESCRIPTION
                  "A locale indicates a particular geographical, political, or cultural region. The Locale specifies the language used in creating the RecordForLog data. If the Locale property is empty, it is assumed that the default locale is en_US (English). 
The locale string consists of three sub-strings, separated by underscores: 
- The first sub-string is the language code, as specified in ISO639. 
- The second sub-string is the country code, as specified in ISO3166. 
- The third sub-string is a variant, which is vendor specific. 
For example, US English appears as: \"en_US_WIN\", where the \"WIN\" variant would specify a Windows browser-specific collation (if one exists). Since the variant is not standardized, it is not commonly used and generally is limited to easily recognizable values (\"WIN\", \"UNIX\", \"EURO\", etc.) used in standard environments. The language and country codes are required; the variant may be empty."))
                :INITFORM NIL)
               (PERCEIVEDSEVERITY UINT16 :CIM-NAME "PerceivedSeverity"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An enumerated value that describes the severity of the Indication from the notifier's point of view: 
1 - Other, by CIM convention, is used to indicate that the Severity's value can be found in the OtherSeverity property. 
3 - Degraded/Warning should be used when its appropriate to let the user decide if action is needed. 
4 - Minor should be used to indicate action is needed, but the situation is not serious at this time. 
5 - Major should be used to indicate action is needed NOW. 
6 - Critical should be used to indicate action is needed NOW and the scope is broad (perhaps an imminent outage to a critical resource will result). 
7 - Fatal/NonRecoverable should be used to indicate an error occurred, but it's too late to take remedial action. 
2 and 0 - Information and Unknown (respectively) follow common usage. Literally, the Indication is purely informational or its severity is simply unknown.")
                 (:VALUE-MAP ("0" "1" "2" "3" "4" "5" "6" "7"))
                 (:VALUES
                  ("Unknown" "Other" "Information" "Degraded/Warning" "Minor"
                   "Major" "Critical" "Fatal/NonRecoverable"))
                 (:MAPPING-STRINGS
                  ("Recommendation.ITU|X733.Perceived severity")))
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
                :INITFORM NIL))
              (:CIM-NAME "CIM_DiagnosticRecord")
              (:QUALIFIERS (:VERSION "2.19.0")
               (:UML-PACKAGE-PATH "CIM::System::Diagnostics")
               (:DESCRIPTION
                "Data related to Diagnostics may be recorded in various DiagnosticRecord objects. The type of information that is recorded in a log is specified via the LogOptions property in DiagnosticSetting.")))