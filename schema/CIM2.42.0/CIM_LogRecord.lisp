
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_LogRecord.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_LOGRECORD (CIM_RECORDFORLOG)
              ((LOGCREATIONCLASSNAME STRING :CIM-NAME "LogCreationClassName"
                :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping Log's CreationClassName.")
                 (:MAX-LEN "256")
                 (:PROPOGATED "CIM_MessageLog.CreationClassName"))
                :INITFORM NIL)
               (LOGNAME STRING :CIM-NAME "LogName" :QUALIFIERS
                (:KEY (:DESCRIPTION "The scoping Log's Name.") (:MAX-LEN "256")
                 (:PROPOGATED "CIM_MessageLog.Name"))
                :INITFORM NIL)
               (CREATIONCLASSNAME STRING :CIM-NAME "CreationClassName"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "CreationClassName indicates the name of the class or the subclass used in the creation of an instance. When used with the other key properties of this class, this property allows all instances of this class and its subclasses to be uniquely identified.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (RECORDID STRING :CIM-NAME "RecordID" :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "RecordID, with the MessageTimestamp property, serve to uniquely identify the LogRecord within a MessageLog. Note that this property is different than the RecordNumber parameters of the MessageLog methods. The latter are ordinal values only, useful to track position when iterating through a Log. On the other hand, RecordID is truly an identifier for an instance of LogRecord. It may be set to the record's ordinal position, but this is not required.")
                 (:MAX-LEN "256"))
                :INITFORM NIL)
               (MESSAGETIMESTAMP DATETIME :CIM-NAME "MessageTimestamp"
                :QUALIFIERS
                (:KEY
                 (:DESCRIPTION
                  "A LogRecord's key structure includes a timestamp for the entry. If the timestamp for the entry is unknown, the value 99990101000000.000000+000 SHOULD be used."))
                :INITFORM NIL)
               (DATAFORMAT STRING :CIM-NAME "DataFormat" :QUALIFIERS
                ((:DEPRECATED ("CIM_LogRecord.RecordFormat"))
                 (:DESCRIPTION
                  "A free-form string describing the LogRecord's data structure."))
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
                :INITFORM NIL))
              (:CIM-NAME "CIM_LogRecord")
              (:QUALIFIERS (:VERSION "2.11.0")
               (:UML-PACKAGE-PATH "CIM::System::Logs")
               (:DESCRIPTION
                "The LogRecord object can describe the definitional format for entries in a MessageLog, or can be used to instantiate the actual records in the Log. The latter approach provides a great deal more semantic definition and management control over the individual entries in a MessageLog, than do the record manipulation methods of the Log class. It is recommended that the data in individual Log entries be modeled using subclasses of LogRecord, to avoid the creation of LogRecords with one property (such as RecordData) without semantics. 
Definitional formats for LogRecords could be specified by establishing a naming convention for the RecordID and Message Timestamp key properties.")))