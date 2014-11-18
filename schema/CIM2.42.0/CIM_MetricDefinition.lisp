
;; Compiled from #P"/home/frank/quicklisp/local-projects/climbe/schema/CIM2.42.0/CIM_MetricDefinition.xml"

(in-package #:climbe)


(DEFCIM-CLASS CIM_METRICDEFINITION (CIM_BASEMETRICDEFINITION)
              ((ID STRING :CIM-NAME "Id" :QUALIFIERS
                ((:OVERRIDE "Id")
                 (:DESCRIPTION
                  "A 16 byte value that uniquely identifies the Metric Definition. The use of OSF UUID/GUIDs is recommended.")
                 (:MAX-LEN "16") :KEY)
                :INITFORM NIL)
               (VALIDITY UINT16 :CIM-NAME "Validity" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumerated value describing when the Metric may be considered valid. Some metrics are valid only at the beginning of a transaction (e.g., bytes to print), while the transaction is running (e.g., percent complete), or when the transaction is finished (e.g., pages printed). If a metric is valid at more than one of the enumerated values, such as both when the unit of work starts and when it stops, it is recommended to not use Validity.")
                 (:VALUE-MAP ("1" "2" "3"))
                 (:VALUES ("At Start" "In Middle" "At Stop")))
                :INITFORM NIL)
               (NAME STRING :CIM-NAME "Name" :QUALIFIERS
                ((:DESCRIPTION
                  "The name of the metric. This name does not have to be unique, but should be descriptive and may contain blanks."))
                :INITFORM NIL)
               (DATATYPE UINT16 :CIM-NAME "DataType" :QUALIFIERS
                ((:DESCRIPTION
                  "The data type of the metric. For example, \"boolean\" (value=1) or \"datetime\" (=3) may be specified. These types represent the datatypes defined for CIM.")
                 (:VALUE-MAP
                  ("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13"
                   "14"))
                 (:VALUES
                  ("boolean" "char16" "datetime" "real32" "real64" "sint16"
                   "sint32" "sint64" "sint8" "string" "uint16" "uint32"
                   "uint64" "uint8")))
                :INITFORM NIL)
               (CALCULABLE UINT16 :CIM-NAME "Calculable" :QUALIFIERS
                ((:DESCRIPTION
                  "An enumerated value that describes the characteristics of the metric, for purposes of performing calculations. The property can take one of the following values: 
1=\"Non-calculable\" -> a string. Arithmetic makes no sense. 
2=\"Summable\" -> It is reasonable to sum this value over many instances of e.g., UnitOfWork, such as the number of files processed in a backup job. For example, if each backup job is a UnitOfWork, and each job backs up 27,000 files on average, then it makes sense to say that 100 backup jobs processed 2,700,000 files. 
3=\"Non-summable\" -> It does not make sense to sum this value over many instances of UnitOfWork. An example would be a metric that measures the queue length when a job arrives at a server. If each job is a UnitOfWork, and the average queue length when each job arrives is 33, it does not make sense to say that the queue length for 100 jobs is 3300. It does make sense to say that the mean is 33.")
                 (:VALUE-MAP ("1" "2" "3"))
                 (:VALUES ("Non-calculable" "Summable" "Non-summable")))
                :INITFORM NIL)
               (UNITS STRING :CIM-NAME "Units" :QUALIFIERS
                ((:DESCRIPTION
                  "Identifies the specific units of a value. Examples are Bytes, Packets, Jobs, Files, Milliseconds, and Amps."))
                :INITFORM NIL)
               (ISCONTINUOUS BOOLEAN :CIM-NAME "IsContinuous" :QUALIFIERS
                ((:DESCRIPTION
                  "IsContinuous indicates whether or not the metric value is continuous or scalar. Performance metrics are an example of a linear metric. Examples of non-linear metrics include error codes or operational states. Continuous metrics can be compared using the \"greater than\" relation."))
                :INITFORM NIL)
               (CHANGETYPE UINT16 :CIM-NAME "ChangeType" :QUALIFIERS
                ((:DESCRIPTION
                  "ChangeType indicates how the metric value changes, in the form of typical combinations of finer grain attributes such as direction change, minimum and maximum values, and wrapping semantics. 
0=\"Unknown\": The metric designer did not qualify the ChangeType. 
2=\"N/A\": If the \"IsContinuous\" property is \"false\", ChangeType does not make sense and MUST be is set to \"N/A\". 
3=\"Counter\": The metric is a counter metric. These have non-negative integer values which increase monotonically until reaching the maximum representable number and then wrap around and start increasing from 0. Such counters, also known as rollover counters, can be used for instance to count the number of network errors or the number of transactions processed. The only way for a client application to keep track of wrap arounds is to retrieve the value of the counter in appropriately short intervals. 
4=\"Gauge\": The metric is a gauge metric. These have integer or float values that can increase and decrease arbitrarily. A gauge MUST NOT wrap when reaching the minimum or maximum representable number, instead, the value \"sticks\" at that number. Minimum or maximum values inside of the representable value range at which the metric value \"sticks\", may or may not be defined. 
Vendors may extend this property in the vendor reserved range.")
                 (:VALUE-MAP ("0" "2" "3" "4" "5..32767" "32768..65535"))
                 (:VALUES
                  ("Unknown" "N/A" "Counter" "Gauge" "DMTF Reserved"
                   "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BaseMetricDefinition.IsContinuous")))
                :INITFORM NIL)
               (TIMESCOPE UINT16 :CIM-NAME "TimeScope" :QUALIFIERS
                ((:DESCRIPTION
                  "TimeScope indicates the time scope to which the metric value applies. 
0=\"Unknown\" indicates the time scope was not qualified by the metric designer, or is unknown to the provider. 
2=\"Point\" indicates that the metric applies to a point in time. On the corresponding BaseMetricValue instances, TimeStamp specifies the point in time and Duration is always 0. 
3=\"Interval\" indicates that the metric applies to a time interval. On the corresponding BaseMetricValue instances, TimeStamp specifies the end of the time interval and Duration specifies its duration. 
4=\"StartupInterval\" indicates that the metric applies to a time interval that began at the startup of the measured resource (i.e. the ManagedElement associated by MetricDefForMe). On the corresponding BaseMetricValue instances, TimeStamp specifies the end of the time interval. If Duration is 0, this indicates that the startup time of the measured resource is unknown. Else, Duration specifies the duration between startup of the resource and TimeStamp.")
                 (:VALUE-MAP ("0" "2" "3" "4" "5..32767" "32768..65535"))
                 (:VALUES
                  ("Unknown" "Point" "Interval" "StartupInterval"
                   "DMTF Reserved" "Vendor Reserved"))
                 (:MODEL-CORRESPONDENCE
                  ("CIM_BaseMetricValue.TimeStamp"
                   "CIM_BaseMetricValue.Duration")))
                :INITFORM NIL)
               (GATHERINGTYPE UINT16 :CIM-NAME "GatheringType" :QUALIFIERS
                ((:DESCRIPTION
                  "GatheringType indicates how the metric values are gathered by the underlying instrumentation. This allows the client application to choose the right metric for the purpose. 
0=\"Unknown\": Indicates that the GatheringType is not known. 
2=\"OnChange\": Indicates that the CIM metric values get updated immediately when the values inside of the measured resource change. The values of OnChange metrics truly reflect the current situation within the resource at any time. An example is the number of logged on users that gets updated immediately as users log on and off. 
3=\"Periodic\": Indicates that the CIM metric values get updated periodically. For instance, to a client application, a metric value applying to the current time will appear constant during each gathering interval, and then jumps to the new value at the end of each gathering interval. 
4=\"OnRequest\": Indicates that the CIM metric value is determined each time a client application reads it. The values of OnRequest metrics truly return the current situation within the resource if somebody asks for it. However, they do not change \"unobserved\", and therefore subscribing for value changes of OnRequest metrics is NOT RECOMMENDED.")
                 (:VALUE-MAP ("0" "2" "3" "4" "5..32767" "32768..65535"))
                 (:VALUES
                  ("Unknown" "OnChange" "Periodic" "OnRequest" "DMTF Reserved"
                   "Vendor Reserved")))
                :INITFORM NIL)
               (PROGRAMMATICUNITS STRING :CIM-NAME "ProgrammaticUnits"
                :QUALIFIERS
                ((:DESCRIPTION
                  "Identifies the specific units of a value. The value of this property shall be a legal value of the Programmatic Units qualifier as defined in Appendix C.1 of DSP0004 V2.4 or later."))
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
               (BREAKDOWNDIMENSIONS (ARRAY STRING) :CIM-NAME
                "BreakdownDimensions" :QUALIFIERS
                ((:DESCRIPTION
                  "Defines one or more strings that can be used to refine (break down) queries against the BaseMetricValues along a certain dimension. An example is a transaction name, allowing the break down of the total value for all transactions into a set of values, one for each transaction name. Other examples might be application system or user group name. The strings are free format and should be meaningful to the end users of the metric data. The strings indicate which break down dimensions are supported for this metric definition, by the underlying instrumentation."))
                :INITFORM NIL))
              (:CIM-NAME "CIM_MetricDefinition")
              (:QUALIFIERS (:VERSION "2.7.0")
               (:UML-PACKAGE-PATH "CIM::Metrics::UnitOfWork")
               (:DESCRIPTION
                "The metrics that are associated with a UnitOfWork. These metrics usually describe some aspect of a UnitOfWork such as how much work was done, or the size of the UnitOfWork. For example, the size of a print job or the number of pages printed could be metrics of a 'print' UnitOfWork.")))