
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_LogEntry.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LOGENTRY (CIM_RECORDFORLOG)
              ((INSTANCEID STRING :CIM-NAME "InstanceID" :QUALIFIERS
                (:KEY (:OVERRIDE "InstanceID")
                 (:DESCRIPTION
                  "Within the scope of the instantiating Namespace, InstanceID opaquely and uniquely identifies an instance of this class. In order to ensure uniqueness within the NameSpace, the value of InstanceID SHOULD be constructed using the following 'preferred' algorithm: 
<OrgID>:<LocalID> 
Where <OrgID> and <LocalID> are separated by a colon ':', and where <OrgID> MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity creating/defining the InstanceID, or is a registered ID that is assigned to the business entity by a recognized global authority (This is similar to the <Schema Name>_<Class Name> structure of Schema class names.) In addition, to ensure uniqueness <OrgID> MUST NOT contain a colon (':'). When using this algorithm, the first colon to appear in InstanceID MUST appear between <OrgID> and <LocalID>. 
<LocalID> is chosen by the business entity and SHOULD not be re-used to identify different underlying (real-world) elements. If the above 'preferred' algorithm is not used, the defining entity MUST assure that the resultant InstanceID is not re-used across any InstanceIDs produced by this or other providers for this instance's NameSpace. 
For DMTF defined instances, the 'preferred' algorithm MUST be used with the <OrgID> set to 'CIM'."))
                :INITFORM NIL)
               (LOGINSTANCEID STRING :CIM-NAME "LogInstanceID" :QUALIFIERS
                ((:DESCRIPTION "The containing Log's InstanceID.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (LOGNAME STRING :CIM-NAME "LogName" :QUALIFIERS
                ((:DESCRIPTION
                  "The containing Log's Name. This property is available for backwards continuity with CIM_LogRecord.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (RECORDID STRING :CIM-NAME "RecordID" :QUALIFIERS
                ((:DESCRIPTION
                  "RecordID may be used to provide a representation of log entry ordering or pointers/handles for log entries.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (CREATIONTIMESTAMP DATETIME :CIM-NAME "CreationTimeStamp"
                :QUALIFIERS
                ((:DESCRIPTION
                  "A LogEntry may include a timestamp for the entry."))
                :INITFORM NIL)
               (MESSAGEID STRING :CIM-NAME "MessageID" :QUALIFIERS
                ((:DESCRIPTION
                  "A string that uniquely identifies, within the scope of the OwningEntity, the format of the Message.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_LogEntry.Message" "CIM_LogEntry.MessageArguments")))
                :INITFORM NIL)
               (MESSAGE STRING :CIM-NAME "Message" :QUALIFIERS
                ((:DESCRIPTION
                  "The formatted message. This message is constructed by combining some or all of the dynamic elements specified in the MessageArguments property with the static elements uniquely identified by the MessageID in a message registry or other catalog associated with the OwningEntity.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_LogEntry.MessageID" "CIM_LogEntry.MessageArguments")))
                :INITFORM NIL)
               (OWNINGENTITY STRING :CIM-NAME "OwningEntity" :QUALIFIERS
                ((:DESCRIPTION
                  "A string that uniquely identifies the entity that owns the definition of the format of the Message described in this instance. OwningEntity MUST include a copyrighted, trademarked or otherwise unique name that is owned by the business entity or standards body defining the format."))
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
                :INITFORM NIL)
               (MESSAGEARGUMENTS (ARRAY STRING) :CIM-NAME "MessageArguments"
                :QUALIFIERS
                ((:DESCRIPTION
                  "An array containing the dynamic content of the message.
Each DYNAMIC_ELEMENT for the message referred to by the MessageID property shall be contained in MessageArguments whether the DYNAMIC_ELEMENT is included in the Message or not.
In addition, the entries in MessageArguments need to be in the same order as the DYNAMIC_ELEMENTs.")
                 (:MODEL-CORRESPONDENCE
                  ("CIM_LogEntry.Message" "CIM_LogEntry.MessageID")))
                :INITFORM NIL))
              (:CIM-NAME "CIM_LogEntry")
              (:QUALIFIERS (:VERSION "2.27.0")
               (:UML-PACKAGE-PATH "CIM::System::Logs")
               (:DESCRIPTION
                "The LogEntry object can describe the definitional format for entries in a Log, or can be used to instantiate the actual entries in the Log.")))